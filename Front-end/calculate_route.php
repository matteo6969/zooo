<?php
// Connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "test";

$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die(json_encode(["error" => "Échec de la connexion à la base de données."]));
}

// Récupérer les données depuis le formulaire
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $startPoint = htmlspecialchars(trim($_POST['start_point']));
    $endPoint = htmlspecialchars(trim($_POST['end_point']));

    // Vérifier que les deux points sont renseignés
    if (empty($startPoint) || empty($endPoint)) {
        echo json_encode(["error" => "Veuillez sélectionner un point de départ et une destination."]);
        exit();
    }

    // Rechercher l'itinéraire dans la base de données
    $stmt = $conn->prepare("
        SELECT description 
        FROM routes 
        WHERE start_point = ? AND end_point = ?
    ");
    $stmt->bind_param("ss", $startPoint, $endPoint);
    $stmt->execute();
    $result = $stmt->get_result();

    // Vérifier si un itinéraire a été trouvé
    if ($result->num_rows > 0) {
        $route = $result->fetch_assoc();
        echo json_encode(["route" => $route['description']]);
    } else {
        echo json_encode(["error" => "Aucun itinéraire défini pour \"$startPoint\" à \"$endPoint\"."]);
    }

    $stmt->close();
} else {
    echo json_encode(["error" => "Requête invalide."]);
}

$conn->close();
?>
