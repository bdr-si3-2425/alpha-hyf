SELECT p.IdPost, p.Content, COUNT(DISTINCT v.IdUser) AS TotalViews, COUNT(DISTINCT l.IdUser) AS TotalLikes, COUNT(DISTINCT s.IdUser) AS TotalShares
FROM Post p
LEFT JOIN MyViews v ON p.IdPost = v.IdPost
LEFT JOIN Likes l ON p.IdPost = l.IdPost
LEFT JOIN Shares s ON p.IdPost = s.IdPost
GROUP BY p.IdPost
ORDER BY TotalViews DESC, TotalLikes DESC, TotalShares DESC;
