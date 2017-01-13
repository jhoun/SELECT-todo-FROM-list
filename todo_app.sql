\c jay;

DROP USER IF EXISTS michael;

CREATE USER michael
WITH ENCRYPTED PASSWORD 'SecretPassword';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
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

-- creates new task
INSERT INTO tasks VALUES(DEFAULT,'Study SQL', 'Complete this exercise', now(), now(), NULL);

-- creates 2nd new task
INSERT INTO tasks VALUES(DEFAULT, 'Study PostgreSQL', 'Read all the documentation');

-- selects 'completed_at' column && checks if it's null, then returns to you
SELECT completed_at FROM tasks WHERE completed_at IS NULL;

-- updates tasks by grabbing title and setting it
UPDATE tasks
  SET completed_at = now()
  WHERE title = 'Study SQL';

-- selects tasks that are not yet complete
SELECT * FROM tasks WHERE completed_at IS NULL;