// Variables
let nextDom = document.getElementById('next');
let prevDom = document.getElementById('prev');

let carouselDom = document.querySelector('.carousel');
let SliderDom = carouselDom.querySelector('.carousel .list');
let thumbnailBorderDom = document.querySelector('.carousel .thumbnail');
let thumbnailItemsDom = thumbnailBorderDom.querySelectorAll('.item');
let timeDom = document.querySelector('.carousel .time');

thumbnailBorderDom.appendChild(thumbnailItemsDom[0]);

let timeRunning = 3000; // Durée d'une animation
let timeAutoNext = 7000; // Intervalle entre deux transitions automatiques

// Couleurs spécifiques à chaque slide
const slideColors = ['#808080', '#E1CD98', '#D4A498', '#89A5B2', '#AEB58E', '#A2BDA2'];
let currentSlideIndex = 0;

// Fonction pour appliquer les couleurs
function applyColors() {
    const activeSlide = SliderDom.querySelector('.carousel .list .item:first-child');
    const activeTitle = activeSlide.querySelector('.title');
    const activeTopic = activeSlide.querySelector('.topic');

    // Applique les couleurs de la slide active
    activeTitle.style.color = slideColors[currentSlideIndex];
    activeTopic.style.color = slideColors[currentSlideIndex];
}

// Fonction pour gérer les transitions de slide
function showSlider(type) {
    let SliderItemsDom = SliderDom.querySelectorAll('.carousel .list .item');
    let thumbnailItemsDom = document.querySelectorAll('.carousel .thumbnail .item');

    if (type === 'next') {
        SliderDom.appendChild(SliderItemsDom[0]);
        thumbnailBorderDom.appendChild(thumbnailItemsDom[0]);
        carouselDom.classList.add('next');
    } else {
        SliderDom.prepend(SliderItemsDom[SliderItemsDom.length - 1]);
        thumbnailBorderDom.prepend(thumbnailItemsDom[thumbnailItemsDom.length - 1]);
        carouselDom.classList.add('prev');
    }

    // Retire les classes après la transition pour réactiver les animations
    setTimeout(() => {
        carouselDom.classList.remove('next');
        carouselDom.classList.remove('prev');
        applyColors(); // Appliquer les couleurs après la transition
    }, timeRunning); // Durée de la transition définie dans le CSS
}

// Boutons "Next" et "Prev"
nextDom.onclick = function () {
    currentSlideIndex = (currentSlideIndex + 1) % slideColors.length;
    showSlider('next');
};

prevDom.onclick = function () {
    currentSlideIndex = (currentSlideIndex - 1 + slideColors.length) % slideColors.length;
    showSlider('prev');
};

// Initialisation des couleurs
applyColors();

// Défilement automatique
let runNextAuto = setInterval(() => {
    nextDom.click();
}, timeAutoNext);
