<?php
header('Content-Type: application/json');
$mysqli = new mysqli('localhost', 'root', '', 'test');

if ($mysqli->connect_error) {
    echo json_encode(['error' => 'Échec de la connexion à la base de données.']);
    exit();
}

$biome = $_GET['biome'] ?? ''; // Filtre pour les biomes
$admin = $_GET['admin'] ?? false; // Paramètre pour afficher les animaux associés

// Requête principale
if ($admin) {
    // Récupérer les enclos avec les animaux pour la section admin
    $query = "
        SELECT e.id, e.name, GROUP_CONCAT(a.name) AS animals
        FROM enclosures e
        LEFT JOIN animals a ON a.enclosure_id = e.id
        GROUP BY e.id
    ";
} else {
    // Récupérer uniquement les enclos pour un biome
    $query = "SELECT id, name, description FROM enclosures WHERE biome = ?";
}

$stmt = $mysqli->prepare($query);

if (!$admin) {
    $stmt->bind_param('s', $biome);
}

$stmt->execute();
$result = $stmt->get_result();

if ($result) {
    $enclosures = [];
    while ($row = $result->fetch_assoc()) {
        if ($admin) {
            // Créer un tableau d'animaux si c'est pour l'admin
            $row['animals'] = $row['animals'] ? explode(',', $row['animals']) : [];
        }
        $enclosures[] = $row;
    }
    echo json_encode(['enclosures' => $enclosures]);
} else {
    echo json_encode(['error' => 'Erreur lors de la récupération des enclos.']);
}

$stmt->close();
$mysqli->close();
?>
