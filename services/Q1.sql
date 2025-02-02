WITH RECURSIVE IndirectConnections AS (
    SELECT IdUser2 AS FriendId
    FROM Friends
    WHERE IdUser1 = 1
    UNION
    SELECT f.IdUser2
    FROM Friends f
    JOIN IndirectConnections ic ON f.IdUser1 = ic.FriendId
)

SELECT DISTINCT ic.FriendId, g.Interest
FROM IndirectConnections ic
JOIN Joins j ON ic.FriendId = j.IdUser
JOIN MyGroup g ON j.IdGroup = g.IdGroup
WHERE g.Interest IN (
    SELECT g2.Interest
    FROM Joins j2
    JOIN MyGroup g2 ON j2.IdGroup = g2.IdGroup
    WHERE j2.IdUser = 1
);