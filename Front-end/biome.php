<?php
header('Content-Type: application/json');

$host = 'localhost';
$dbname = 'test';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Vérifier l'action demandée
    $action = $_GET['action'] ?? '';

    switch ($action) {
        case 'get_animals':
            // Récupération des animaux pour un enclos donné
            if (isset($_GET['enclosure_id'])) {
                $enclosureId = intval($_GET['enclosure_id']);
                $stmt = $pdo->prepare("SELECT id, image, name, description FROM animals WHERE enclosure_id = ?");
                $stmt->execute([$enclosureId]);
                $animals = $stmt->fetchAll(PDO::FETCH_ASSOC);

                echo json_encode(['animals' => $animals]);
            } else {
                echo json_encode(['error' => 'Enclosure ID non fourni.']);
            }
            break;

        case 'get_enclosures':
            // Récupération des enclos pour un biome donné ou pour l'admin
            $admin = isset($_GET['admin']) && $_GET['admin'] === 'true';
            $biome = $_GET['biome'] ?? '';

            if ($admin) {
                $query = "
                    SELECT e.id, e.name, e.status, GROUP_CONCAT(a.name SEPARATOR ', ') AS animals
                    FROM enclosures e
                    LEFT JOIN animals a ON a.enclosure_id = e.id
                    GROUP BY e.id
                ";
                $stmt = $pdo->prepare($query);
                $stmt->execute();
            } else {
                $query = "SELECT id, name, description, status FROM enclosures WHERE biome = ?";
                $stmt = $pdo->prepare($query);
                $stmt->execute([$biome]);
            }

            $enclosures = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode(['enclosures' => $enclosures]);
            break;

        case 'get_biomes':
            // Récupération de la liste des biomes
            $query = "SELECT DISTINCT biome FROM enclosures";
            $stmt = $pdo->query($query);
            $biomes = $stmt->fetchAll(PDO::FETCH_COLUMN);

            echo json_encode(['biomes' => $biomes]);
            break;

        default:
            echo json_encode(['error' => 'Action non reconnue.']);
            break;
    }

} catch (PDOException $e) {
    echo json_encode(['error' => 'Erreur de connexion : ' . $e->getMessage()]);
}
