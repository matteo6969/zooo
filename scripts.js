const enclosures = [
    {
        name: "Vallon des Cascades",
        animals: ["Panda Roux", "Lemurien", "Chèvre naine", "Tortue", "Mouflon", "Binturong", "Loutre", "Ara perroquet", "Grand hocco", "Panthère"],
        description: "Cet enclos abrite des lions et des tigres dans un environnement de cascades.",
        images: ["image1.jpg", "image2.jpg","image3.jpg","image4.jpg","image5.jpg","image6.jpg","image7.jpg", "image8.jpg","image9.jpg","image10.jpg",] 
    },
    {
        name: "Le Plateau",
        animals: ["Tamarin Capucin", "Ouistiti Gibbon", "Varan de komodo", "Grivet cercopithèque", "Elephant", "Girafe", "Hyène", "Loup à crinière", "Zebre", "Lion", "Hippopotame"],
        description: "Un vaste plateau où les éléphants et les girafes se déplacent librement.",
        images: ["image11.jpg", "image12.jpg","image13.jpg","image14.jpg","image15.jpg","image16.jpg","image17.jpg", "image18.jpg","image19.jpg","image20.jpg"] 
    }
    {
        name: "Le Bélvèdère",
        animals: ["Rhinocéros", "Oryx beisa", "Suricate", "Fennec", "Coati", "Gnou", "Saimiri", "Tapir", "Autruche", "Gazelle", "Guépard", "Casoar", "Crocodile nain"],
        description: "Un vaste plateau où les éléphants et les girafes se déplacent librement.",
        images: ["image21.jpg", "image22.jpg", "image21.jpg", "image22.jpg", "image21.jpg", "image22.jpg", "image21.jpg", "image22.jpg] 
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
