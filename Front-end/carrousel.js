const carouselSlide = document.querySelector('.carousel-slide');
const videos = document.querySelectorAll('.carousel-slide video');
const prevBtn = document.querySelector('.prev-btn');
const nextBtn = document.querySelector('.next-btn');

let counter = 0;

// Fonction pour aller à la vidéo suivante
function nextVideo() {
    counter++;
    if (counter >= videos.length) {
        counter = 0; // Retour à la première vidéo
    }
    updateCarousel();
}

// Fonction pour revenir à la vidéo précédente
function prevVideo() {
    counter--;
    if (counter < 0) {
        counter = videos.length - 1; // Aller à la dernière vidéo
    }
    updateCarousel();
}

// Met à jour la position du carrousel
function updateCarousel() {
    const slideWidth = document.querySelector('.carousel-container').offsetWidth;
    carouselSlide.style.transform = `translateX(${-counter * slideWidth}px)`;
}

// Ajout des événements pour les boutons
nextBtn.addEventListener('click', nextVideo);
prevBtn.addEventListener('click', prevVideo);

// Démarrage automatique du carrousel (toutes les 10 secondes)
setInterval(nextVideo, 6000);
