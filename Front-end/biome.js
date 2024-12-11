document.addEventListener('DOMContentLoaded', function () {
    const biomesContainer = document.getElementById('biomes-container');
    const enclosuresContainer = document.getElementById('enclosures-container');
    const animalsContainer = document.getElementById('animals-container');
    const enclosuresContent = document.getElementById('enclosures-content');
    const animalsContent = document.getElementById('animals-content');

    // Charger les biomes
    function loadBiomes() {
        fetch('get_biomes.php')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Erreur réseau lors du chargement des biomes');
                }
                return response.json();
            })
            .then(data => {
                console.log("Biomes reçus :", data); // Log pour vérifier les données
                if (data.biomes && Array.isArray(data.biomes)) {
                    biomesContainer.innerHTML = data.biomes.map(biome => `
                        <div class="biome-item" onclick="loadEnclosures('${biome}')">
                            <h3>${biome}</h3>
                        </div>
                    `).join('');
                } else {
                    biomesContainer.innerHTML = "<p>Aucun biome disponible.</p>";
                }
            })
            .catch(error => {
                console.error('Erreur lors du chargement des biomes :', error);
                biomesContainer.innerHTML = "<p>Impossible de charger les biomes.</p>";
            });
    }

    // Charger les enclos pour un biome spécifique
    window.loadEnclosures = function (biome) {
        fetch(`get_enclosures.php?biome=${encodeURIComponent(biome)}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Erreur réseau lors du chargement des enclos');
                }
                return response.json();
            })
            .then(data => {
                if (data.enclosures && Array.isArray(data.enclosures)) {
                    enclosuresContainer.style.display = 'block';
                    biomesContainer.style.display = 'none';
                    animalsContainer.style.display = 'none';
                    enclosuresContent.innerHTML = data.enclosures.map(enclosure => `
                        <div class="item" onclick="loadAnimals(${enclosure.id})">
                            <div class="content">
                                <div class="title">${enclosure.name}</div>
                                <div class="description">${enclosure.description}</div>
                            </div>
                        </div>
                    `).join('');
                } else {
                    enclosuresContent.innerHTML = "<p>Aucun enclos disponible pour ce biome.</p>";
                }
            })
            .catch(error => {
                console.error('Erreur lors du chargement des enclos :', error);
                enclosuresContent.innerHTML = "<p>Impossible de charger les enclos.</p>";
            });
    };

    // Charger les animaux pour un enclos spécifique
    window.loadAnimals = function (enclosureId) {
        fetch(`get_animals.php?enclosure_id=${enclosureId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Erreur réseau lors du chargement des animaux');
                }
                return response.json();
            })
            .then(data => {
                if (data.animals && Array.isArray(data.animals)) {
                    animalsContainer.style.display = 'block';
                    enclosuresContainer.style.display = 'none';
                    biomesContainer.style.display = 'none';
                    animalsContent.innerHTML = data.animals.map(animal => `
                        <div class="item">
                            <img src="${animal.image}" alt="${animal.name}">
                            <div class="content">
                                <div class="title">${animal.name}</div>
                                <div class="description">${animal.description}</div>
                            </div>
                        </div>
                    `).join('');
                } else {
                    animalsContent.innerHTML = "<p>Aucun animal disponible dans cet enclos.</p>";
                }
            })
            .catch(error => {
                console.error('Erreur lors du chargement des animaux :', error);
                animalsContent.innerHTML = "<p>Impossible de charger les animaux.</p>";
            });
    };

    // Retourner aux biomes
    window.showBiomes = function () {
        biomesContainer.style.display = 'block';
        enclosuresContainer.style.display = 'none';
        animalsContainer.style.display = 'none';
    };

    // Retourner aux enclos
    window.showEnclosures = function () {
        enclosuresContainer.style.display = 'block';
        biomesContainer.style.display = 'none';
        animalsContainer.style.display = 'none';
    };

    // Charger les biomes au démarrage
    loadBiomes();
});
