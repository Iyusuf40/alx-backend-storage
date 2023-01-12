-- script creates a stored procedure AddBonus that adds a new correction for a student.

DELIMITER //

CREATE PROCEDURE AddBonus(IN user_id INT, IN project_name VARCHAR(255), IN score INT)
BEGIN
    SELECT count(*) into @ct FROM projects WHERE projects.name = project_name;
    IF @ct >= 1
    THEN
        -- project exists : insert corection
        SELECT id into @p_id FROM projects WHERE projects.name = project_name;
        INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, @p_id, score);
    ELSE
        -- create project before making corrections
        INSERT INTO projects (name) VALUES (project_name);
        SELECT id into @p_id FROM projects WHERE projects.name = project_name;
        INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, @p_id, score);
    END IF;
END//

DELIMITER ;
