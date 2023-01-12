-- script creates a trigger that resets the attribute valid_email only when the email has been changed
-- drop trigger before creation

DROP TRIGGER IF EXISTS email_changed;

DELIMITER  //

CREATE TRIGGER email_changed
BEFORE UPDATE
ON users FOR EACH ROW
BEGIN
    IF NEW.email <> OLD.email
    THEN
        SET NEW.valid_email = 1 - OLD.valid_email;
    END IF;
END//

DELIMITER  ;
