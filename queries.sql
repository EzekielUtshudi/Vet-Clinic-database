/Queries that provide answers to the questions from all projects./


SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = 'yes' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' || 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 'yes';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >=10.4 AND weight_kg <=17.3;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = NULL;
DELETE FROM animals;
ROLLBACK BeforeDelete;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = NULL;
DELETE FROM animals;
ROLLBACK BeforeDelete;

BEGIN;
/Delete all animals born after Jan 1st, 2022./
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT SP2;

/Update all animals' weight to be their weight multiplied by -1./
UPDATE animals SET weight_kg = (weight_kg * (-1));

/Update all animals' weights that are negative to be their weight multiplied by -1./
UPDATE animals SET weight_kg = (weight_kg * (-1)) WHERE weight_kg LIKE '%-';

ROLLBACK TO SP2;

/Update all animals' weights that are negative to be their weight multiplied by -1/
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

/How many animals are there/
SELECT COUNT(*) FROM animals;

/How many animals have never tried to escape/
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

/What is the average weight of animals/
SELECT AVG(weight_kg) FROM animals;

/Who escapes the most, neutered or not neutered animals/
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;

/What is the minimum and maximum weight of each type of animal/
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

/What is the average number of escape attempts per animal type of those born between 1990 and 2000/
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* Write queries (using JOIN) to answer the following questions: */
-- What animals belong to Melody Pond?
SELECT name, full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.id = 4;

-- Update List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE animals.species_id = 1;

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name FROM owners FULL OUTER JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species
SELECT COUNT(species_id), (species.name)  FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

-- Update List all Digimon owned by Jennifer Orwell.
SELECT (animals.name) AS animalName, (species.name) AS speciesName, full_name FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
WHERE species.id = 2 AND owner_id = 2;

-- Update List all animals owned by Dean Winchester that haven't tried to escape.
SELECT name, full_name FROM animals
FULL OUTER JOIN owners ON animals.owner_id = owners.id
WHERE escape_attempts = 0 AND owner_id = 5;

-- Who owns the most animals?
SELECT full_name, COUNT(owner_id) AS Total_animals FROM owners
JOIN animals ON  owners.id = animals.owner_id
GROUP BY full_name
ORDER BY COUNT(name) DESC;