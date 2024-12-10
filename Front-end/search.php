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

// Vérifier si le formulaire est soumis
if (isset($_GET['animal_name'])) {
    $animal_name = htmlspecialchars($_GET['animal_name']);

    // Requête pour chercher l'animal et son enclos
    $stmt = $conn->prepare("
        SELECT a.name AS animal_name, e.name AS enclosure_name, e.biome, e.id AS enclosure_id
        FROM animals a
        LEFT JOIN enclosures e ON a.enclosure_id = e.id
        WHERE a.name LIKE ?
    ");
    $like_animal_name = "%$animal_name%";
    $stmt->bind_param("s", $like_animal_name);
    $stmt->execute();
    $result = $stmt->get_result();

    // Affichage des résultats
    if ($result->num_rows > 0) {
        echo "<h1>Résultats pour '$animal_name'</h1>";
        while ($row = $result->fetch_assoc()) {
            echo "<p><strong>Animal :</strong> " . htmlspecialchars($row['animal_name']) . "</p>";
            echo "<p><strong>Biome :</strong> " . htmlspecialchars($row['biome']) . "</p>";
            echo "<p><strong>Enclos :</strong> " . htmlspecialchars($row['enclosure_name']) . "</p>";
            echo "<a href='enclosure.php?id=" . htmlspecialchars($row['enclosure_id']) . "'>Voir l'enclos</a>";
            echo "<hr>";
        }
    } else {
        echo "<p>Aucun résultat trouvé pour '$animal_name'.</p>";
    }
    $stmt->close();
} else {
    echo "<p>Veuillez entrer un nom d'animal pour rechercher.</p>";
}

$conn->close();
?>
