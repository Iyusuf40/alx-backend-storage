-- script creates a stored procedure ComputeAverageWeightedScoreForUsers 
-- that computes and store the weighted average score for a student.

-- STRATEGY: GET ALL WEIGHTED AVG OF ALL USERS BY USING A SUBQUERY / WITH CTE
-- UPDATE ALL USERS BASED ON THE ABOVE EXTRACTED TABLE

DELIMITER //

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers ;

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers ()
BEGIN
    UPDATE users, (
        -- SUBQUERY TO GET ALL WEIGHTED AVG OF ALL USERS 
        SELECT corrections.user_id as id, SUM( corrections.score * projects.weight) / SUM(projects.weight) as scores
        FROM  corrections
        JOIN projects
        ON projects.id = corrections.project_id
        GROUP BY 1
    ) as av SET average_score = av.scores WHERE av.id = users.id;
END//

DELIMITER ;

-- WITH CTE VERSION BELOW
-- DELIMITER //

-- DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers ;

-- CREATE PROCEDURE ComputeAverageWeightedScoreForUsers ()
-- BEGIN
--     WITH 
--     av AS ( 
--         SELECT corrections.user_id as id, SUM( corrections.score * projects.weight) / SUM(projects.weight) as scores
--             FROM  corrections
--             JOIN projects
--             ON projects.id = corrections.project_id
--             GROUP BY 1
--     )
--     UPDATE users, av SET users.average_score = av.scores
--     WHERE av.id = users.id;
-- END//

-- DELIMITER ;
