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

/* Insert data into the owners table */
INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES('Bob', 45);
INSERT INTO owners(full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES('Jodie Whittaker', 38);

/* Insert data into the species table */
INSERT INTO species(name) Values('Pokemon');
INSERT INTO species(name) Values('Digimon');

/* Begin transaction */
BEGIN;

/* If the name ends in "mon" it will be Digimon */
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

/* All other animals are Pokemon */
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

COMMIT;

/* Begin transaction */
BEGIN;

/* Modify your inserted animals to include owner information (owner_id)*/
UPDATE animals SET owner_id = 1 WHERE name LIKE 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name LIKE 'Gabumon';
UPDATE animals SET owner_id = 2 WHERE name LIKE 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name LIKE 'Devimon';
UPDATE animals SET owner_id = 3 WHERE name LIKE 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name LIKE 'Charmander';
UPDATE animals SET owner_id = 4 WHERE name LIKE 'Squirtle';
UPDATE animals SET owner_id = 4 WHERE name LIKE 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name LIKE 'Angemon';
UPDATE animals SET owner_id = 5 WHERE name LIKE 'Boarman';

COMMIT;

/*Begin transaction*/
BEGIN;

-- Insert data vets tables
INSERT INTO vets(name, age, date_of_graduation) VALUES('Willian Tatcher', 45, '2000-04-23');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Stephanie Mendez', 64, '1981-05-4');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Jack Harkness', 38, '2008-06-08');

COMMIT;

/*Begin transaction*/
BEGIN;

-- Insert the following data for specialties
INSERT INTO specializations(species_id, vet_id) VALUES(1, 1);
INSERT INTO specializations(species_id, vet_id) VALUES(2, 3);
INSERT INTO specializations(species_id, vet_id) VALUES(1, 3);
INSERT INTO specializations(species_id, vet_id) VALUES(2, 4);

COMMIT;

/*Begin transaction*/
BEGIN;

-- Insert the following data for visits
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(1,1,'2020-05-24');
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(1,3,'2020-07-22');

INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(2,4,'2021-02-02');

INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(3,2,'2020-01-05');
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(3,2,'2020-03-08');
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(3,2,'2020-05-14');

INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(4,3,'2021-05-04');

INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(5,4,'2021-02-24');

INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(6,2,'2019-12-21');
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(6,1,'2020-08-10');
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(6,2,'2021-04-07');

INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(7,3,'2019-09-29');

INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(8,4,'2020-10-03');
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(8,4,'2020-11-04');

INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(9,2,'2019-01-24');
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(9,2,'2019-05-15');
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(9,2,'2020-02-27');
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(9,2,'2020-08-03');

INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(10,3,'2020-05-24');
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES(10,1,'2021-01-11');

COMMIT;