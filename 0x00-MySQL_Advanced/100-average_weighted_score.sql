-- script creates a stored procedure ComputeAverageWeightedScoreForUsers 
-- that computes and store the weighted average score for a student.

DELIMITER //

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser ;

CREATE PROCEDURE ComputeAverageWeightedScoreForUser (IN user_id INT)
BEGIN
    -- SELECT SUM(weight) INT0 @wt_sum FROM projects;
    SELECT SUM( corrections.score * projects.weight) / SUM(projects.weight) into @av FROM  corrections
    JOIN projects
    ON projects.id = corrections.project_id
    WHERE corrections.user_id = user_id;
    UPDATE users SET average_score = @av WHERE id = user_id;
END//

DELIMITER ;
