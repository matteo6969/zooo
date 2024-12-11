<?php
// Connexion à la base de données
$conn = new mysqli('localhost', 'root', '', 'test');

if ($conn->connect_error) {
    die(json_encode(['error' => 'Erreur de connexion à la base de données.']));
}

// Récupérer l'identifiant de l'enclos depuis l'URL
$enclosureId = intval($_GET['enclosure_id']);

// Requête pour récupérer les animaux liés à l'enclos
$result = $conn->query("SELECT id, name, image, description FROM animals WHERE enclosure_id = $enclosureId");

$animals = [];
while ($row = $result->fetch_assoc()) {
    $animals[] = $row;
}

// Retourner les données en JSON
echo json_encode($animals);
?>
