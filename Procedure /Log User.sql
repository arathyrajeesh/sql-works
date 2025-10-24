CREATE TABLE user_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    activity VARCHAR(100),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
        ON DELETE CASCADE
);

INSERT INTO user_log (user_id, activity) VALUES
(1, 'User logged in'),
(2, 'Started a quiz'),
(3, 'Submitted answers');

DELIMITER //

CREATE TRIGGER after_answer_insert
AFTER INSERT ON user_answer
FOR EACH ROW
BEGIN
    INSERT INTO user_log (user_id, activity)
    VALUES (NEW.user_id, 'Submitted an answer');
END //

DELIMITER ;
INSERT INTO user_answer (user_id, question_id, selected_option_id)
VALUES (1, 4, 10);
select * from user_answer;
