<?php
// Informations de connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "test";

// Création de la connexion à la base de données
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérification de la connexion
if ($conn->connect_error) {
    die("Échec de la connexion : " . $conn->connect_error);
}

// Vérifie si la requête est une requête POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Récupération et sécurisation des données du formulaire
    $nom = htmlspecialchars($_POST['nom']);
    $email = htmlspecialchars($_POST['email']);
    $mot_de_passe = password_hash($_POST['mot_de_passe'], PASSWORD_BCRYPT);

    // Préparation de la requête SQL pour insérer les données
    $stmt = $conn->prepare("INSERT INTO utilisateur (nom, email, mot_de_passe) VALUES (?, ?, ?)");
    if (!$stmt) {
        die("Erreur de préparation de la requête : " . $conn->error);
    }
    $stmt->bind_param("sss", $nom, $email, $mot_de_passe);

    // Exécution de la requête
    if ($stmt->execute()) {
        // Redirection vers la page de connexion
        header("Location: connexion.html");
        exit(); // Quitte le script après la redirection
    } else {
        // Affiche une erreur si l'insertion échoue
        echo "Erreur lors de l'insertion : " . $stmt->error;
    }

    // Fermeture de la requête préparée
    $stmt->close();
} else {
    // Message si la méthode n'est pas POST
    echo "Aucune donnée reçue.";
}

// Fermeture de la connexion à la base de données
$conn->close();
?>
