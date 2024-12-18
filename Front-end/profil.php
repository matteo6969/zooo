<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: connexion.html");
    exit();
}
if (isset($_GET['logout'])) {
    // Détruire la session et rediriger
    session_destroy();
    header("Location: connexion.html");
    exit();
}

$nom = $_SESSION['nom'];
$email = $_SESSION['email'];
$user_id = $_SESSION['user_id'];

// Vérifier si l'utilisateur est admin
$isAdmin = ($email === 'admin@isenzoo.com');

// Connexion à la base de données pour récupérer les avis
$mysqli = new mysqli('localhost', 'root', '', 'test');
if ($mysqli->connect_error) {
    die('Erreur de connexion : ' . $mysqli->connect_error);
}

$query = "
    SELECT r.enclosure_id, e.name AS enclosure_name, r.rating, r.comment, r.created_at
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

$stmt->close();
$mysqli->close();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil utilisateur</title>
    <link rel="stylesheet" href="profil.css?v=<?php echo time(); ?>">

</head>
<body>
    <header>
        <div class="logo">
            <a href="Accueil.html"><img src="public/logo.png" alt="Logo ISEN'ZOO"></a>
        </div>
        <nav class="nav-links">
            <a href="decouvrir.html">Découvrir le Parc</a>
            <a href="gestion-biomes.html">Les Biomes</a>
            <a href="services.html">Nos Services</a>
            <a href="billeterie.html">Billeterie</a>
        </nav>
        <div class="login">
            <a href="profil.php" class="profile-icon">
                <img src="public/profil.png" alt="Profil">
            </a>
        </div>
    </header>

    <main>
        <h1>Bienvenue, <?php echo htmlspecialchars($nom); ?>!</h1>
        <p><strong>Nom :</strong> <?php echo htmlspecialchars($nom); ?></p>
        <p><strong>Email :</strong> <?php echo htmlspecialchars($email); ?></p>

        <!-- Avis de l'utilisateur -->
        <section class="user-reviews-section">
            <h2>Vos Avis</h2>
            <?php if (empty($reviews)): ?>
                <p>Vous n'avez écrit aucun avis pour le moment.</p>
            <?php else: ?>
                <ul>
                    <?php foreach ($reviews as $review): ?>
                        <li>
                            <strong>Enclos :</strong> <?php echo htmlspecialchars($review['enclosure_name']); ?> <br>
                            <strong>Note :</strong> <?php echo htmlspecialchars($review['rating']); ?>/5 <br>
                            <strong>Commentaire :</strong> <?php echo htmlspecialchars($review['comment']); ?> <br>
                            <small><em>Posté le <?php echo date('d/m/Y à H:i', strtotime($review['created_at'])); ?></em></small>
                        </li>
                    <?php endforeach; ?>
                </ul>
            <?php endif; ?>
        </section>

        <!-- Lien vers la gestion des enclos pour l'admin -->
        <?php if ($isAdmin): ?>
            <button id="admin-enclosure-button" class="btn">Gestion des Enclos</button>
            <div id="admin-enclosure-management" style="display: none; padding: 20px; background-color: #fff; border-radius: 10px; color: #000;">
                <h2>Gestion des Enclos</h2>
                <div>
                    <label for="enclosure-select">Choisir un enclos :</label>
                    <select id="enclosure-select"></select>
                </div>
                <div>
                    <label for="status-select">Changer le statut :</label>
                    <select id="status-select">
                        <option value="open">Ouvert</option>
                        <option value="closed">Fermé</option>
                    </select>
                </div>
                <div>
                    <label for="meal-time">Ajouter un horaire de repas :</label>
                    <input type="time" id="meal-time">
                </div>
                <button id="apply-changes" class="btn">Appliquer les modifications</button>
            </div>
        <?php endif; ?>
        <a href="profil.php?logout=true" class="btn">Se déconnecter</a>
    </main>
    <?php if ($isAdmin): ?>
    <script src="admin.js"></script>
    <?php endif; ?>
</body>
</html>
