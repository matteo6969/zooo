<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: connexion.html");
    exit();
}

$nom = $_SESSION['nom'];
$email = $_SESSION['email'];

// Vérifier si l'utilisateur est admin
$isAdmin = ($email === 'admin@isenzoo.com');
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil utilisateur</title>
    <link rel="stylesheet" href="profil.css">
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

        <!-- Lien vers la gestion des enclos pour l'admin -->
        <?php if ($email === "admin@isenzoo.com"): ?>
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
        <a href="logout.php" class="btn">Se déconnecter</a>
    </main>
    <?php if ($isAdmin): ?>
    <script src="admin.js"></script>
    <?php endif; ?>
    
</body>
</html>
