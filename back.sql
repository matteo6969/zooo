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

    INSERT INTO animals (name, enclosure_id) VALUES
('Oryx beisa', 1),
('Gazelle', 1),
('Autruche', 1),
('Gnou', 1),
('Tapir', 1),
('Coati', 1),
('Fennec', 1),
('Rhinocéros', 1),
('Suricate', 1),
('Crocodile nain', 1),
('Casoar', 1),
('Guépard', 1),
('Saïmiri', 1),

('Lion', 2),
('Hippopotame', 2),
('Hyène', 2),
('Éléphant', 2),
('Girafe', 2),
('Varan de Komodo', 2),
('Zèbre', 2),
('Grivet Cercopithèque', 2),
('Loup à crinière', 2),
('Tamarin Capucin', 2),
('Ouistiti Gibbon', 2),

('Marabout', 3),
('Watusi', 3),
('Émeu', 3),
('Bison', 3),
('Dromadaire', 3),
('Flamant rose', 3),
('cigogne',3),
('Oryx algazelle',3),
('Âne de Somalie',3),
('Yack',3),
('Mouton noir',3),
('Ibis',3),
('Tortue',3),
('Pécari',3),
('Tamanoir',3),
('Nandou',3),
('Wallaby',3),
('Porc-épic',3),
('Âne de Provence',3),
('Tigre',3),
('Chien des buissons',3),
('Serval',3),
('Lynx',3),

('Antilope', 4),
('Daim', 4),
('Nilgaut', 4),
('Macaque crabier', 4),
('Vautour', 4),
('Loup d''Europe', 4),
('Cerf',4),

('Python', 5),
('Tortue', 5),
('Iguane', 5),

('Panthère', 6),
('Ara Parroquet', 6),
('Grand Hocco', 6),
('Panda roux', 6),
('Lémurien', 6),
('Chèvre naine', 6),
('Loutre', 6),
('Mouflon', 6),
('Binturong', 6);
