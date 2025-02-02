SELECT u.Name, u.Surname, COUNT(*) AS OutsideInteractions
FROM MyUser u
JOIN (
    SELECT l.IdUser FROM Likes l WHERE l.IdPost NOT IN (SELECT p.IdPost FROM Post p WHERE p.IdUser = l.IdUser)
    UNION ALL
    SELECT s.IdUser FROM Shares s WHERE s.IdPost NOT IN (SELECT p.IdPost FROM Post p WHERE p.IdUser = s.IdUser)
    UNION ALL
    SELECT c.IdUser FROM MyComments c WHERE c.IdPost NOT IN (SELECT p.IdPost FROM Post p WHERE p.IdUser = c.IdUser)
) AS OutsideInteractions ON u.IdUser = OutsideInteractions.IdUser
GROUP BY u.IdUser
ORDER BY OutsideInteractions DESC;
