CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE enclosures (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    biome VARCHAR(255),
    status ENUM('open', 'closed') DEFAULT 'open'
);
CREATE TABLE animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    enclosure_id INT,
    FOREIGN KEY (enclosure_id) REFERENCES enclosures(id) ON DELETE SET NULL
);
CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
INSERT INTO services (name) VALUES
('Boutique'),
('Café Nomad'),
('Petit Café'),
('Aires de Pique-Nique'),
('Toilettes'),
('Point d\'eau'),
('Gare'),
('Trajet Train'),
('Lodge'),
('Tente pédagogique'),
('Paillote'),
('Plateau des Jeux'),
('Espace Pique-nique'),
('Point de vue');

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    enclosure_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (enclosure_id) REFERENCES enclosures(id) ON DELETE CASCADE
);
