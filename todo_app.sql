\c jay;

DROP USER IF EXISTS michael;

CREATE USER michael
WITH ENCRYPTED PASSWORD 'SecretPassword';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id integer PRIMARY KEY,
  title varchar,
  description text,
  created_at timestamp,
  updated_at timestamp,
  completed boolean
);

ALTER TABLE tasks DROP COLUMN completed;

INSERT INTO tasks(id, title, description, completed)
VALUES(1, 'do homework', 'finish assignment', true);