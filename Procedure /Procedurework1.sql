create database procedurework;
use procedurework;

CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(100)
);

INSERT INTO user (username, email, password) VALUES
('Alice', 'alice@example.com', 'pass123'),
('Bob', 'bob@example.com', 'pass456'),
('Charlie', 'charlie@example.com', 'pass789'),
('David', 'david@example.com', 'pass111'),
('Eva', 'eva@example.com', 'pass222');

select * from user;
DELIMITER //
CREATE PROCEDURE ShowUsers()
BEGIN
    SELECT user_id, username, email
    FROM user;
END//
DELIMITER ;

CALL ShowUsers();

