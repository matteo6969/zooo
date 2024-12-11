<?php
header('Content-Type: application/json');
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "test";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(["error" => "Échec de connexion à la base de données."]));
}

$type = $_GET['type'] ?? '';
$id = $_GET['id'] ?? null;

if ($type === 'biomes') {
    $result = $conn->query("SELECT * FROM biomes");
    echo json_encode($result->fetch_all(MYSQLI_ASSOC));
} elseif ($type === 'enclosures' && $id) {
    $stmt = $conn->prepare("SELECT * FROM enclosures WHERE biome_id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    echo json_encode($stmt->get_result()->fetch_all(MYSQLI_ASSOC));
} elseif ($type === 'animals' && $id) {
    $stmt = $conn->prepare("SELECT * FROM animals WHERE enclosure_id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    echo json_encode($stmt->get_result()->fetch_all(MYSQLI_ASSOC));
} else {
    echo json_encode(["error" => "Type invalide ou ID manquant."]);
}
?>
