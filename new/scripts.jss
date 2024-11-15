// Sélection des éléments de la modale
const openMapBtn = document.getElementById('openMapBtn');
const mapModal = document.getElementById('mapModal');
const closeModal = document.getElementById('closeModal');

// Fonction pour ouvrir la modale
function openModal() {
    mapModal.style.display = 'block';
}

// Fonction pour fermer la modale
function closeModalFunction() {
    mapModal.style.display = 'none';
}

// Ouvrir la modale au clic sur le bouton
openMapBtn.addEventListener('click', openModal);

// Fermer la modale au clic sur la croix
closeModal.addEventListener('click', closeModalFunction);

// Fermer la modale en cliquant à l'extérieur du contenu
window.addEventListener('click', (event) => {
    if (event.target === mapModal) {
        closeModalFunction();
    }
});
