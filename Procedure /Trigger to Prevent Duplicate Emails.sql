DELIMITER //

CREATE TRIGGER before_user_insert
BEFORE INSERT ON `user`
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM `user` WHERE email = NEW.email) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Email already exists!';
    END IF;
END //

DELIMITER ;


INSERT INTO `user` (username, email, password)
VALUES ('TestUser', 'alice@example.com', 'pass999');

