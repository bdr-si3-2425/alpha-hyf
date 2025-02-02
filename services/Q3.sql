BEGIN;

INSERT INTO MyUser (IdUser, Name, Surname, BirthDate) VALUES (17, 'New', 'User', '2000-01-01');

INSERT INTO Friends (IdUser1, IdUser2) VALUES
(17, 1),  
(17, 2);

INSERT INTO Follows (IdUserFollower, IdUserFollowed) VALUES
(3, 17), 
(4, 17),
(17, 5),
(17, 6); 

COMMIT;