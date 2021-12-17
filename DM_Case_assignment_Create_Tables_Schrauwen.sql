--Creating Venue table 
CREATE TABLE Venue
(
venueId INT IDENTITY, 
venueName VARCHAR(50) NOT NULL, 
venueCapacity INT NOT NULL,
venueAddress VARCHAR(50),
CONSTRAINT PK_Venue PRIMARY KEY(venueId),
CONSTRAINT UQ_Venue_venueName UNIQUE(venueName),
CONSTRAINT CHK_Venue_capacity CHECK(venueCapacity > 0)
)

--Creating Artist table 
CREATE TABLE Artist
(
artistId INT IDENTITY, 
artistName VARCHAR(50) NOT NULL,
artistType VARCHAR(50),
isDomestic BIT NOT NULL,
email VARCHAR(50) NOT NULL,
phone VARCHAR(30) NOT NULL, 
specialRequest VARCHAR(50), 
CONSTRAINT PK_Artist PRIMARY KEY(artistId),
CONSTRAINT UQ_Artist_artistName UNIQUE(artistName),
CONSTRAINT CHK_Artist_artistId CHECK(artistId BETWEEN 0 AND 999),
CONSTRAINT CHK_Artist_email CHECK(email LIKE '%@%' )
)
-- BIT´- allows 1, 0 and NULL. not null means only 1 and 0. 1 is true, 0 is false.

--Creating Event table
CREATE TABLE Event
(
eventId INT IDENTITY,
artistId INT,
artistName VARCHAR(50) NOT NULL,
price MONEY NOT NULL,
eventType VARCHAR(50) NOT NULL,
eventName VARCHAR(50) NOT NULL, 
startDate DATE NOT NULL,
endDate DATE NOT NULL,
startTime TIME NOT NULL, 
endTime TIME NOT NULL,
status VARCHAR(50) NOT NULL,
venueId INT NOT NULL,
capacity INT,
CONSTRAINT PK_Event PRIMARY KEY(eventId),
CONSTRAINT FK_Event_Artist FOREIGN KEY(artistId) REFERENCES Artist(artistId),
CONSTRAINT FK_Event_Venue FOREIGN KEY(venueId) REFERENCES Venue(venueId),
CONSTRAINT CHK_Event_status CHECK(status IN ('Future', 'Ongoing', 'Completed', 'Cancelled')),
CONSTRAINT CHK_Event_capacity CHECK(capacity > 0)
)


CREATE TRIGGER dbo.CapacityChkAndArtistIdAdd
ON Event
INSTEAD OF INSERT
AS BEGIN
DECLARE @capacity INT
DECLARE @venueCapacity INT
DECLARE @eventArtistId INT
DECLARE @artistId INT
SELECT @capacity = capacity FROM INSERTED
SELECT @venueCapacity = venueCapacity FROM Venue
IF @capacity IS NULL 
	SET @capacity = @venueCapacity
IF @capacity > @venueCapacity
	SET @capacity = @venueCapacity
SELECT @eventArtistId = artistId FROM INSERTED
SELECT @artistId = artistId FROM Artist
IF @eventArtistId IS NULL 
	SET @eventArtistId = @artistId
INSERT INTO Event (capacity, artistId) VALUES (@capacity, @eventArtistId)
END

CREATE TRIGGER dbo.EventCancelled
ON Event
AFTER UPDATE
AS BEGIN
DECLARE @EventStatus VARCHAR(50)
DECLARE @RefundStatus VARCHAR(50)
DECLARE @eventName VARCHAR(50)
SELECT @EventStatus = status FROM INSERTED
SELECT @eventName = eventName FROM INSERTED
IF @EventStatus = 'Cancelled'
	UPDATE Booking
	SET refundStatus = 'Refundable' WHERE eventName = @eventName
END

--Creating Booking table
CREATE TABLE Booking
(
bookingNumber INT NOT NULL IDENTITY,
eventId INT,
eventName VARCHAR(50) NOT NULL,
numberOfTickets INT NOT NULL,
paymentStatus BIT NOT NULL,
bookingDate DATE DEFAULT(CAST( GETDATE() AS Date )),
dueDate DATE,
refundStatus VARCHAR(50),
phoneNumber VARCHAR(50) NOT NULL,
CONSTRAINT PK_Booking PRIMARY KEY(bookingNumber),
CONSTRAINT FK_Booking_Event FOREIGN KEY(eventId) REFERENCES Event(eventId),
CONSTRAINT CHK_Booking_numberOfTickets CHECK(numberOfTickets > 0)
)