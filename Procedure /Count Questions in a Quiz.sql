use procedurework;

CREATE TABLE questions (
question_id INT AUTO_INCREMENT PRIMARY KEY,
quiz_id INT,
question_text VARCHAR(255)
);
INSERT INTO questions (quiz_id,question_text) VALUES ('1','what is django'), ('23','what is python'), ('4','what is c');

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

CALL CountQuestions(2);
select * from questions;