<?php
// Configuration de la connexion à la base de données
$host = 'localhost'; // Serveur
$dbname = 'parc_animalier'; // Nom de la base de données
$username = 'root'; // Nom d'utilisateur MySQL (par défaut sur XAMPP)
$password = 'hello'; // Mot de passe MySQL (par défaut vide sur XAMPP)

// Connexion à la base de données
$db = new mysqli($host, $username, $password, $dbname);

// Vérification de la connexion
if ($db->connect_error) {
    die("Erreur de connexion : " . $db->connect_error);
}
?>
