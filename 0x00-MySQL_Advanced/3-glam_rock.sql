-- script lists all bands with Glam rock as their main style, ranked by their longevity
-- main select statement
SELECT band_name, COALESCE((split - formed), (YEAR(CURDATE()) - formed)) as lifespan
FROM
    metal_bands
WHERE style LIKE "%Glam rock%"
ORDER BY lifespan DESC, 1 ASC;
