CREATE OR REPLACE FUNCTION RecommendGroups(IN userId INT)
RETURNS TABLE(GroupName VARCHAR(50), Interest VARCHAR(50)) AS $$
BEGIN
    RETURN QUERY
    SELECT g.NameGrp, g.Interest
    FROM MyGroup g
    WHERE g.Interest IN (
        SELECT g2.Interest
        FROM Joins j
        JOIN MyGroup g2 ON j.IdGroup = g2.IdGroup
        WHERE j.IdUser = userId
    )
    AND g.IdGroup NOT IN (
        SELECT IdGroup FROM Joins WHERE IdUser = userId
    )
    LIMIT 5;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM RecommendGroups(1);  
