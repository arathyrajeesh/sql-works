DELIMITER //

CREATE PROCEDURE TopPerformers()
BEGIN
    SELECT 
        u.username,
        COUNT(*) AS total_score
    FROM user_answer ua
    JOIN options o ON ua.selected_option_id = o.option_id
    JOIN user u ON ua.user_id = u.user_id
    WHERE o.is_correct = TRUE
    GROUP BY u.user_id
    ORDER BY total_score DESC
    LIMIT 3;
END //

DELIMITER ;
CALL TopPerformers();


