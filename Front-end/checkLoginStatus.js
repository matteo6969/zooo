document.addEventListener('DOMContentLoaded', function () {
    // Fonction pour vérifier l'état de connexion
    function checkLoginStatus() {
        fetch('check_session.php')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Erreur lors de la requête.');
                }
                return response.json();
            })
            .then(data => {
                const loginDiv = document.getElementById('header-login');
                if (data.isLoggedIn) {
                    // Si connecté, afficher l'icône profil
                    loginDiv.innerHTML = `
                        <a href="profil.php" class="profile-icon">
                            <img src="public/profil.png" alt="Profil" style="width: 40px; height: 40px; border-radius: 50%;">
                        </a>`;
                } else {
                    // Si non connecté, afficher le bouton Connexion
                    loginDiv.innerHTML = `<a href="connexion.html" class="btn">Connexion</a>`;
                }
            })
            .catch(error => {
                console.error('Erreur lors de la vérification de la session :', error);
            });
    }

    // Appeler la fonction lors du chargement de la page
    checkLoginStatus();
});