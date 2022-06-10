/* Populate database with sample data. */

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (1, 'Agumon', '2020-02-03', 0, 'yes', 10.23 );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (2, 'Gabumon', '2018-11-15', 2, 'yes', 8.0 );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (3, 'Pikachu', '2021-01-07', 1, 'no', 15.04 );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (4, 'Devimon', '2017-05-12', 5, 'yes', 11.0 );

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (5, 'Charmander', '2020-02-08', 0, 'no', 11.0, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (6, 'Plantmon', '2021-11-15', 2, 'yes', 5.7, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (7, 'Squirtle', '1993-04-02', 3, 'no', 12.13, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (8, 'Angemon', '2005-06-12', 1, 'yes', 45.0, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (9, 'Boarmon', '2005-06-07', 7, 'yes', 20.4, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (10, 'Blossom', '1998-10-13', 3, 'yes', 17.0, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (11, 'Ditto', '2022-05-14', 4, 'yes', 22.0, '' );

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = NULL;
DELETE FROM animals;
ROLLBACK BeforeDelete;

/Delete all animals born after Jan 1st, 2022./
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

/Update all animals' weight to be their weight multiplied by -1./
UPDATE animals SET weight_kg = (weight_kg * (-1));

/Update all animals' weights that are negative to be their weight multiplied by -1./
UPDATE animals SET weight_kg = (weight_kg * (-1)) WHERE weight_kg LIKE '%-';