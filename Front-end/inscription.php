<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "zoo";

$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("Échec de la connexion : " . $conn->connect_error);
}

// Récupérer les données du formulaire
$nom = htmlspecialchars($_POST['nom']);
$email = htmlspecialchars($_POST['email']);
$mot_de_passe = password_hash($_POST['mot_de_passe'], PASSWORD_BCRYPT); // Hachage du mot de passe

// Insérer l'utilisateur dans la base
$sql = "INSERT INTO utilisateur (nom, email, mot_de_passe) VALUES ('$nom', '$email', '$mot_de_passe')";

if ($conn->query($sql) === TRUE) {
    echo "Inscription réussie. Vous pouvez maintenant vous connecter.";
    echo "<br><a href='connexion.html'>Se connecter</a>";
} else {
    echo "Erreur : " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
