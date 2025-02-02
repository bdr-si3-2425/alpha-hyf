CREATE OR REPLACE FUNCTION GetTopInfluencersInGroup(groupId INT)
RETURNS TABLE(
    UserName VARCHAR(50),
    UserSurname VARCHAR(50),
    InfluenceCount BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT u.Name, u.Surname, COUNT(*) AS InfluenceCount
    FROM MyUser u
    JOIN (
        SELECT IdUser FROM Likes WHERE IdPost IN (SELECT IdPost FROM Post WHERE IdGroup = groupId)
        UNION ALL
        SELECT IdUser FROM Shares WHERE IdPost IN (SELECT IdPost FROM Post WHERE IdGroup = groupId)
        UNION ALL
        SELECT IdUser FROM MyComments WHERE IdPost IN (SELECT IdPost FROM Post WHERE IdGroup = groupId)
    ) AS Interactions ON u.IdUser = Interactions.IdUser
    GROUP BY u.IdUser
    ORDER BY InfluenceCount DESC;
END;
$$ LANGUAGE plpgsql;

SELECT * from GetTopInfluencersInGroup(1); --change idGroup to suit your needs