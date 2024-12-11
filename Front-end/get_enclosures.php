<?php
header('Content-Type: application/json');
$mysqli = new mysqli('localhost', 'root', '', 'test');

if ($mysqli->connect_error) {
    echo json_encode(['error' => 'Échec de la connexion à la base de données.']);
    exit();
}

$biome = $_GET['biome'] ?? '';
$query = "SELECT id, name, description FROM enclosures WHERE biome = ?";
$stmt = $mysqli->prepare($query);
$stmt->bind_param('s', $biome);
$stmt->execute();
$result = $stmt->get_result();

if ($result) {
    $enclosures = [];
    while ($row = $result->fetch_assoc()) {
        $enclosures[] = $row;
    }
    echo json_encode(['enclosures' => $enclosures]);
} else {
    echo json_encode(['error' => 'Erreur lors de la récupération des enclos.']);
}

$stmt->close();
$mysqli->close();
?>
