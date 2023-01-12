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
        IF OLD.valid_email = 0
        THEN
            SET NEW.valid_email = 1;
        ELSE
            SET NEW.valid_email = 0;
        END IF;
    END IF;
END//

DELIMITER  ;
