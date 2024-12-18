<?php
session_start();
header('Content-Type: application/json');

$mysqli = new mysqli('localhost', 'root', '', 'test');

if ($mysqli->connect_error) {
    echo json_encode(['error' => 'Erreur de connexion à la base de données.']);
    exit();
}

$action = $_GET['action'] ?? '';

switch ($action) {
    case 'get_user_reviews':
        // Vérifier si l'utilisateur est connecté
        if (!isset($_SESSION['user_id'])) {
            echo json_encode(['error' => 'Vous devez être connecté pour voir vos avis.']);
            exit();
        }

        $user_id = $_SESSION['user_id'];
        $query = "
            SELECT r.id, r.enclosure_id, e.name AS enclosure_name, r.rating, r.comment, r.created_at
            FROM reviews r
            JOIN enclosures e ON r.enclosure_id = e.id
            WHERE r.user_id = ?
            ORDER BY r.created_at DESC
        ";
        $stmt = $mysqli->prepare($query);
        $stmt->bind_param('i', $user_id);
        $stmt->execute();
        $result = $stmt->get_result();

        $reviews = [];
        while ($row = $result->fetch_assoc()) {
            $reviews[] = $row;
        }

        echo json_encode(['reviews' => $reviews]);

        $stmt->close();
        break;

    case 'submit_review':
        // Vérifier si l'utilisateur est connecté
        if (!isset($_SESSION['user_id'])) {
            echo json_encode(['error' => 'Vous devez être connecté pour écrire un avis.']);
            exit();
        }

        // Récupération des données POST
        $data = json_decode(file_get_contents('php://input'), true);
        $user_id = $_SESSION['user_id'];
        $enclosure_id = $data['enclosure_id'] ?? null;
        $rating = $data['rating'] ?? null;
        $comment = $data['opinion'] ?? null;

        if (!$enclosure_id || !$rating || !$comment) {
            echo json_encode(['error' => 'Tous les champs sont requis.']);
            exit();
        }

        // Insérer l'avis dans la base de données
        $query = "INSERT INTO reviews (user_id, enclosure_id, rating, comment) VALUES (?, ?, ?, ?)";
        $stmt = $mysqli->prepare($query);
        $stmt->bind_param('iiis', $user_id, $enclosure_id, $rating, $comment);

        if ($stmt->execute()) {
            echo json_encode(['success' => 'Avis enregistré avec succès.']);
        } else {
            echo json_encode(['error' => 'Erreur lors de l\'enregistrement de l\'avis.']);
        }

        $stmt->close();
        break;

    default:
        echo json_encode(['error' => 'Action non reconnue.']);
        break;
}

$mysqli->close();
