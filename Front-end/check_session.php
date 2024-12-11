<?php
session_start();

header('Content-Type: application/json');

// Vérifier si l'utilisateur est connecté
if (isset($_SESSION['user_id'])) {
    echo json_encode([
        'isLoggedIn' => true,
        'nom' => $_SESSION['nom'] ?? ''
    ]);
} else {
    echo json_encode(['isLoggedIn' => false]);
}
