document.addEventListener('DOMContentLoaded', function () {
    const adminButton = document.getElementById('admin-enclosure-button');
    const adminManagementDiv = document.getElementById('admin-enclosure-management');
    const enclosureSelect = document.getElementById('enclosure-select');
    const statusSelect = document.getElementById('status-select');
    const mealTimeInput = document.getElementById('meal-time');
    const applyButton = document.getElementById('apply-changes');

    // Afficher la section admin et charger les enclos au clic sur le bouton admin
    adminButton.addEventListener('click', function () {
        adminManagementDiv.style.display = 'block';
    
        fetch('get_enclosures.php?admin=true')
            .then(response => response.json())
            .then(data => {
                if (data.enclosures && Array.isArray(data.enclosures)) {
                    enclosureSelect.innerHTML = data.enclosures.map(enclosure => {
                        const animals = enclosure.animals.length > 0 ? enclosure.animals.join(', ') : 'Aucun animal associé';
                        return `<option value="${enclosure.id}">
                                    ${enclosure.id} - ${enclosure.name} (${animals})
                                </option>`;
                    }).join('');
                } else {
                    enclosureSelect.innerHTML = '<option value="">Aucun enclos disponible</option>';
                }
            })
            .catch(error => {
                console.error('Erreur lors du chargement des enclos :', error);
                enclosureSelect.innerHTML = '<option value="">Erreur lors du chargement des enclos</option>';
            });
    });
    
    

    // Appliquer les modifications (statut et horaire de repas)
    applyButton.addEventListener('click', function () {
        const enclosureId = enclosureSelect.value;
        const status = statusSelect.value || null; // Null si non défini
        const mealTime = mealTimeInput.value || null; // Null si vide
    
        if (!enclosureId) {
            alert('Veuillez sélectionner un enclos.');
            return;
        }
    
        const data = {
            enclosure_id: enclosureId,
            status: status,
            meal_time: mealTime, // Transmettre le meal_time même s'il est null
        };
    
        // Requête pour la mise à jour
        fetch('update_enclosure.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data),
        })
            .then(response => response.json())
            .then(result => {
                if (result.success) {
                    alert('Les modifications ont été appliquées avec succès.');
                } else {
                    alert(`Erreur : ${result.error || 'Impossible de mettre à jour l\'enclos.'}`);
                }
            })
            .catch(error => {
                console.error('Erreur lors de la mise à jour de l\'enclos :', error);
                alert('Une erreur est survenue. Veuillez réessayer.');
            });
    });
});
    