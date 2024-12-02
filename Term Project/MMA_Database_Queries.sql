-- Author: Peyton J. Hall

-- Create Fighter table
CREATE TABLE Fighter (
    FighterID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    WeightClass VARCHAR(50),
    Height FLOAT,
    Weight FLOAT,
    CountryOfOrigin VARCHAR(50)
);

-- Create Gym table
CREATE TABLE Gym (
    GymID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Location VARCHAR(100)
);

-- Create Coach table
CREATE TABLE Coach (
    CoachID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Specialty VARCHAR(50),
    GymID INT,
    FOREIGN KEY (GymID) REFERENCES Gym(GymID)
);

-- Create Fight Record table
CREATE TABLE FightRecord (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    FighterID INT,
    Wins INT,
    Losses INT,
    Draws INT,
    Knockouts INT,
    FOREIGN KEY (FighterID) REFERENCES Fighter(FighterID)
);

-- Create Sponsor table
CREATE TABLE Sponsor (
    SponsorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Industry VARCHAR(50)
);

-- Create Fighter Sponsor table
CREATE TABLE FighterSponsor (
    FighterSponsorID INT AUTO_INCREMENT PRIMARY KEY,
    FighterID INT,
    SponsorID INT,
    FOREIGN KEY (FighterID) REFERENCES Fighter(FighterID),
    FOREIGN KEY (SponsorID) REFERENCES Sponsor(SponsorID)
);

-- Create Medical Record table
CREATE TABLE MedicalRecord (
    MedicalID INT AUTO_INCREMENT PRIMARY KEY,
    FighterID INT,
    RecentInjury VARCHAR(100),
    MedicalClearance DATE,
    FOREIGN KEY (FighterID) REFERENCES Fighter(FighterID)
);

-- Create Fight Contract table
CREATE TABLE FightContract (
    ContractID INT AUTO_INCREMENT PRIMARY KEY,
    FighterID INT,
    ContractDate DATE,
    ContractEnd DATE,
    Payment DECIMAL(10, 2),
    FOREIGN KEY (FighterID) REFERENCES Fighter(FighterID)
);


INSERT INTO Fighter (FighterID, Name, WeightClass, Height, Weight, CountryOfOrigin) VALUES
(1, 'Conor McGregor', 'Lightweight', 5.9, 155, 'Ireland'),
(2, 'Amanda Nunes', 'Featherweight', 5.8, 145, 'Brazil'),
(3, 'Israel Adesanya', 'Middleweight', 6.4, 185, 'Nigeria'),
(4, 'Kamaru Usman', 'Welterweight', 6.0, 170, 'Nigeria'),
(5, 'Valentina Shevchenko', 'Flyweight', 5.5, 125, 'Kyrgyzstan'),
(6, 'Francis Ngannou', 'Heavyweight', 6.4, 260, 'Cameroon'),
(7, 'Julianna Peña', 'Bantamweight', 5.6, 135, 'USA'),
(8, 'Max Holloway', 'Featherweight', 5.11, 145, 'USA');

INSERT INTO Gym (GymID, Name, Location) VALUES
(1, 'SBG Ireland', 'Dublin, Ireland'), -- Conor McGregor's gym
(2, 'American Top Team', 'Coconut Creek, Florida, USA'), -- Amanda Nunes' gym
(3, 'City Kickboxing', 'Auckland, New Zealand'), -- Israel Adesanya's gym
(4, 'Sanford MMA', 'Deerfield Beach, Florida, USA'), -- Kamaru Usman's gym
(5, 'Tiger Muay Thai', 'Phuket, Thailand'), -- Valentina Shevchenko's gym
(6, 'Xtreme Couture', 'Las Vegas, Nevada, USA'), -- Francis Ngannou's gym
(7, 'Sikjitsu', 'Spokane, Washington, USA'), -- Julianna Peña's gym
(8, 'Gracie Technics', 'Honolulu, Hawaii, USA'); -- Max Holloway's gym

INSERT INTO Coach (CoachID, Name, Specialty, GymID) VALUES
(1, 'John Kavanagh', 'MMA', 1), -- Coach of Conor McGregor
(2, 'Mike Brown', 'MMA', 2), -- Coach of Amanda Nunes
(3, 'Eugene Bareman', 'Striking', 3), -- Coach of Israel Adesanya
(4, 'Trevor Wittman', 'Striking', 4), -- Coach of Kamaru Usman
(5, 'Pavel Fedotov', 'Muay Thai', 5); -- Coach of Valentina Shevchenko

INSERT INTO FightRecord (RecordID, FighterID, Wins, Losses, Draws, Knockouts) VALUES
(1, 1, 22, 6, 0, 19), -- Conor McGregor
(2, 2, 23, 5, 0, 13), -- Amanda Nunes
(3, 3, 24, 3, 0, 15), -- Israel Adesanya
(4, 4, 20, 2, 0, 9), -- Kamaru Usman
(5, 5, 23, 4, 0, 8), -- Valentina Shevchenko
(6, 6, 17, 3, 0, 12), -- Francis Ngannou
(7, 7, 11, 5, 0, 3), -- Julianna Peña
(8, 8, 24, 7, 0, 10); -- Max Holloway

INSERT INTO Sponsor (SponsorID, Name, Industry) VALUES
(1, 'Monster Energy', 'Energy Drinks'),
(2, 'Reebok', 'Sportswear'),
(3, 'Nike', 'Sportswear'),
(4, 'Under Armour', 'Sportswear'),
(5, 'Red Bull', 'Energy Drinks'),
(6, 'Venum', 'Sportswear'),
(7, 'Crypto.com', 'Finance'),
(8, 'BodyArmor', 'Sports Drinks');

INSERT INTO FighterSponsor (FighterSponsorID, FighterID, SponsorID) VALUES
(1, 1, 1), -- Conor McGregor is sponsored by Monster Energy
(2, 2, 2), -- Amanda Nunes is sponsored by Reebok
(3, 3, 3), -- Israel Adesanya is sponsored by Nike
(4, 4, 4), -- Kamaru Usman is sponsored by Under Armour
(5, 5, 5), -- Valentina Shevchenko is sponsored by Red Bull
(6, 6, 6), -- Francis Ngannou is sponsored by Venum
(7, 7, 7), -- Julianna Peña is sponsored by Crypto.com
(8, 8, 8); -- Max Holloway is sponsored by BodyArmor

INSERT INTO MedicalRecord (MedicalID, FighterID, RecentInjury, MedicalClearance) VALUES
(1, 1, 'Fractured Tibia', '2024-01-15'), -- Conor McGregor’s recent injury
(2, 2, 'No Recent Injury', '2024-03-01'), -- Amanda Nunes cleared for competition
(3, 3, 'Pectoral Tear', '2023-12-10'), -- Israel Adesanya’s injury
(4, 4, 'Hand Surgery', '2024-02-20'), -- Kamaru Usman’s recent surgery
(5, 5, 'No Recent Injury', '2024-04-05'), -- Valentina Shevchenko cleared for competition
(6, 6, 'Knee Injury', '2024-05-15'), -- Francis Ngannou’s knee injury
(7, 7, 'Shoulder Dislocation', '2023-11-30'), -- Julianna Peña’s recent injury
(8, 8, 'No Recent Injury', '2024-01-20'); -- Max Holloway cleared for competition

INSERT INTO FightContract (ContractID, FighterID, ContractDate, ContractEnd, Payment) VALUES
(1, 1, '2024-01-01', '2024-12-31', 5000000.00), -- Conor McGregor's contract
(2, 2, '2024-02-01', '2024-12-31', 2000000.00), -- Amanda Nunes' contract
(3, 3, '2024-03-01', '2024-12-31', 3000000.00), -- Israel Adesanya's contract
(4, 4, '2024-01-15', '2024-12-15', 2500000.00), -- Kamaru Usman's contract
(5, 5, '2024-04-01', '2024-12-01', 1500000.00), -- Valentina Shevchenko's contract
(6, 6, '2024-02-10', '2024-12-31', 4000000.00), -- Francis Ngannou's contract
(7, 7, '2024-01-25', '2024-11-25', 1200000.00), -- Julianna Peña's contract
(8, 8, '2024-03-15', '2024-12-15', 1800000.00); -- Max Holloway's contract


-- 1. Get fighters' records for those weighing between 155 to 200 lbs
SELECT F.Name AS FighterName, FR.Wins, FR.Losses, FR.Draws, F.Weight
FROM Fighter F
JOIN FightRecord FR ON F.FighterID = FR.FighterID
WHERE F.Weight BETWEEN 155 AND 200;

-- 2. Get a combined list of fighters, their coaches, gyms, and sponsors
SELECT F.Name AS FighterName, C.Name AS CoachName, G.Name AS GymName, S.Name AS SponsorName
FROM Fighter F
JOIN Coach C ON F.FighterID = C.CoachID
JOIN Gym G ON C.GymID = G.GymID
JOIN FighterSponsor FS ON F.FighterID = FS.FighterID
JOIN Sponsor S ON FS.SponsorID = S.SponsorID;

-- 3. Retrieve fighters' contracts sorted by payment amount from highest to lowest
SELECT F.Name AS FighterName, FC.Payment
FROM Fighter F
JOIN FightContract FC ON F.FighterID = FC.FighterID
ORDER BY FC.Payment DESC;

-- 4. Get a list of fighters who have no recent injuries
SELECT F.Name AS FighterName, MR.RecentInjury
FROM Fighter F
JOIN MedicalRecord MR ON F.FighterID = MR.FighterID
WHERE MR.RecentInjury = 'No Recent Injury';

-- 5. Calculate the total number of wins by fighters grouped by their country of origin
SELECT F.CountryOfOrigin, SUM(FR.Wins) AS TotalWins
FROM Fighter F
JOIN FightRecord FR ON F.FighterID = FR.FighterID
GROUP BY F.CountryOfOrigin
ORDER BY TotalWins DESC;

-- 6. List fighters and the gyms they are associated with
SELECT F.Name AS FighterName, G.Name AS GymName
FROM Fighter F
JOIN Gym G ON F.FighterID = G.GymID;

-- 7. Get a list of fighters sponsored by a specific company, e.g., "Nike"
SELECT F.Name AS FighterName, S.Name AS SponsorName
FROM Fighter F
JOIN FighterSponsor FS ON F.FighterID = FS.FighterID
JOIN Sponsor S ON FS.SponsorID = S.SponsorID
WHERE S.Name = 'Nike';

-- 8. Retrieve all coaches and their specialties
SELECT C.Name AS CoachName, C.Specialty
FROM Coach C;

-- 9. Find fighters with contracts that are expiring in the next 6 months
SELECT F.Name AS FighterName, FC.ContractEnd
FROM Fighter F
JOIN FightContract FC ON F.FighterID = FC.FighterID
WHERE FC.ContractEnd BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 6 MONTH);

-- 10. Calculate the total contract payments for fighters grouped by their weight class
SELECT F.WeightClass, SUM(FC.Payment) AS TotalPayment
FROM Fighter F
JOIN FightContract FC ON F.FighterID = FC.FighterID
GROUP BY F.WeightClass
ORDER BY TotalPayment DESC;

-- Create a view for fighters with their gyms and coaches
CREATE VIEW FighterGymCoach AS
SELECT 
    F.FighterID,
    F.Name AS FighterName,
    F.WeightClass,
    G.Name AS GymName,
    C.Name AS CoachName
FROM Fighter F
JOIN Coach C ON F.FighterID = C.CoachID
JOIN Gym G ON C.GymID = G.GymID;

-- 11. Retrieve all fighters, their weight class, gym, and coach information using the view
SELECT FighterName, WeightClass, GymName, CoachName
FROM FighterGymCoach
WHERE WeightClass = 'Lightweight';

