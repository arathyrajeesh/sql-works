CREATE TABLE deleted_users (
    user_id INT,
    username VARCHAR(50),
    email VARCHAR(100),
    deleted_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER after_user_delete
AFTER DELETE ON user
FOR EACH ROW
BEGIN
    INSERT INTO deleted_users (user_id, username, email)
    VALUES (OLD.user_id, OLD.username, OLD.email);
END //

DELIMITER ;
select * from deleted_users;
DELETE FROM user WHERE user_id = 4; 

