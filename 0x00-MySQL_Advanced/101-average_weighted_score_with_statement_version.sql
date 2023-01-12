-- script creates a stored procedure ComputeAverageWeightedScoreForUsers 
-- that computes and store the weighted average score for a student.

DELIMITER //

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers ;

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers ()
BEGIN
    -- CREATE TEMP TABLE TO HOLD EACH USER WITH THEIR AGGREGATED WEIGHTED AVG;
    WITH 
    av AS ( 
        SELECT corrections.user_id as id, SUM( corrections.score * projects.weight) / SUM(projects.weight) 
        AS scores
            FROM  corrections
            JOIN projects
            ON projects.id = corrections.project_id
            GROUP BY 1
    )
    -- USE BOTH TEM TABLE 'av' AND USERS TABLE TO UPDATE CALCULATED AVG
    UPDATE users, av SET users.average_score = av.scores
    WHERE av.id = users.id;
END//

DELIMITER ;
