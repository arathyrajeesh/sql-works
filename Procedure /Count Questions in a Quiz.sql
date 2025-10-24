use procedurework;

CREATE TABLE questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    quiz_id INT,
    question_text VARCHAR(255),
    FOREIGN KEY (quiz_id) REFERENCES quiz(quiz_id)
        ON DELETE CASCADE
);

INSERT INTO questions (quiz_id, question_text) VALUES
(1, 'What is the keyword to define a function in Python?'),
(1, 'Which data type is immutable in Python?'),
(1, 'What symbol is used for comments in Python?'),
(2, 'What is a primary key in a database?'),
(2, 'What does SQL stand for?'),
(3, 'What does HTML stand for?'),
(3, 'Which CSS property changes text color?'),
(3, 'What is the default port for HTTP?');

DELIMITER //
CREATE PROCEDURE CountQuestions(
    IN p_quiz_id INT
)
BEGIN
    SELECT COUNT(*) AS TotalQuestions
    FROM questions
    WHERE quiz_id = p_quiz_id;
END //

DELIMITER ;

CALL CountQuestions(3);
select * from questions;
