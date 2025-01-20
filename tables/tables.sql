CREATE TABLE if not exists MyUser (
    IdUser INTEGER PRIMARY KEY,
    Name VARCHAR(50),
    Surname VARCHAR(50),
    BirthDate DATE,
    NumFollowers INTEGER,
    NumFollowings INTEGER,
    NumFriends INTEGER
);

CREATE TABLE if not exists MyGroup (
    IdGroup INTEGER PRIMARY KEY,
    Intrest VARCHAR(50),
    NameGrp VARCHAR(50)
);

CREATE TABLE if not exists Friends (
    IdUser1 INTEGER,
    IdUser2 INTEGER,
    PRIMARY KEY (IdUser1, IdUser2),
    FOREIGN KEY (IdUser1) REFERENCES MyUser(IdUser) ON DELETE CASCADE,
    FOREIGN KEY (IdUser2) REFERENCES MyUser(IdUser) ON DELETE CASCADE
);

CREATE TABLE if not exists Follows (
    IdUserFollower INTEGER,
    IdUserFollowed INTEGER,
    PRIMARY KEY (IdUserFollower, IdUserFollowed),
    FOREIGN KEY (IdUserFollower) REFERENCES MyUser(IdUser) ON DELETE CASCADE,
    FOREIGN KEY (IdUserFollowed) REFERENCES MyUser(IdUser) ON DELETE CASCADE
);

CREATE TABLE if not exists Joins (
    IdGroup INTEGER,
    IdUser INTEGER,
    PRIMARY KEY (IdGroup, IdUser),
    FOREIGN KEY (IdGroup) REFERENCES MyGroup(IdGroup) ON DELETE CASCADE,
    FOREIGN KEY (IdUser) REFERENCES MyUser(IdUser) ON DELETE CASCADE
);

CREATE TABLE if not exists Post  (
    IdPost INTEGER PRIMARY KEY,
    Content VARCHAR(255),
    Date DATE,
    Visibility VARCHAR(20),
    IdUser INTEGER,
    IdGroup INTEGER,
    FOREIGN KEY (IdUser) REFERENCES MyUser(IdUser) ON DELETE CASCADE,
    FOREIGN KEY (IdGroup) REFERENCES MyGroup(IdGroup) ON DELETE CASCADE
);

CREATE TABLE if not exists Likes  (
    IdPost INTEGER,
    IdUser INTEGER,
    PRIMARY KEY (IdPost, IdUser),
    FOREIGN KEY (IdPost) REFERENCES Post(IdPost) ON DELETE CASCADE,
    FOREIGN KEY (IdUser) REFERENCES MyUser(IdUser) ON DELETE CASCADE
);

CREATE TABLE if not exists MyViews  (
    IdPost INTEGER,
    IdUser INTEGER,
    PRIMARY KEY (IdPost, IdUser),
    FOREIGN KEY (IdPost) REFERENCES Post(IdPost) ON DELETE CASCADE,
    FOREIGN KEY (IdUser) REFERENCES MyUser(IdUser) ON DELETE CASCADE
);

CREATE TABLE if not exists Shares  (
    IdPost INTEGER,
    IdUser INTEGER,
    PRIMARY KEY (IdPost, IdUser),
    FOREIGN KEY (IdPost) REFERENCES Post(IdPost) ON DELETE CASCADE,
    FOREIGN KEY (IdUser) REFERENCES MyUser(IdUser) ON DELETE CASCADE
);

CREATE TABLE if not exists MyComments  (
    IdPost INTEGER,
    IdUser INTEGER,
    Content VARCHAR(255),
    PRIMARY KEY (IdPost, IdUser),
    FOREIGN KEY (IdPost) REFERENCES Post(IdPost) ON DELETE CASCADE,
    FOREIGN KEY (IdUser) REFERENCES MyUser(IdUser) ON DELETE CASCADE
);

