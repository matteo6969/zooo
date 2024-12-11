<?php
// Connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "test";

$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("Échec de la connexion : " . $conn->connect_error);
}

// Vérifier si le formulaire est soumis
$results = [];
if (isset($_GET['animal_name'])) {
    $animal_name = htmlspecialchars($_GET['animal_name']);

    // Requête pour chercher l'animal et son enclos
    $stmt = $conn->prepare("
        SELECT a.name AS animal_name, e.name AS enclosure_name, e.biome, e.id AS enclosure_id
        FROM animals a
        LEFT JOIN enclosures e ON a.enclosure_id = e.id
        WHERE a.name LIKE ?
    ");
    $like_animal_name = "%$animal_name%";
    $stmt->bind_param("s", $like_animal_name);
    $stmt->execute();
    $result = $stmt->get_result();

    // Récupérer les résultats
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $results[] = $row;
        }
    }
    $stmt->close();
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recherche d'Animal</title>
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif; /* Assure que Poppins est appliqué partout */
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
            padding-top: 80px; /* Compense la hauteur de l'en-tête fixe */
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

        header .nav-links a,
        header .login a {
            color: #eee;
            font-weight: 600;
            text-decoration: none; /* Supprime le soulignement */
        }

        header .nav-links a:hover,
        header .login a:hover {
            text-decoration: underline; /* Ajoute un soulignement au survol */
        }

        main {
            max-width: 800px;
            margin: 4em auto;
            padding: 2em;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            color: #475429;
        }

        .search-form {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 10px;
            margin-bottom: 2em;
        }

        .search-form input {
            flex: 1;
            padding: 0.8em;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
        }

        .search-form button {
            background-color: #475429;
            color: #fff;
            padding: 0.8em 1.5em;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .search-form button:hover {
            background-color: #a7a876;
        }

        .result-item {
            padding: 1em;
            border-bottom: 1px solid #ddd;
        }

        .result-item:last-child {
            border-bottom: none;
        }

        .result-item h3 {
            margin: 0;
            font-size: 1.5em;
        }

        .result-item p {
            margin: 0.5em 0;
            color: #555;
        }

        .result-item a {
            color: #475429;
            text-decoration: none;
            font-weight: bold;
        }

        .result-item a:hover {
            text-decoration: underline;
        }

        .no-results {
            text-align: center;
            font-size: 1.2em;
            color: #666;
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
                <a href="gestion-biomes.html">Les biomes</a>
                <a href="services.html">Nos Services</a>
                <a href="billeterie.html">Billeterie</a>
            </nav>
            <div class="login">
                <a href="Connexion.html">Connexion</a>
            </div>
    </header>
    <main>
        <form action="search.php" method="GET" class="search-form">
            <input type="text" name="animal_name" placeholder="Entrez le nom d'un animal..." value="<?php echo isset($_GET['animal_name']) ? htmlspecialchars($_GET['animal_name']) : ''; ?>" required>
            <button type="submit">Rechercher</button>
        </form>

        <?php if (isset($_GET['animal_name'])): ?>
            <?php if (!empty($results)): ?>
                <h2>Résultats pour "<?php echo htmlspecialchars($_GET['animal_name']); ?>"</h2>
                <?php foreach ($results as $result): ?>
                    <div class="result-item">
                        <h3><?php echo htmlspecialchars($result['animal_name']); ?></h3>
                        <p><strong>Biome :</strong> <?php echo htmlspecialchars($result['biome']); ?></p>
                        <p><strong>Enclos :</strong> <?php echo htmlspecialchars($result['enclosure_name']); ?></p>
                        <a href="enclosure.php?id=<?php echo htmlspecialchars($result['enclosure_id']); ?>">Voir l'enclos</a>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <p class="no-results">Aucun résultat trouvé pour "<?php echo htmlspecialchars($_GET['animal_name']); ?>"</p>
            <?php endif; ?>
        <?php endif; ?>
    </main>
</body>
</html>
