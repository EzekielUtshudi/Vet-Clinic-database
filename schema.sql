/* Database schema to keep the structure of entire database. */

CREATE TABLE animals ( 
    id INT PRIMARY KEY NOT NULL, 
    name CHAR(25) NOT NULL, 
    date_of_birth DATE NOT NULL, 
    escape_attempts INT NOT NULL, 
    neutered BOOL NOT NULL, 
    weight_kg DECIMAL
    );

ALTER TABLE animals ADD species CHAR(40);

/* Create the table owners*/
CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100),
    age INT,
    PRIMARY KEY(id)
);

/* Create species table */
CREATE TABLE IF NOT EXISTS species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(40),
    PRIMARY KEY(id)
);

/*Begin transaction*/
BEGIN;

/* Add column species_id to animals table */
ALTER TABLE animals ADD COLUMN species_id INT;

COMMIT;

/* Make the species_id column a foreign key referencing species table */
ALTER TABLE animals ADD FOREIGN KEY(species_id) REFERENCES species(id);

COMMIT;

/* Add a column called owber_id to animals table */
ALTER TABLE animals ADD COLUMN owner_id INT;

/* Make the owner_id a foreign key referencing the owners table */
ALTER TABLE animals ADD FOREIGN KEY(owner_id) REFERENCES owners(id);

COMMIT;

/* Begin the trsnsaction */
BEGIN;

-- Create the table vets with 4 columns
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

COMMIT;

/*Begin transaction*/
BEGIN;

-- Create the specialization table with two columns and foreign key constraints
CREATE TABLE specializations(
    species_id INT,
    vet_id INT,
    PRIMARY KEY(species_id, vet_id),
    CONSTRAINT species_id_fk FOREIGN KEY(species_id) REFERENCES species(id),
    CONSTRAINT vet_id_fk FOREIGN KEY(vet_id) REFERENCES vets(id)
);

COMMIT;

/*Begin transaction*/
BEGIN;

-- Create the visists table
CREATE TABLE visits(
    animals_id INT,
    vets_id INT,
    date_of_visit DATE,
    PRIMARY KEY(animals_id, vets_id, date_of_visit),
    CONSTRAINT animal_id_fk FOREIGN KEY(animals_id) REFERENCES animals(id),
    CONSTRAINT vet_id_fk FOREIGN KEY(vets_id) REFERENCES vets(id)
);

COMMIT;