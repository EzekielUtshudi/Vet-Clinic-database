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