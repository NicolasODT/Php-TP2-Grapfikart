-- Active: 1672850799043@@127.0.0.1@3306@tutoblog

CREATE DATABASE tutoblog DEFAULT CHARACTER SET = 'utf8mb4';

USE tutoblog;

CREATE TABLE
    post (
        id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        slug VARCHAR(255) NOT NULL,
        content TEXT NOT NULL,
        Created_at DATETIME NOT NULL
    );

CREATE TABLE
    category (
        id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        slug VARCHAR(255) NOT NULL
    );

CREATE TABLE
    post_category (
        post_id INT UNSIGNED NOT NULL,
        category_id INT UNSIGNED NOT NULL,
        PRIMARY KEY (post_id, category_id),
        CONSTRAINT fk_post FOREIGN KEY (post_id) REFERENCES post (id) ON DELETE CASCADE ON UPDATE RESTRICT,
        CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES category (id) ON DELETE CASCADE ON UPDATE RESTRICT
    );

CREATE TABLE
    user (
        id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(255) NOT NULL,
        password VARCHAR(255) NOT NULL
    );

INSERT INTO
    category (name, slug)
VALUES ('categorie #1', 'categorie-1');

INSERT INTO
    category (name, slug)
VALUES ('categorie #2', 'categorie-2');

INSERT INTO
    post (name, slug, content, Created_at)
VALUES (
        'article de test',
        'carticle-test',
        'lorem ipsupm',
        '2019-05-11'
    );

INSERT INTO
    post_category (post_id, category_id)
VALUES ('1', '1');

INSERT INTO
    post_category (post_id, category_id)
VALUES ('1', '2');

SELECT * FROM post_category pc WHERE pc.post_id = 1;

SELECT *
FROM post_category pc
    LEFT JOIN category c ON pc.category_id = c.id
WHERE pc.post_id = 1;