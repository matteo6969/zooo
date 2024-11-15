// Sélection des éléments
const openMapBtn = document.getElementById('openMapBtn');
const mapModal = document.getElementById('mapModal');
const closeModal = document.getElementById('closeModal');

// Ouvrir la modale au clic sur le bouton
openMapBtn.addEventListener('click', () => {
    mapModal.style.display = 'block';
});

// Fermer la modale au clic sur la croix
closeModal.addEventListener('click', () => {
    mapModal.style.display = 'none';
});

// Fermer la modale en cliquant à l'extérieur du contenu
window.addEventListener('click', (event) => {
    if (event.target === mapModal) {
        mapModal.style.display = 'none';
    }
});
