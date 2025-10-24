DELIMITER //

CREATE TRIGGER after_question_delete
AFTER DELETE ON questions
FOR EACH ROW
BEGIN
    DELETE FROM options WHERE question_id = OLD.question_id;
END //

DELIMITER ;


DELETE FROM questions WHERE question_id = 6;
select * from questions;