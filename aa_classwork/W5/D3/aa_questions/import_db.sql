DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY, 
  fname TEXT NOT NULL, 
  lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    body TEXT NOT NULL, 

    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
); 

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE question_followers (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Ignacio', 'Herrera'),
    ('Anthonie', 'Lorsithong'),
    ('Paulo', 'Bocanegra'),
    ('Mike', 'Madsen'),
    ('Chris', 'Cheasty');

INSERT INTO 
    questions (title, body)
VALUES
    ('Dog Missing', 'Does anyone know where my dog is?'),
    ('Need Roommate', 'Would anyone like to be my roommate?'),
    ('DFS Question', 'Why do you need unless nil if statement?');

INSERT INTO
    question_follows (user_id, question_id)
VALUES
    (1, 1),
    (2, 2),
    (1, 3);
    
INSERT INTO
    replies (user_id, question_id, parent_id, body)
VALUES
    (2, 1, NULL, 'I stole it.'),
    (3, 2, NULL, 'Please contact me.'),
    (1, 2, 2, 'I also want to be your roommate.'),
    (4, 3, NULL, 'Please ask a question in Progress Tracker.'),
    (1, 3, 4, 'Thank you. I just did');

INSERT INTO
    question_likes (user_id, question_id)
VALUES  
    (1, 1),
    (2, 1),
    (3, 3),
    (5, 3),
    (4, 1);

INSERT INTO
    question_followers(user_id, question_id)
VALUES
    (1,3),
    (1,1),
    (2,2),
    (4,1),
    (5,1),
    (3,2),
    (3,1),
    (4,3),
    (5,2);




    