CREATE OR REPLACE FUNCTION GetMostEngagedGroups()
RETURNS TABLE(GroupName VARCHAR(50), InteractionCount BIGINT) AS $$
BEGIN
    RETURN QUERY
    SELECT g.NameGrp, COUNT(*) AS InteractionCount
    FROM Post p
    JOIN MyGroup g ON p.IdGroup = g.IdGroup
    JOIN (
        SELECT IdPost FROM Likes
        UNION ALL
        SELECT IdPost FROM Shares
        UNION ALL
        SELECT IdPost FROM MyComments
    ) AS Interactions ON p.IdPost = Interactions.IdPost
    GROUP BY g.NameGrp
    ORDER BY InteractionCount DESC;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM GetMostEngagedGroups();