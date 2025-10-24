DELIMITER //

CREATE TRIGGER after_question_insert
AFTER INSERT ON questions
FOR EACH ROW
BEGIN
    UPDATE quiz
    SET total_questions = total_questions + 1
    WHERE quiz_id = NEW.quiz_id;
END //

DELIMITER ;


INSERT INTO questions (quiz_id, question_text)
VALUES (1, 'New Python question?'); 
select * from questions;