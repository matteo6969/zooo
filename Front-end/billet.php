<?php
// Vérification des données du formulaire
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = htmlspecialchars($_POST['name']);
    $cardNumber = htmlspecialchars($_POST['cardNumber']);
    $expiry = htmlspecialchars($_POST['expiry']);
    $cvv = htmlspecialchars($_POST['cvv']);
    $ticketType = htmlspecialchars($_POST['ticketType']);

    // Simulation du paiement
    if (!empty($cardNumber) && !empty($expiry) && !empty($cvv) && !empty($name)) {
        // Génération du billet
        $ticketID = uniqid("TICKET-");

        echo "
        <body style=' background-color: #d3cbcb;'>
        </body>
        <div style='font-family: Roboto, sans-serif; max-width: 500px; margin: 50px auto; text-align: center; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);'>
            <h1 style='color: #b03e0f;'>Merci pour votre achat, $name !</h1>
            <p>Voici votre billet :</p>
            <div style='border: 1px solid #E2E8F0; padding: 20px; border-radius: 4px; margin-top: 20px;'>
                <p><strong>ID du billet :</strong> $ticketID</p>
                <p><strong>Nom :</strong> $name</p>
                <p><strong>Type :</strong> $ticketType</p>
                <p><strong>Prix :</strong> " . ($ticketType == "standard" ? "20€" : "50€") . "</p>
            </div>
        </div>";
    } else {
        echo "
        <div style='font-family: Roboto, sans-serif; max-width: 500px; margin: 50px auto; text-align: center; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);'>
            <h1 style='color: red;'>Erreur de paiement</h1>
            <p>Veuillez vérifier les informations saisies et réessayer.</p>
        </div>";
    }
} else {
    echo "<h1>Accès non autorisé</h1>";
}
?>
