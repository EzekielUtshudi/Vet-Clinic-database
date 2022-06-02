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

/Begin transaction/
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