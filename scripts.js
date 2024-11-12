const enclosures = [
    {
        name: "Vallon des Cascades",
        animals: ["Panda Roux", "Chèvre Naine","Lémurien", "Tortue","Mouflon"],
        description: "Cet enclos réunit une variété d'animaux exotiques, incluant des pandas roux, des chèvres naines, des lémuriens, des tortues et des mouflons. L'espace est aménagé pour offrir des zones boisées, des surfaces herbeuses et des structures pour grimper, favorisant l'interaction et l'épanouissement de ces espèces.",
        images: ["image1.jpg", "image2.jpg"] // Replace with actual image paths
    },
    {
        name: "Le Plateau",
        animals: ["Éléphants", "Girafes"],
        description: "Un vaste plateau où les éléphants et les girafes se déplacent librement.",
        images: ["image3.jpg", "image4.jpg"] // Replace with actual image paths
    }
];

// Toggle visibility of the Enclosure Details section
function viewEnclosureDetails(index) {
    const enclosureDetails = document.getElementById("enclosure-details");
    const enclosure = enclosures[index];

    // Display enclosure details
    enclosureDetails.querySelector("h2").textContent = enclosure.name;
    enclosureDetails.querySelector("p").textContent = enclosure.description;

    // Simulate loading images into a carousel
    const carousel = enclosureDetails.querySelector(".carousel");
    carousel.innerHTML = ""; // Clear previous images
    enclosure.images.forEach(imagePath => {
        const img = document.createElement("img");
        img.src = imagePath;
        img.alt = enclosure.name;
        img.classList.add("carousel-image");
        carousel.appendChild(img);
    });

    // Show the enclosure details section
    enclosureDetails.style.display = "block";
}

// Toggle the Review Form visibility
function toggleReviewForm() {
    const reviewForm = document.getElementById("review-form");
    if (reviewForm.style.display === "none" || reviewForm.style.display === "") {
        reviewForm.style.display = "block";
    } else {
        reviewForm.style.display = "none";
    }
}

// Simulated login function
document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault();
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;

    if (username && password) {
        alert("Bienvenue, " + username + " !");
        document.getElementById("profile").style.display = "none"; // Hide login form
    } else {
        alert("Veuillez entrer un nom d'utilisateur et un mot de passe.");
    }
});

// Dynamically load enclosures into the list on page load
function loadEnclosures() {
    const enclosureList = document.querySelector(".enclosure-list");
    enclosureList.innerHTML = ""; // Clear previous content

    enclosures.forEach((enclosure, index) => {
        const enclosureItem = document.createElement("div");
        enclosureItem.classList.add("enclosure-item");

        const title = document.createElement("h3");
        title.textContent = enclosure.name;

        const animalList = document.createElement("p");
        animalList.textContent = "Animaux : " + enclosure.animals.join(", ");

        const detailsButton = document.createElement("button");
        detailsButton.textContent = "Voir les détails";
        detailsButton.onclick = () => viewEnclosureDetails(index);

        enclosureItem.appendChild(title);
        enclosureItem.appendChild(animalList);
        enclosureItem.appendChild(detailsButton);
        enclosureList.appendChild(enclosureItem);
    });
}

// Initialize page
document.addEventListener("DOMContentLoaded", function() {
    loadEnclosures();
    document.getElementById("enclosure-details").style.display = "none";
    document.getElementById("review-form").style.display = "none";
});
