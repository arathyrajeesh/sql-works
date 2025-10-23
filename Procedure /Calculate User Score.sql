use procedurework;

CREATE TABLE user_answers (
answer_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
question_id INT,
selected_option_id INT
);
INSERT INTO user_answers (user_id,question_id,selected_option_id) VALUES ('1','10',2), ('23','11',3), ('4','12',1);

CREATE TABLE options (
option_id INT AUTO_INCREMENT PRIMARY KEY,
question_id INT,
option_text VARCHAR(255),
is_correct BOOLEAN
);
INSERT INTO options (question_id,option_text,is_correct) VALUES ('1','false',2), ('6','correct',3), ('4','false',1);
