use procedurework;

CREATE TABLE quiz ( quiz_id INT AUTO_INCREMENT PRIMARY KEY,quiz_title VARCHAR(100),total_questions INT);
INSERT INTO quiz (quiz_title,total_questions) VALUES ('python',10), ('django',3), ('java',8);

DELIMITER //
CREATE PROCEDURE AddQuiz(
    IN p_quiz_title VARCHAR(100),
    IN p_total_questions INT
)
BEGIN
    INSERT INTO quiz (quiz_title, total_questions)
    VALUES (p_quiz_title, p_total_questions);
END //

DELIMITER ;

CALL AddQuiz('SQL Basics Quiz', 10);
select * from quiz;