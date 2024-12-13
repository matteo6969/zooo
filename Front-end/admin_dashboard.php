<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: connexion.html");
    exit();
}

// Connexion à la base de données
$pdo = new PDO('mysql:host=localhost;dbname=test', 'root', '');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $enclosureId = $_POST['enclosure_id'];

    // Mettre à jour l'état de l'enclos
    if (isset($_POST['status'])) {
        $status = $_POST['status'];
        $stmt = $pdo->prepare("UPDATE enclosures SET status = :status WHERE id = :id");
        $stmt->execute([':status' => $status, ':id' => $enclosureId]);
    }

    // Ajouter ou mettre à jour les horaires de repas
    if (isset($_POST['feeding_schedule'])) {
        $feedingSchedule = $_POST['feeding_schedule'];
        $stmt = $pdo->prepare("UPDATE enclosures SET feeding_schedule = :feeding_schedule WHERE id = :id");
        $stmt->execute([':feeding_schedule' => $feedingSchedule, ':id' => $enclosureId]);
    }
}

// Récupérer les enclos
$stmt = $pdo->query("SELECT * FROM enclosures");
$enclosures = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
</head>
<body>
    <h1>Gestion des Enclos</h1>
    <table border="1">
        <tr>
            <th>Nom</th>
            <th>Statut</th>
            <th>Horaires de repas</th>
            <th>Actions</th>
        </tr>
        <?php foreach ($enclosures as $enclosure): ?>
            <tr>
                <td><?= htmlspecialchars($enclosure['name']) ?></td>
                <td><?= $enclosure['status'] === 'open' ? 'Ouvert' : 'Fermé' ?></td>
                <td><?= htmlspecialchars($enclosure['feeding_schedule'] ?? 'Aucun') ?></td>
                <td>
                    <form method="POST">
                        <input type="hidden" name="enclosure_id" value="<?= $enclosure['id'] ?>">
                        <select name="status">
                            <option value="open" <?= $enclosure['status'] === 'open' ? 'selected' : '' ?>>Ouvert</option>
                            <option value="closed" <?= $enclosure['status'] === 'closed' ? 'selected' : '' ?>>Fermé</option>
                        </select>
                        <input type="text" name="feeding_schedule" placeholder="Horaires de repas" value="<?= htmlspecialchars($enclosure['feeding_schedule'] ?? '') ?>">
                        <button type="submit">Mettre à jour</button>
                    </form>
                </td>
            </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>
