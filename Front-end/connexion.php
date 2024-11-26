<?php
// Informations de connexion à la base
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
$email = htmlspecialchars($_POST['email']);
$mot_de_passe = $_POST['mot_de_passe'];

// Vérifier si l'utilisateur existe
$sql = "SELECT * FROM utilisateur WHERE email = '$email'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $user = $result->fetch_assoc();
    // Vérifier le mot de passe
    if (password_verify($mot_de_passe, $user['mot_de_passe'])) {
        session_start();
        $_SESSION['utilisateur'] = $user['nom']; // Enregistrer le nom dans la session
        echo "Connexion réussie ! Bienvenue, " . $_SESSION['utilisateur'] . ".";
        echo "<br><a href='index.php'>Aller à l'accueil</a>";
    } else {
        echo "Mot de passe incorrect.";
    }
} else {
    echo "Aucun utilisateur trouvé avec cet email.";
}

$conn->close();
?>
