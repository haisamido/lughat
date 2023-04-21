-- CREATE DATABASE lughat;

CREATE SCHEMA IF NOT EXISTS documents AUTHORIZATION postgres;
CREATE SCHEMA IF NOT EXISTS writings AUTHORIZATION postgres;
CREATE SCHEMA IF NOT EXISTS languages AUTHORIZATION postgres;
CREATE SCHEMA IF NOT EXISTS phonology AUTHORIZATION postgres;
CREATE SCHEMA IF NOT EXISTS morphology AUTHORIZATION postgres;

CREATE SCHEMA IF NOT EXISTS typology AUTHORIZATION postgres;
SET search_path TO public, documents, writings,languages, phonology, morphology, typology;

-- TODO: philology ?
CREATE TABLE IF NOT EXISTS writings.writing_systems (
  id SERIAL PRIMARY KEY,
  writing_system TEXT NOT NULL UNIQUE,
  metadata JSONB NOT NULL DEFAULT '{}', 
  comment TEXT
);

INSERT INTO writings.writing_systems (writing_system) VALUES ('abjad');
INSERT INTO writings.writing_systems (writing_system) VALUES ('abugida');
INSERT INTO writings.writing_systems (writing_system) VALUES ('alphabet');
INSERT INTO writings.writing_systems (writing_system) VALUES ('logosyllabic');
INSERT INTO writings.writing_systems (writing_system) VALUES ('logographic');
INSERT INTO writings.writing_systems (writing_system) VALUES ('logoconsonantal');
INSERT INTO writings.writing_systems (writing_system) VALUES ('pictogramic');
INSERT INTO writings.writing_systems (writing_system) VALUES ('syllabic');

-- TODO: where to put monumental writing
-- TODO: grapheme, glyphs (fonts), orthography

-- -- heiroglyphs, hieratic, demotic, etc.
-- CREATE TABLE IF NOT EXISTS writings.writing_types (
--   id SERIAL PRIMARY KEY,
--   writing_type TEXT NOT NULL UNIQUE,
--   writing_system TEXT NOT NULL, FOREIGN KEY (writing_system) REFERENCES writing_systems(writing_system),
--   metadata JSONB NOT NULL DEFAULT '{}',
--   comment TEXT
-- );
-- INSERT INTO writings.writing_types (writing_type, writing_system) VALUES ('hieroglyphic', );
-- INSERT INTO writings.writing_types (writing_type, writing_system) VALUES ('hieratic');
-- INSERT INTO writings.writing_types (writing_type, writing_system) VALUES ('Demotic');

CREATE TABLE IF NOT EXISTS languages.language_types (
  id SERIAL PRIMARY KEY,
  language_type TEXT NOT NULL UNIQUE,
  metadata JSONB NOT NULL DEFAULT '{}',
  comment TEXT
);
INSERT INTO languages.language_types (language_type) VALUES ('oral');
INSERT INTO languages.language_types (language_type) VALUES ('written');
INSERT INTO languages.language_types (language_type) VALUES ('sign');
INSERT INTO languages.language_types (language_type) VALUES ('tactile');

CREATE TABLE IF NOT EXISTS languages.languages (
  id SERIAL PRIMARY KEY,
  language TEXT NOT NULL UNIQUE,
  language_type TEXT NOT NULL, FOREIGN KEY (language_type) REFERENCES language_types(language_type),
  metadata JSONB NOT NULL DEFAULT '{}',
  comment TEXT
);

-- TODO: https://en.wikipedia.org/wiki/List_of_ISO_639-5_codes
-- TODO: https://iso639-3.sil.org/code/afa
-- TODO: https://www.ethnologue.com/language/ara/
-- TODO: https://iso639-3.sil.org/code_tables/download_tables
-- TODO: https://iso639-3.sil.org/code_tables/download_tables#Complete%20Code%20Tables
-- TODO: https://github.com/datasets/language-codes

CREATE TABLE IF NOT EXISTS languages.families (
  id SERIAL PRIMARY KEY,
  family TEXT NOT NULL UNIQUE,
  metadata JSONB NOT NULL DEFAULT '{}',
  comment TEXT
);

CREATE TABLE IF NOT EXISTS public.language_writing_systems (
  id SERIAL PRIMARY KEY,
  language TEXT NOT NULL, FOREIGN KEY (language) REFERENCES languages(language),
  writing_system TEXT NOT NULL, FOREIGN KEY (writing_system) REFERENCES writings.writing_systems(writing_system),
  metadata JSONB NOT NULL DEFAULT '{}',
  comment TEXT
);

CREATE TABLE IF NOT EXISTS phonology.phonemes (
  id SERIAL PRIMARY KEY,
  phoneme TEXT NOT NULL UNIQUE,
  metadata JSONB NOT NULL DEFAULT '{}',
  comment TEXT
);

CREATE TABLE IF NOT EXISTS phonology.allophenes (
  id SERIAL PRIMARY KEY,
  allophene TEXT NOT NULL UNIQUE,
  metadata JSONB NOT NULL DEFAULT '{}',
  comment TEXT
);

CREATE TABLE IF NOT EXISTS typology.word_orders (
  id SERIAL PRIMARY KEY,
  word_order TEXT NOT NULL UNIQUE,
  metadata JSONB NOT NULL DEFAULT '{}',
  comment TEXT
);
