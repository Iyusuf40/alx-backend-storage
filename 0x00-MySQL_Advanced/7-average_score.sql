-- script creates a stored procedure ComputeAverageScoreForUser
-- that computes and store the average score for a student.

DELIMITER //

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    SELECT SUM(score) / COUNT(score) into @av FROM  corrections WHERE corrections.user_id = user_id;
    UPDATE users SET average_score = @av WHERE id = user_id;
END//

DELIMITER ;
