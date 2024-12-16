<?php
header('Content-Type: application/json');
$mysqli = new mysqli('localhost', 'root', '', 'test');

if ($mysqli->connect_error) {
    echo json_encode(['error' => 'Échec de la connexion à la base de données.']);
    exit();
}

// Récupérer les données POST
$data = json_decode(file_get_contents('php://input'), true);

$enclosure_id = $data['enclosure_id'] ?? null;
$status = $data['status'] ?? null;
$meal_time = $data['meal_time'] ?? null;

// Vérifier les paramètres requis
if (!$enclosure_id) {
    echo json_encode(['success' => false, 'error' => 'ID de l\'enclos manquant.']);
    exit();
}

// Construire la requête dynamiquement
$query = "UPDATE enclosures SET ";
$params = [];
$types = '';

// Ajouter les champs à mettre à jour
if ($status !== null) {
    $query .= "status = ?, ";
    $params[] = $status;
    $types .= 's';
}
if ($meal_time !== null) {
    $query .= "meal_time = ?, ";
    $params[] = $meal_time;
    $types .= 's';
}

// Retirer la dernière virgule
$query = rtrim($query, ', ');
$query .= " WHERE id = ?";
$params[] = $enclosure_id;
$types .= 'i';

// Préparer et exécuter la requête
$stmt = $mysqli->prepare($query);
if (!$stmt) {
    echo json_encode(['success' => false, 'error' => 'Échec de la préparation de la requête.']);
    exit();
}

$stmt->bind_param($types, ...$params);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'error' => $stmt->error]);
}

$stmt->close();
$mysqli->close();
?>
