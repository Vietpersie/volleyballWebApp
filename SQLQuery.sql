CREATE TABLE Users (
    userID INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    email VARCHAR(50),
    role VARCHAR(20) CHECK (role IN ('Player', 'Coach', 'Admin'))
);

CREATE TABLE Players (
    playerID INT PRIMARY KEY,
    userID INT,
    name VARCHAR(50),
    age INT,
    position VARCHAR(50),
    FOREIGN KEY (userID) REFERENCES Users(userID)
);

CREATE TABLE Coaches (
    coachID INT PRIMARY KEY,
    userID INT,
    name VARCHAR(50),
    experience INT,
    FOREIGN KEY (userID) REFERENCES Users(userID)
);

CREATE TABLE Admins (
    adminID INT PRIMARY KEY,
    userID INT,
    privileges VARCHAR(50),
    FOREIGN KEY (userID) REFERENCES Users(userID)
);

CREATE TABLE Teams (
    teamID INT PRIMARY KEY,
    teamName VARCHAR(50),
    coachID INT,
    FOREIGN KEY (coachID) REFERENCES Coaches(coachID)
);

CREATE TABLE TeamInformation (
    teamID INT,
    playerIDs VARCHAR(255),
    details TEXT,
    PRIMARY KEY (teamID),
    FOREIGN KEY (teamID) REFERENCES Teams(teamID)
);

CREATE TABLE Tournaments (
    tournamentID INT PRIMARY KEY,
    name VARCHAR(50),
    description TEXT,
    startDate DATE,
    endDate DATE,
    location VARCHAR(100),
    rules TEXT,
    prizes TEXT
);

CREATE TABLE TournamentInformation (
    tournamentID INT,
    details TEXT,
    PRIMARY KEY (tournamentID),
    FOREIGN KEY (tournamentID) REFERENCES Tournaments(tournamentID)
);

CREATE TABLE Matches (
    matchID INT PRIMARY KEY,
    tournamentID INT,
    teamAID INT,
    teamBID INT,
    date DATE,
    location VARCHAR(100),
    FOREIGN KEY (tournamentID) REFERENCES Tournaments(tournamentID),
    FOREIGN KEY (teamAID) REFERENCES Teams(teamID),
    FOREIGN KEY (teamBID) REFERENCES Teams(teamID)
);

CREATE TABLE MatchSchedules (
    matchID INT,
    details TEXT,
    PRIMARY KEY (matchID),
    FOREIGN KEY (matchID) REFERENCES Matches(matchID)
);

CREATE TABLE MatchResults (
    matchID INT,
    scoreTeamA INT,
    scoreTeamB INT,
    PRIMARY KEY (matchID),
    FOREIGN KEY (matchID) REFERENCES Matches(matchID)
);

CREATE TABLE MatchEvents (
    eventID INT PRIMARY KEY,
    matchID INT,
    eventType VARCHAR(50),
    description TEXT,
    FOREIGN KEY (matchID) REFERENCES Matches(matchID)
);

CREATE TABLE Registrations (
    registrationID INT PRIMARY KEY,
    userID INT,
    teamID INT,
    date DATE,
    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (teamID) REFERENCES Teams(teamID)
);

CREATE TABLE PlayerRegistrations (
    playerID INT,
    registrationDate DATE,
    PRIMARY KEY (playerID),
    FOREIGN KEY (playerID) REFERENCES Players(playerID)
);

CREATE TABLE TeamRegistrations (
    teamID INT,
    registrationDate DATE,
    PRIMARY KEY (teamID),
    FOREIGN KEY (teamID) REFERENCES Teams(teamID)
);

CREATE TABLE Notifications (
    notificationID INT PRIMARY KEY,
    userID INT,
    message TEXT,
    date DATE,
    FOREIGN KEY (userID) REFERENCES Users(userID)
);
