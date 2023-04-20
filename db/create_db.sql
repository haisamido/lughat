-- CREATE DATABASE lughat;

CREATE SCHEMA IF NOT EXISTS writings AUTHORIZATION postgres;
CREATE SCHEMA IF NOT EXISTS languages AUTHORIZATION postgres;
CREATE SCHEMA IF NOT EXISTS phonology AUTHORIZATION postgres;
CREATE SCHEMA IF NOT EXISTS morphology AUTHORIZATION postgres;

CREATE SCHEMA IF NOT EXISTS typology AUTHORIZATION postgres;
SET search_path TO public,writings,languages, phonology, morphology, typology;

CREATE TABLE IF NOT EXISTS writings.writing_systems (
  id SERIAL PRIMARY KEY,
  writing_system TEXT NOT NULL UNIQUE,
  metadata JSONB NOT NULL DEFAULT '{}',
  comment TEXT
);

CREATE TABLE IF NOT EXISTS languages.language_types (
  id SERIAL PRIMARY KEY,
  language_type TEXT NOT NULL UNIQUE,
  metadata JSONB NOT NULL DEFAULT '{}',
  comment TEXT
);

CREATE TABLE IF NOT EXISTS languages.languages (
  id SERIAL PRIMARY KEY,
  language TEXT NOT NULL UNIQUE,
  language_type TEXT NOT NULL, FOREIGN KEY (language_type) REFERENCES language_types(language_type),
  metadata JSONB NOT NULL DEFAULT '{}',
  comment TEXT
);

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
  phoneme TEXT NOT NULL UNIQUE,
  metadata JSONB NOT NULL DEFAULT '{}',
  comment TEXT
);

CREATE TABLE IF NOT EXISTS typology.word_orders (
  id SERIAL PRIMARY KEY,
  word_order TEXT NOT NULL UNIQUE,
  metadata JSONB NOT NULL DEFAULT '{}',
  comment TEXT
);
