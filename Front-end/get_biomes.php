<?php
header('Content-Type: application/json');
$mysqli = new mysqli('localhost', 'root', '', 'test');

if ($mysqli->connect_error) {
    echo json_encode(['error' => 'Échec de la connexion à la base de données.']);
    exit();
}

$query = "SELECT DISTINCT biome FROM enclosures";
$result = $mysqli->query($query);

if ($result) {
    $biomes = [];
    while ($row = $result->fetch_assoc()) {
        $biomes[] = $row['biome'];
    }
    echo json_encode(['biomes' => $biomes]);
} else {
    echo json_encode(['error' => 'Erreur lors de la récupération des biomes.']);
}

$mysqli->close();
?>