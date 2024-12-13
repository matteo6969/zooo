document.addEventListener('DOMContentLoaded', function () {
    const biomesContainer = document.getElementById('biomes-container');
    const enclosuresContainer = document.getElementById('enclosures-container');
    const animalsContainer = document.getElementById('animals-container');
    const enclosuresContent = document.getElementById('enclosures-content');
    const animalsContent = document.getElementById('animals-content');

    // Charger les biomes au démarrage
    function loadBiomes() {
        fetch('get_biomes.php')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Erreur lors de la récupération des biomes.');
                }
                return response.json();
            })
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
            .catch(error => {
                console.error('Erreur lors du chargement des biomes :', error);
                biomesContainer.innerHTML = '<p>Erreur lors du chargement des biomes.</p>';
            });
    }
    
    

    window.loadEnclosures = function (biome) {
        console.log(`Chargement des enclos pour le biome : ${biome}`); // Débogage
        fetch(`get_enclosures.php?biome=${encodeURIComponent(biome)}`)
            .then(response => response.json())
            .then(data => {
                console.log("Enclos reçus :", data); // Débogage des données
    
                if (data.enclosures && Array.isArray(data.enclosures)) {
                    const enclosuresContent = document.getElementById('enclosures-container');
                    enclosuresContent.innerHTML = `
                        <div class="enclosure-header">
                            <h2>Biome : ${biome}</h2>
                            <button id="back-to-biomes" class="return-button">Retour</button>
                        </div>
                        <div class="enclosure-grid">
                            ${data.enclosures.map(enclosure => `
                                <div class="enclosure-item" onclick="loadAnimals(${enclosure.id})">
                                    <h3>${enclosure.name}</h3>
                                    <p>${enclosure.description}</p>
                                </div>
                            `).join('')}
                        </div>
                    `;
                    showEnclosures();
    
                    // Ajout d'un événement au bouton retour
                    document.getElementById('back-to-biomes').addEventListener('click', showBiomes);
                } else {
                    enclosuresContent.innerHTML = '<p>Aucun enclos disponible pour ce biome.</p>';
                }
            })
            .catch(error => {
                console.error('Erreur lors du chargement des enclos :', error);
                const enclosuresContent = document.getElementById('enclosures-container');
                enclosuresContent.innerHTML = '<p>Erreur lors du chargement des enclos.</p>';
            });
    };
    
    
    // Charger les animaux pour un enclos spécifique
    window.loadAnimals = function (enclosureId) {
        fetch(`get_animals.php?enclosure_id=${enclosureId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Erreur lors de la récupération des animaux.');
                }
                return response.json();
            })
            .then(data => {
                if (data.animals && Array.isArray(data.animals)) {
                    animalsContainer.innerHTML = `
                        <button id="back-to-enclosures" class="return-button">Retour</button>
                        <div class="carousel">
                            ${data.animals.map(animal => `
                                <div class="carousel-item">
                                    <img src="${animal.image}" alt="${animal.name}">
                                    <div class="carousel-description">
                                        <h3>${animal.name}</h3>
                                        <p>${animal.description}</p>
                                    </div>
                                </div>
                            `).join('')}
                        </div>
                    `;
                    initializeCarousel(); // Initialiser le carrousel si nécessaire
                    showAnimals(); // Afficher la section des animaux
                    document.getElementById('back-to-enclosures').addEventListener('click', showEnclosures);
                } else {
                    animalsContainer.innerHTML = '<p>Aucun animal disponible dans cet enclos.</p>';
                }
            })
            .catch(error => {
                console.error('Erreur lors du chargement des animaux :', error);
                animalsContainer.innerHTML = '<p>Erreur lors du chargement des animaux.</p>';
            });
    };
    
    

    function showBiomes() {
        document.getElementById('biomes-container').style.display = 'flex';
        document.getElementById('enclosures-container').style.display = 'none';
        document.getElementById('animals-container').style.display = 'none';
    }
    
    function showEnclosures() {
        document.getElementById('biomes-container').style.display = 'none';
        document.getElementById('enclosures-container').style.display = 'block';
        document.getElementById('animals-container').style.display = 'none';
    }
    
    function showAnimals() {
        document.getElementById('biomes-container').style.display = 'none';
        document.getElementById('enclosures-container').style.display = 'none';
        document.getElementById('animals-container').style.display = 'block';
    }
    

    // Charger les biomes au démarrage
    loadBiomes();
});
