<?php
header('Content-Type: application/json');
$mysqli = new mysqli('localhost', 'root', '', 'test');

if ($mysqli->connect_error) {
    echo json_encode(['error' => 'Échec de la connexion à la base de données.']);
    exit();
}

$input = json_decode(file_get_contents('php://input'), true);
$enclosureId = $input['enclosure_id'];
$mealTime = $input['meal_time'];

$stmt = $mysqli->prepare("INSERT INTO meal_times (enclosure_id, meal_time) VALUES (?, ?)");
$stmt->bind_param('is', $enclosureId, $mealTime);
$success = $stmt->execute();

echo json_encode(['success' => $success]);
$stmt->close();
$mysqli->close();
?>
