-- script ranks country origins of bands, ordered by the number of (non-unique) fans

SELECT origin, SUM(fans) as nb_fans 
FROM
    metal_bands
GROUP BY 1
ORDER BY 2 DESC;
