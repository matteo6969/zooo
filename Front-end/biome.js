document.addEventListener('DOMContentLoaded', function () {
    const biomesContainer = document.getElementById('biomes-container');
    const enclosuresContainer = document.getElementById('enclosures-container');
    const animalsContainer = document.getElementById('animals-container');

    // Charger les biomes au démarrage
    function loadBiomes() {
        fetch('biome.php?action=get_biomes')
            .then(response => response.json())
            .then(data => {
                if (data.biomes && Array.isArray(data.biomes)) {
                    biomesContainer.innerHTML = data.biomes.map(biome => `
                        <div class="biome-item" onclick="loadEnclosures('${biome}')">
                            <h3>${biome}</h3>
                        </div>
                    `).join('');
                    biomesContainer.style.display = 'flex';
                } else {
                    biomesContainer.innerHTML = '<p>Aucun biome disponible.</p>';
                }
            })
            .catch(error => console.error('Erreur lors du chargement des biomes :', error));
    }

    window.loadEnclosures = function (biome) {
        fetch(`biome.php?action=get_enclosures&biome=${encodeURIComponent(biome)}`)
        .then(response => response.json())
        .then(data => {
            if (data.enclosures && Array.isArray(data.enclosures)) {
                const enclosuresContent = document.getElementById('enclosures-container');
                enclosuresContent.innerHTML = `
                    <div class="enclosure-header">
                        <h2>Biome : ${biome}</h2>
                        <button id="back-to-biomes" class="return-button">Retour</button>
                    </div>
                    <div class="enclosure-grid">
                        ${data.enclosures.map(enclosure => `
                            <div class="enclosure-item ${enclosure.status === 'closed' ? 'closed' : ''}" 
                                onclick="${enclosure.status === 'closed' ? "alert('Enclos fermé pour cause de travaux.')" : `loadAnimals(${enclosure.id})`}">
                                <h3>${enclosure.name}</h3>
                                <p>${enclosure.description}</p>
                                ${enclosure.status === 'closed' ? '<span class="closed-tag">Fermé</span>' : ''}
                            </div>
                        `).join('')}
                    </div>
                `;
                showEnclosures();
                document.getElementById('back-to-biomes').addEventListener('click', showBiomes);
            } else {
                console.error('Erreur : Aucun enclos disponible.');
            }
        })
        .catch(error => console.error('Erreur lors du chargement des enclos :', error));
};

    window.loadAnimals = function (enclosureId) {
        fetch(`biome.php?action=get_animals&enclosure_id=${enclosureId}`)
            .then(response => response.json())
            .then(data => {
                if (data.animals && Array.isArray(data.animals)) {
                    animalsContainer.innerHTML = `
                        <button id="back-to-enclosures" class="return-button">Retour</button>
                        <div class="carousel-container">
                            <button class="carousel-button prev">❮</button>
                            <div class="carousel">
                                ${data.animals.map(animal => `
                                    <div class="carousel-item">
                                        <img src="${animal.image}" alt="${animal.name}">
                                        <div class="carousel-description">
                                            <h3>${animal.name || 'Nom non disponible'}</h3>
                                            <p>${animal.description || 'Aucune description disponible.'}</p>
                                        </div>
                                    </div>
                                `).join('')}
                            </div>
                            <button class="carousel-button next">❯</button>
                        </div>
                        <section id="review-section" class="review-section">
                            <h2>Laissez votre avis</h2>
                            <p>Votre opinion compte pour nous ! Notez votre expérience dans cet enclos et laissez un commentaire.</p>
                            <div class="wrapper">
                                <form id="review-form" action="#" method="POST">
                                    <div class="rating">
                                        <input type="number" name="rating" hidden>
                                        <i class="bx bx-star star"></i>
                                        <i class="bx bx-star star"></i>
                                        <i class="bx bx-star star"></i>
                                        <i class="bx bx-star star"></i>
                                        <i class="bx bx-star star"></i>
                                    </div>
                                    <textarea name="opinion" cols="30" rows="5" placeholder="Votre avis..."></textarea>
                                    <input type="hidden" id="enclosure-id" name="enclosure_id" value="${enclosureId}">
                                    <div class="btn-group">
                                        <button type="submit" class="btn submit">Envoyer</button>
                                        <button type="button" class="btn cancel">Annuler</button>
                                    </div>
                                </form>
                            </div>
                        </section>
                    `;
                    initializeCarousel();
                    initializeReviewForm(enclosureId); // Gérer les avis
                    showAnimals();
                    document.getElementById('back-to-enclosures').addEventListener('click', showEnclosures);
                } else {
                    animalsContainer.innerHTML = '<p>Aucun animal disponible dans cet enclos.</p>';
                }
            })
            .catch(error => console.error('Erreur lors du chargement des animaux :', error));
    };
    

    function initializeCarousel() {
        const carousel = document.querySelector('.carousel');
        const items = carousel.querySelectorAll('.carousel-item');
        const prevButton = document.querySelector('.carousel-button.prev');
        const nextButton = document.querySelector('.carousel-button.next');
        let currentIndex = 0;

        function showItem(index) {
            items.forEach((item, i) => {
                item.style.display = i === index ? 'block' : 'none';
            });
        }

        showItem(currentIndex);

        prevButton.addEventListener('click', () => {
            currentIndex = (currentIndex - 1 + items.length) % items.length;
            showItem(currentIndex);
        });

        nextButton.addEventListener('click', () => {
            currentIndex = (currentIndex + 1) % items.length;
            showItem(currentIndex);
        });

        console.log(`Carrousel initialisé avec ${items.length} éléments.`);
    }

    function initializeReviewForm(enclosureId) {
        const reviewForm = document.getElementById('review-form');
        const ratingStars = document.querySelectorAll('.rating .star');
        const ratingInput = document.querySelector('.rating input');
    
        // Réinitialiser les étoiles et le formulaire
        ratingStars.forEach(star => {
            star.classList.remove('bxs-star', 'active');
            star.classList.add('bx-star');
        });
        ratingInput.value = '';
        reviewForm.reset();
    
        // Gestion des clics sur les étoiles
        ratingStars.forEach((star, index) => {
            star.addEventListener('click', () => {
                ratingStars.forEach(s => {
                    s.classList.remove('bxs-star', 'active');
                    s.classList.add('bx-star');
                });
                for (let i = 0; i <= index; i++) {
                    ratingStars[i].classList.remove('bx-star');
                    ratingStars[i].classList.add('bxs-star', 'active');
                }
                ratingInput.value = index + 1;
            });
        });
    
        // Gestion du formulaire
        reviewForm.addEventListener('submit', function (event) {
            event.preventDefault();
            const rating = ratingInput.value;
            const opinion = reviewForm.opinion.value;
        
            if (!rating || !opinion) {
                alert('Veuillez remplir tous les champs.');
                return;
            }
        
            fetch('avis.php?action=submit_review', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ enclosure_id: enclosureId, rating, opinion })
            })
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    alert(data.error); // Afficher l'erreur (ex : connexion requise)
                } else {
                    alert('Merci pour votre avis !');
                }
            })
            .catch(error => console.error('Erreur lors de l\'envoi de l\'avis :', error));
        });
        
    }
    

    function showBiomes() {
        biomesContainer.style.display = 'flex';
        enclosuresContainer.style.display = 'none';
        animalsContainer.style.display = 'none';
    }

    function showEnclosures() {
        biomesContainer.style.display = 'none';
        enclosuresContainer.style.display = 'block';
        animalsContainer.style.display = 'none';
    }

    function showAnimals() {
        biomesContainer.style.display = 'none';
        enclosuresContainer.style.display = 'none';
        animalsContainer.style.display = 'block';
    }

    loadBiomes();
});
