<?php
header('Content-Type: application/json');

$host = 'localhost'; // Remplacez par vos paramètres
$dbname = 'test'; // Remplacez par votre base de données
$username = 'root'; // Remplacez par votre utilisateur
$password = ''; // Remplacez par votre mot de passe

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if (isset($_GET['enclosure_id'])) {
        $enclosureId = intval($_GET['enclosure_id']);
        $stmt = $pdo->prepare("SELECT id, image, name, description FROM animals WHERE enclosure_id = ?");
        $stmt->execute([$enclosureId]);
        $animals = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode(['animals' => $animals]);
    } else {
        echo json_encode(['error' => 'Enclosure ID non fourni.']);
    }
} catch (PDOException $e) {
    echo json_encode(['error' => 'Erreur de connexion : ' . $e->getMessage()]);
}
?>
