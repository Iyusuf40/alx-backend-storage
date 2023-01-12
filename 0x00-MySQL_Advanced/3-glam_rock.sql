-- script lists all bands with Glam rock as their main style, ranked by their longevity

DROP FUNCTION IF EXISTS nulToCurrentYear;

DELIMITER //

-- function checks if date is null and returns current year instead
CREATE FUNCTION nulToCurrentYear(date1 year) RETURNS year DETERMINISTIC
BEGIN
    DECLARE date2 year;
    SET date2 = year(curdate());
    IF date1 IS NULL
    THEN
        RETURN date2;
    ELSE
        RETURN date1;
    END IF;
END 

//

DELIMITER ;

SELECT band_name, (nulToCurrentYear(split) - formed) as lifespan
FROM
    metal_bands
WHERE style LIKE "%Glam rock%"
ORDER BY lifespan DESC;

DROP FUNCTION nulToCurrentYear;
