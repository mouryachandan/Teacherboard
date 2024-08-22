CREATE TABLE Assessments (
    ID SERIAL PRIMARY KEY,
    Title VARCHAR(255),
    Type VARCHAR(50),
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatedBy INT REFERENCES Users(ID)
);

CREATE TABLE Users (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50)
);

CREATE TABLE Activities (
    ID SERIAL PRIMARY KEY,
    AssessmentID INT REFERENCES Assessments(ID),
    UserID INT REFERENCES Users(ID),
    ActionType VARCHAR(50),
    Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Analytics (
    ID SERIAL PRIMARY KEY,
    AssessmentID INT REFERENCES Assessments(ID),
    AverageScore DECIMAL,
    CompletionRate DECIMAL
);
