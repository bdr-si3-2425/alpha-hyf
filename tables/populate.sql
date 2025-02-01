-- Insert sample data into MyUser table
INSERT INTO MyUser (IdUser, Name, Surname, BirthDate) VALUES
(1, 'John', 'Doe', '1990-05-15'),
(2, 'Jane', 'Smith', '1985-08-25'),
(3, 'Alice', 'Johnson', '1995-03-10'),
(4, 'Bob', 'Brown', '1980-11-20'),
(5, 'Charlie', 'Davis', '1992-07-12'),
(6, 'Eva', 'Green', '1988-09-30'),
(7, 'Frank', 'Wilson', '1991-04-18'),
(8, 'Grace', 'Harris', '1987-12-05'),
(9, 'David', 'Martinez', '1993-06-14'),
(10, 'Sophia', 'Lopez', '1989-02-22'),
(11, 'Liam', 'Garcia', '1994-11-30'),
(12, 'Emma', 'Rodriguez', '1990-07-08'),
(13, 'Noah', 'Hernandez', '1986-03-25'),
(14, 'Olivia', 'Perez', '1991-09-12'),
(15, 'Ethan', 'Torres', '1988-04-18'),
(16, 'Ava', 'Flores', '1995-12-05');

-- Insert sample data into MyGroup table (groups with the same interests)
INSERT INTO MyGroup (IdGroup, Interest, NameGrp) VALUES
(1, 'Technology', 'Tech Enthusiasts'),
(2, 'Sports', 'Football Fans'),
(3, 'Music', 'Rock Music Lovers'),
(4, 'Technology', 'Tech Innovators'),
(5, 'Sports', 'Basketball Fans'),
(6, 'Music', 'Jazz Music Lovers'),
(7, 'Technology', 'AI Enthusiasts'),
(8, 'Sports', 'Tennis Fans'),
(9, 'Music', 'Classical Music Lovers'),
(10, 'Technology', 'Blockchain Innovators'),
(11, 'Sports', 'Cricket Fans'),
(12, 'Music', 'Pop Music Fans');

-- Insert sample data into Friends table (mutual friends and indirect connections)
INSERT INTO Friends (IdUser1, IdUser2) VALUES
(1, 2),  -- John and Jane are friends
(1, 3),  -- John and Alice are friends
(1, 4),  -- John and Bob are friends
(2, 3),  -- Jane and Alice are friends
(2, 4),  -- Jane and Bob are friends
(3, 5),  -- Alice and Charlie are friends
(4, 6),  -- Bob and Eva are friends
(5, 7),  -- Charlie and Frank are friends
(6, 8),  -- Eva and Grace are friends
(5, 9),  -- Charlie and David are friends
(6, 10), -- Eva and Sophia are friends
(7, 11), -- Frank and Liam are friends
(8, 12), -- Grace and Emma are friends
(9, 13), -- David and Noah are friends
(10, 14),-- Sophia and Olivia are friends
(11, 15),-- Liam and Ethan are friends
(12, 16);-- Emma and Ava are friends

-- Insert sample data into Follows table
INSERT INTO Follows (IdUserFollower, IdUserFollowed) VALUES
(1, 2),  -- John follows Jane
(1, 3),  -- John follows Alice
(2, 3),  -- Jane follows Alice
(2, 4),  -- Jane follows Bob
(3, 6),  -- Alice follows Eva
(4, 5),  -- Bob follows Charlie
(5, 8),  -- Charlie follows Grace
(6, 7),  -- Eva follows Frank
(9, 10), -- David follows Sophia
(10, 11),-- Sophia follows Liam
(11, 12),-- Liam follows Emma
(12, 13),-- Emma follows Noah
(13, 14),-- Noah follows Olivia
(14, 15),-- Olivia follows Ethan
(15, 16);-- Ethan follows Ava

-- Insert sample data into Joins table
INSERT INTO Joins (IdGroup, IdUser) VALUES
(1, 1),  -- John joins Tech Enthusiasts
(1, 2),  -- Jane joins Tech Enthusiasts
(2, 3),  -- Alice joins Football Fans
(3, 4),  -- Bob joins Rock Music Lovers
(4, 5),  -- Charlie joins Tech Innovators
(5, 6),  -- Eva joins Basketball Fans
(6, 7),  -- Frank joins Jazz Music Lovers
(4, 8),  -- Grace joins Tech Innovators
(7, 9),  -- David joins AI Enthusiasts
(8, 10), -- Sophia joins Tennis Fans
(9, 11), -- Liam joins Classical Music Lovers
(10, 12),-- Emma joins Blockchain Innovators
(11, 13),-- Noah joins Cricket Fans
(12, 14);-- Olivia joins Pop Music Fans

-- Insert sample data into Post table
INSERT INTO Post (IdPost, Content, Date, Visibility, IdUser, IdGroup) VALUES
(1, 'Excited about the new tech gadgets!', '2023-10-01', 'public', 1, 1),
(2, 'Great game last night!', '2023-10-02', 'public', 2, 2),
(3, 'Check out this new rock album!', '2023-10-03', 'private', 3, 3),
(4, 'Looking forward to the weekend!', '2023-10-04', 'public', 4, NULL),
(5, 'The future of AI is exciting!', '2023-10-05', 'public', 5, 4),
(6, 'Basketball season is back!', '2023-10-06', 'public', 6, 5),
(7, 'Jazz is the soul of music.', '2023-10-07', 'private', 7, 6),
(8, 'Tech conferences are so inspiring.', '2023-10-08', 'public', 8, 4),
(9, 'AI is transforming industries!', '2023-10-09', 'public', 9, 7),
(10, 'Excited for the tennis tournament!', '2023-10-10', 'public', 10, 8),
(11, 'Classical music is timeless.', '2023-10-11', 'private', 11, 9),
(12, 'Blockchain is the future of finance.', '2023-10-12', 'public', 12, 10),
(13, 'Cricket is more than just a sport.', '2023-10-13', 'public', 13, 11),
(14, 'Pop music is always evolving.', '2023-10-14', 'private', 14, 12);

-- Insert sample data into MyViews table (users must view posts before interacting)
INSERT INTO MyViews (IdPost, IdUser) VALUES
(1, 2),  -- Jane views John's post
(1, 3),  -- Alice views John's post
(2, 4),  -- Bob views Jane's post
(3, 5),  -- Charlie views Alice's post
(4, 6),  -- Eva views Bob's post
(5, 1),  -- John views Charlie's post
(6, 2),  -- Jane views Eva's post
(7, 3),  -- Alice views Frank's post
(8, 4),  -- Bob views Grace's post
(9, 10), -- Sophia views David's post
(10, 11),-- Liam views Sophia's post
(11, 12),-- Emma views Liam's post
(12, 13),-- Noah views Emma's post
(13, 14),-- Olivia views Noah's post
(14, 15);-- Ethan views Olivia's post

-- Insert sample data into Likes table (users can only like posts they've viewed)
INSERT INTO Likes (IdPost, IdUser) VALUES
(1, 2),  -- Jane likes John's post
(1, 3),  -- Alice likes John's post
(2, 4),  -- Bob likes Jane's post
(5, 1),  -- John likes Charlie's post
(6, 2),  -- Jane likes Eva's post
(9, 10), -- Sophia likes David's post
(10, 11),-- Liam likes Sophia's post
(12, 13),-- Noah likes Emma's post
(13, 14);-- Olivia likes Noah's post

-- Insert sample data into Shares table (users can only share posts they've viewed)
INSERT INTO Shares (IdPost, IdUser) VALUES
(1, 2),  -- Jane shares John's post
(2, 4),  -- Bob shares Jane's post
(5, 1),  -- John shares Charlie's post
(6, 2),  -- Jane shares Eva's post
(9, 10), -- Sophia shares David's post
(10, 11),-- Liam shares Sophia's post
(12, 13),-- Noah shares Emma's post
(13, 14);-- Olivia shares Noah's post

-- Insert sample data into MyComments table (users can only comment on posts they've viewed)
INSERT INTO MyComments (IdComment, IdPost, IdUser, Content) VALUES
(1, 1, 2, 'I agree, the new gadgets are amazing!'),  -- Jane comments on John's post
(2, 2, 4, 'It was an incredible game!'),             -- Bob comments on Jane's post
(3, 5, 1, 'AI is indeed the future!'),              -- John comments on Charlie's post
(4, 6, 2, 'Cant wait for the games!'),            -- Jane comments on Eva's post
(5, 9, 10, 'AI is indeed revolutionary!'),          -- Sophia comments on David's post
(6, 10, 11, 'Cant wait for the tournament!'),     -- Liam comments on Sophia's post
(7, 12, 13, 'Blockchain is fascinating!'),          -- Noah comments on Emma's post
(8, 13, 14, 'Cricket is a way of life!');           -- Olivia comments on Noah's post
