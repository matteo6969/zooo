<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: connexion.html");
    exit();
}

$nom = $_SESSION['nom'];
$email = $_SESSION['email'];
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil utilisateur</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            margin: 0;
            font-family: Poppins, sans-serif;
            color: #eee;
        }

        header {
            max-width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
            height: 70px;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 100;
            background-color: #000;
        }

        header .logo img {
            height: 60px;
            display: block;
        }

        header .nav-links {
            display: flex;
            gap: 20px;
        }

        header .nav-links a {
            color: #eee;
            font-weight: 600;
            text-decoration: none;
        }


        header .profile-icon img {
            height: 60px;
            object-fit: cover;
        }

        main {
            max-width: 400px;
            margin: 5em auto;
            background: rgba(255, 255, 255, 0.9);
            padding: 2em;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        main h1 {
            color: #475429;
            margin-bottom: 1em;
        }

        main p {
            font-size: 1.2em;
            color: #475429;
            margin: 0.5em 0;
        }

        .btn {
            display: inline-block;
            background-color: #475429;
            color: #fff;
            padding: 0.8em 1.5em;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 1em;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #a7a876;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('Public/image1.jpg') no-repeat center center/cover;
            z-index: -1;
        }
    </style>
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

        <a href="logout.php" class="btn">Se déconnecter</a>
    </main>
</body>
</html>
