<?php
// Connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "test";

$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("Échec de la connexion : " . $conn->connect_error);
}

// Vérifier si un ID d'enclos est passé
if (isset($_GET['id'])) {
    $enclosure_id = intval($_GET['id']);

    // Requête pour récupérer les informations de l'enclos
    $stmt = $conn->prepare("SELECT * FROM enclosures WHERE id = ?");
    $stmt->bind_param("i", $enclosure_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $enclosure = $result->fetch_assoc();
        echo "<h1>Enclos : " . htmlspecialchars($enclosure['name']) . "</h1>";
        echo "<p><strong>Description :</strong> " . htmlspecialchars($enclosure['description']) . "</p>";
        echo "<p><strong>Biome :</strong> " . htmlspecialchars($enclosure['biome']) . "</p>";
        echo "<p><strong>Statut :</strong> " . htmlspecialchars($enclosure['status']) . "</p>";
    } else {
        echo "<p>Enclos non trouvé.</p>";
    }
    $stmt->close();
} else {
    echo "<p>Aucun enclos sélectionné.</p>";
}

$conn->close();
?>
