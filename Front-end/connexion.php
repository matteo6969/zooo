<?php
// Informations de connexion à la base
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "test";

// Connexion à la base de données
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("Échec de la connexion : " . $conn->connect_error);
}

// Vérifier que le formulaire a été soumis
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = htmlspecialchars($_POST['email']);
    $mot_de_passe = $_POST['mot_de_passe'];

    // Requête sécurisée pour vérifier si l'utilisateur existe
    $stmt = $conn->prepare("SELECT id, nom, email, mot_de_passe FROM utilisateur WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        // Vérifier le mot de passe
        if (password_verify($mot_de_passe, $user['mot_de_passe'])) {
            session_start(); // Démarrer la session
            // Stocker les données utilisateur dans la session
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['nom'] = $user['nom'];
            $_SESSION['email'] = $user['email'];

            // Rediriger vers la page de profil
            header("Location: profil.php");
            exit();
        } else {
            echo "Mot de passe incorrect. <a href='connexion.html'>Réessayer</a>";
        }
    } else {
        echo "Aucun utilisateur trouvé avec cet email. <a href='inscription.html'>Créer un compte</a>";
    }

    $stmt->close();
} else {
    echo "Aucune donnée reçue.";
}

$conn->close();
?>
