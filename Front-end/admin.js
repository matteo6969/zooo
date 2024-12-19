document.addEventListener('DOMContentLoaded', function () {
    const adminButton = document.getElementById('admin-enclosure-button');
    const adminManagementDiv = document.getElementById('admin-enclosure-management');
    const enclosureSelect = document.getElementById('enclosure-select');
    const statusSelect = document.getElementById('status-select');
    const mealTimeInput = document.getElementById('meal-time');
    const applyButton = document.getElementById('apply-changes');

    // Afficher la section admin et charger les enclos
    adminButton.addEventListener('click', function () {
        adminManagementDiv.style.display = 'bck';

        fetch('biome.php?action=get_enclosures&admin=true') // Récupérer les enclos pour l'admin
            .then(response => response.json())
            .then(data => {
                if (data.enclosures && Array.isArray(data.enclosures)) {
                    enclosureSelect.innerHTML = data.enclosures.map(enclosure => {
                        return `
                            <option value="${enclosure.id}">
                                ${enclosure.id} - ${enclosure.name} (${enclosure.animals})
                                [${enclosure.status === 'closed' ? 'Fermé' : 'Ouvert'}]
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

    // Appliquer les modifications
    applyButton.addEventListener('click', function () {
        const enclosureId = enclosureSelect.value;
        const status = statusSelect.value;
        const mealTime = mealTimeInput.value || null;

        if (!enclosureId) {
            alert('Veuillez sélectionner un enclos.');
            return;
        }

        fetch('update_enclosure.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                enclosure_id: enclosureId,
                status: status,
                meal_time: mealTime
            })
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
            console.error('Erreur lors de la mise à jour :', error);
            alert('Une erreur est survenue. Veuillez réessayer.');
        });
    });
    document.addEventListener('DOMContentLoaded', function () {
        const reviewsContainer = document.getElementById('user-reviews-container');
    
        fetch('avis.php?action=get_user_reviews.php')
            .then(response => response.json())
            .then(data => {
                if (data.reviews && Array.isArray(data.reviews)) {
                    reviewsContainer.innerHTML = data.reviews.map(review => `
                        <div class="review-item">
                            <h3>Enclos : ${review.enclosure_name}</h3>
                            <p>Note : ${review.rating}/5</p>
                            <p>${review.comment}</p>
                            <span>Date : ${new Date(review.created_at).toLocaleDateString()}</span>
                        </div>
                    `).join('');
                } else {
                    reviewsContainer.innerHTML = '<p>Vous n\'avez écrit aucun avis.</p>';
                }
            })
            .catch(error => console.error('Erreur lors de la récupération des avis :', error));
    });
    
});
