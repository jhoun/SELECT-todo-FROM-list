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
INSERT INTO tasks(id, title, description, completed)
VALUES(1, 'do homework', 'finish assignment', true);

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at timestamp;

ALTER TABLE tasks ALTER COLUMN completed_at SET DEFAULT null;
