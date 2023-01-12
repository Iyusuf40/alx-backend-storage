-- script lists all bands with Glam rock as their main style, ranked by their longevity

DROP FUNCTION IF EXISTS nulToCurrentYear;

DELIMITER //

-- function checks if date is null and returns current year instead
CREATE FUNCTION nulToCurrentYear(date1 YEAR) RETURNS YEAR DETERMINISTIC
BEGIN
    DECLARE date2 YEAR;
    SET date2 = 2020; -- YEAR(CURDATE());
    IF date1 IS NULL
    THEN
        RETURN date2;
    ELSE
        RETURN date1;
    END IF;
END 

//
-- return to default delimeter
DELIMITER ;

-- main select statement
SELECT band_name, (nulToCurrentYear(split) - formed) as lifespan
FROM
    metal_bands
WHERE style LIKE "%Glam rock%"
ORDER BY lifespan DESC, 1 ASC;

DROP FUNCTION nulToCurrentYear;
