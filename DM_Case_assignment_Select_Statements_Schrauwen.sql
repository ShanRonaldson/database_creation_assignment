USE Case_Assignment
GO

-- Transaction 1 - Making booking 
INSERT INTO dbo.Booking (eventName, numberOfTickets, paymentStatus, bookingDate, phoneNumber)
VALUES('Bring the jam', 3, 0, '2021-12-21', '212681231574')

INSERT INTO dbo.Booking (eventName, numberOfTickets, paymentStatus, phoneNumber)
VALUES('Bring the jam', 3, 0,'212681231574')

-- Transaction 2 - Changing a number of tickets in booking
UPDATE Booking
SET numberOfTickets = 4 WHERE bookingNumber = 23

UPDATE Booking
SET numberOfTickets = 40 WHERE bookingNumber = 2

-- Transaction 3 - Cancelling a ticket booking
DELETE FROM Booking WHERE bookingNumber = 4

DELETE FROM Booking WHERE bookingNumber = 10

-- Transaction 4 - Changing the status of booking to sold when tickets are purchased(the booking is paid for)
UPDATE Booking SET paymentStatus = 1 WHERE phoneNumber = '212681231574'

-- Transaction 5 - Removing unpurchased bookings from the database after three days from booking
DELETE FROM Booking WHERE
GETDATE() > DATEADD(d, 3, bookingDate)

-- Transaction 6 - Cancelling an event(in an extreme exceptional case)
UPDATE Event SET status = 'Cancelled' WHERE eventName = 'Live in action' AND startDate = '2022-08-24'

-- Transaction 7 - Refunding a client in a case of a cancelled event
-- done automatically by trigger

-- Question 1 - What is Doja Cat's contact email? 
SELECT email FROM Artist WHERE artistName = 'Doja Cat'

-- Question 2 - How many tickets are there left for Land del Rey's concert on 5.9.2022?
SELECT (capacity - SUM(numberOfTickets)) AS "Remaining Tickets" FROM Booking
INNER JOIN Event ON (Booking.eventName = Event.eventName)
WHERE artistName = 'Land del Rey' AND startDate = '2022-09-05'
GROUP BY capacity

-- Question 3 - What dance performances are coming up this month?
SELECT Event.eventName, startDate, artistName
FROM Event
Inner join Booking ON (Event.eventName = Booking.eventName)
WHERE eventType LIKE '%dance%'
AND startDate BETWEEN GETDATE() AND DATEADD(month, 1, GETDATE())
GROUP BY Event.EventName, startDate, artistName

-- Question 4 - When will Olivia Rodrigo perform in Paisley and what are her special requests for catering?
SELECT startDate, specialRequest, status
FROM Event
INNER JOIN Artist ON (Event.artistName = Artist.artistName)
WHERE Event.artistName = 'Olivia Rodrigo'

-- Question 5 - How many  tickets  have  been  sold this  far to Dua  Lipa's dance  performance  ''Stormbringer 2022" that takes place on 2.6.2022?
SELECT (SUM(numberOfTickets)) AS "Number of tickets sold"
FROM Booking 
WHERE eventName = 'Stormbringer 2022'


-- Question 6 - How much money has the Paisley Event Association got from sold tickets this year?
SELECT (SUM(price * numberOfTickets)) AS "Total Money from Sold Tickets"
FROM Booking 
INNER JOIN Event ON Booking.eventName = Event.eventName

-- Question 7 - Which artist has sold the highest number of tickets this year. Please notice that the artist can have performed several times this year.All the artist's performances count here.
SELECT artistName, SUM(numberOFTickets) AS "Total tickets sold"
FROM Booking
INNER JOIN Event ON Booking.eventName = Event.eventName
WHERE YEAR(startDate) > YEAR(GETDATE())
GROUP BY artistName
ORDER BY "Total tickets sold"