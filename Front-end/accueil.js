// Sélectionner toutes les étoiles
const allStars = document.querySelectorAll('.rating .star');
const ratingInput = document.querySelector('.rating input');

// Ajouter un gestionnaire d'événements "click" à chaque étoile
allStars.forEach((star, index) => {
    star.addEventListener('click', () => {
        // Réinitialiser toutes les étoiles
        allStars.forEach(s => {
            s.classList.remove('bxs-star', 'active');
            s.classList.add('bx-star');
        });

        // Activer les étoiles jusqu'à celle cliquée
        for (let i = 0; i <= index; i++) {
            allStars[i].classList.remove('bx-star');
            allStars[i].classList.add('bxs-star', 'active');
        }

        // Mettre à jour la valeur de la note
        ratingInput.value = index + 1;
    });
});
