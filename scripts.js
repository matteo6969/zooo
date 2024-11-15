const enclosures = [
    {
        name: "Vallon des Cascades",
        animals: ["Panda Roux", "Lemurien", "Chèvre naine", "Tortue", "Mouflon", "Binturong", "Loutre", "Ara perroquet", "Grand hocco", "Panthère"],
        description: "Avec son environnement riche en végétation et ses cascades rafraîchissantes, le Vallon des Cascades est l’habitat idéal pour des animaux comme les lions, les panthères et les singes tamarins. La cascade ajoute une touche naturelle et relaxante à cette zone.",
        images: ["image1.jpg", "image2.jpg","image3.jpg","image4.jpg","image5.jpg","image6.jpg","image7.jpg", "image8.jpg","image9.jpg","image10.jpg",] 
    },
    {
        name: "Le Plateau",
        animals: ["Tamarin Capucin", "Ouistiti Gibbon", "Varan de komodo", "Grivet cercopithèque", "Elephant", "Girafe", "Hyène", "Loup à crinière", "Zebre", "Lion", "Hippopotame"],
        description: "Cette zone regroupe une variété d'animaux impressionnants comme les éléphants, les girafes et les zèbres. Aménagé pour reproduire l'habitat naturel des grandes plaines, le Plateau est un endroit privilégié pour observer les interactions sociales de ces espèces.",
        images: ["image11.jpg", "image12.jpg","image13.jpg","image14.jpg","image15.jpg","image16.jpg","image17.jpg", "image18.jpg","image19.jpg","image20.jpg", "image21.jpg"] 
    },
    {
        name: "Le Bélvèdère",
        animals: ["Rhinocéros", "Oryx beisa", "Suricate", "Fennec", "Coati", "Gnou", "Saimiri", "Tapir", "Autruche", "Gazelle"],
        description: "Situé en hauteur, cet enclos offre un panorama unique sur le parc. Vous y rencontrerez des animaux majestueux comme les gazelles et les gnous, évoluant dans un habitat qui simule les plaines africaines. Des points d'observation permettent de voir ces créatures fascinantes de près.",
        images: ["image22.jpg", "image23.jpg", "image24.jpg", "image25.jpg", "image26.jpg", "image27.jpg", "image28.jpg", "image29.jpg", "image30.jpg", "image31.jpg"] 
    },
    {
        name: "Les Clairières",
        animals: ["Marabout", "Cigogne", "Oryx algazelle", "Watusi", "Ane de Somalie", "Yack", "Mouton noir", "Ibis", "Tortue", "Pécari", "Tamanoir", "Flamant rose", "Nandou", "Emeu", "Wallaby", "Porc épic", "Bison", "Ane de Provence", "Dromadaire", "Lynx", "Serval", "Chien des buissons", "Tigres"],
        description: "Un enclos où vous pouvez découvrir des espèces d'oiseaux fascinants, notamment le vol d’oiseaux tels que les cigognes et les flamants roses. Les animaux à sabots, comme les watusis et les ânes de Somalie, cohabitent paisiblement dans ce cadre verdoyant.",
        images: ["image32.jpg", "image33.jpg", "image34.jpg", "image35.jpg", "image36.jpg", "image37.jpg", "image38.jpg", "image39.jpg", "image40.jpg", "image41.jpg", "image42.jpg", "image43.jpg", "image44.jpg", "image45.jpg", "image46.jpg", "image47.jpg", "image48.jpg", "image49.jpg", "image50.jpg", "image51.jpg", "image52.jpg", "image53.jpg", "image54.jpg"] 
    },
    {
        name: "Le bois des pins",
        animals: ["Macaque crabier", "Cerf", "Vautour", "Antilope", "Daim", "Nilgaut", "Loup d'Europe"],
        description: "Cette zone boisée est le refuge parfait pour les animaux européens et d'autres espèces rustiques. Vous y trouverez des animaux comme les loups d'Europe, les cerfs et les mouflons, évoluant dans un environnement qui rappelle les forêts de pins. Ce lieu calme et ombragé permet une immersion totale dans la nature, idéale pour observer ces espèces dans un habitat naturel.",
        images: ["image55.jpg", "image56.jpg", "image57.jpg", "image58.jpg", "image59.jpg", "image60.jpg", "image61.jpg"] 
    },
    {
        name: "La bergerie des reptiles",
        animals: ["Python", "Tortue", "Iguane"],
        description: "Cette zone offre un aperçu fascinant de la vie des reptiles. Vous y trouverez des iguanes, des tortues, et même des pythons dans un environnement soigneusement contrôlé pour leur bien-être. La Bergerie permet aux visiteurs de mieux comprendre ces créatures souvent méconnues.",
        images: ["image62.jpg", "image63.jpg", "image64.jpg"] 
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
