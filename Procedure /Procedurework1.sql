create database procedurework;
use procedurework;

create TABLE users (user_id INT AUTO_INCREMENT PRIMARY KEY,username VARCHAR(50),email VARCHAR(100));
INSERT INTO users (username,email) VALUES ('arathy','arathy@gmail.com'), ('aparna','aparna@gmail.com'), ('avani','avani@gmail.com');

DELIMITER //
CREATE PROCEDURE ShowAllUser()
BEGIN
    SELECT user_id, username, email
    FROM users;
END//
DELIMITER ;

CALL ShowAllUser();