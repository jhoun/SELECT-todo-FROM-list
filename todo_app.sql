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

-- drops 'completed' column
ALTER TABLE tasks DROP COLUMN completed;

-- adds 'completed_at' and sets default value to null
ALTER TABLE tasks ADD COLUMN completed_at timestamp;
ALTER TABLE tasks
  ALTER COLUMN completed_at SET DEFAULT NULL;

-- set 'updated at' constraint to not null && default is set to now()
ALTER TABLE tasks
  ALTER COLUMN updated_at SET DEFAULT now(),
  ALTER COLUMN updated_at SET NOT NULL;



INSERT INTO tasks(id, title, description, created_at, updated_at, completed_at)
VALUES(1, 'Study SQL', 'Complete this exercise', now(), now(), NULL);
