use procedurework;

CREATE TABLE options (
    option_id INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT,
    option_text VARCHAR(255),
    is_correct BOOLEAN,
    FOREIGN KEY (question_id) REFERENCES questions(question_id)
        ON DELETE CASCADE
);

INSERT INTO options (question_id, option_text, is_correct) VALUES
(1, 'def', TRUE),
(1, 'function', FALSE),
(1, 'func', FALSE),
(2, 'Tuple', TRUE),
(2, 'List', FALSE),
(2, 'Dictionary', FALSE),
(3, '#', TRUE),
(3, '//', FALSE),
(3, '/*', FALSE),
(4, 'A unique identifier for records', TRUE),
(4, 'A foreign key', FALSE),
(5, 'Structured Query Language', TRUE),
(5, 'System Query Log', FALSE),
(6, 'HyperText Markup Language', TRUE),
(6, 'Home Tool Markup Language', FALSE),
(7, 'color', TRUE),
(7, 'font', FALSE),
(8, '80', TRUE),
(8, '8080', FALSE);

CREATE TABLE user_answer (
    answer_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    question_id INT,
    selected_option_id INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
        ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(question_id)
        ON DELETE CASCADE,
    FOREIGN KEY (selected_option_id) REFERENCES options(option_id)
        ON DELETE CASCADE
);

INSERT INTO user_answer (user_id, question_id, selected_option_id) VALUES
(1, 1, 1),  
(1, 2, 4),  
(1, 3, 7),  
(2, 1, 2),  
(2, 2, 4),  
(2, 3, 8), 
(3, 1, 1),  
(3, 2, 5),  
(3, 3, 7),  
(4, 1, 3),  
(5, 1, 1);  

select * from user_answer;


DELIMITER //

CREATE PROCEDURE CalculateUserScore(IN p_user_id INT)
BEGIN
    SELECT 
        u.username,
        COUNT(*) AS total_correct
    FROM user_answer ua
    JOIN options o ON ua.selected_option_id = o.option_id
    JOIN user u ON ua.user_id = u.user_id
    WHERE o.is_correct = TRUE
      AND ua.user_id = p_user_id
    GROUP BY u.username;
END //

DELIMITER ;


CALL CalculateUserScore(3);
