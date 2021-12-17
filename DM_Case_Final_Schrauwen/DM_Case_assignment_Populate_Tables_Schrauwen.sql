USE [Case_Assignment]
GO
--- inserting data into Venue table
INSERT INTO dbo.Venue(venueName, venueCapacity, venueAddress)
VALUES('Little Lodge', 120, 'Sahatie 2, Vantaa'),
('The Lodge', 1200, 'Helsinginkatu 56, 00260 Helsinki'),
('Speakeasy', 600, 'Eteläranta 10, 00130 Helsinki')

--- inserting data into Artist table

INSERT INTO dbo.Artist(artistName, artistType, isDomestic, email, phone, specialRequest)
VALUES
('Shannon Schrauwen', 'standup comedian', 1, 'bgr676@nyy.haaga-helia.fi', '0401567829', 'Puppies'),
('Doja Cat', 'Singer', 0, 'doja@cat.com', '+2349028198762', 'Gold toilet seat'),
('Land del Rey', 'Band', 0, 'land@delrey.com', '+23509126421', 'Helium balloons'),
('Olivia Rodrigo', 'Singer', 1, 'olly@roddy.com', '23548123', 'What stays in Vegas'),
('Dua Lipa', 'Rapper', 0, 'dua@lipa.com', '+12364197623', NULL),
('Death Star Troopers', 'Dance company', 1, 'dance@troopers.com', '+5187116578412', 'Milk bar, mountain dew fountain')

--- inserting data into Event table
INSERT INTO dbo.Event
(
artistName, 
price, 
eventType, 
eventName, 
startDate, 
endDate, 
startTime, 
endTime, 
status, 
venueId, 
capacity)
VALUES
('Doja Cat', 12.99, 'Concert', 'Stormbringer 2022','2022-06-02', '2022-06-03', '15:00', '00:00', 'Future',3, NULL),
('Shannon Schrauwen', 45.99, 'Comedy special', 'Live in action', '2022-08-24', '2022-08-24', '12:00', '17:00', 'Cancelled',1, NULL),
('Land del Rey', 123.67, 'Concert', 'Bring the jam', '2022-09-05', '2022-09-05', '09:00', '23:00', 'Future', 4, NULL),
('Death Star Troopers', 13.99, 'Dance performance', 'Shoot Me in the heart', '2020-12-20', '2021-12-20', '14:00', '18:00', 'Completed', 3, 450),
('Death Star Troopers', 13.99, 'Dance performance', 'Shoot Me in the heart', '2020-12-21', '2021-12-21', '14:00', '18:00', 'Completed', 3, 450),
('Death Star Troopers', 13.99, 'Dance performance', 'Shoot Me in the heart', '2020-12-22', '2021-12-22', '14:00', '18:00', 'Completed', 3, 450),
('Death Star Troopers', 13.99, 'Dance performance', 'Shoot Me in the heart', '2020-12-23', '2021-12-23', '14:00', '18:00', 'Completed', 3, 450),
('Death Star Troopers', 14.99, 'Dance performance', 'Drop it like its a blaster', '2021-12-20', '2021-12-20', '14:00', '18:00', 'Ongoing', 3, 450),
('Death Star Troopers', 14.99, 'Dance performance', 'Drop it like its a blaster', '2021-12-21', '2021-12-21', '14:00', '18:00', 'Ongoing', 3, 450),
('Death Star Troopers', 14.99, 'Dance performance', 'Drop it like its a blaster', '2021-12-22', '2021-12-22', '14:00', '18:00', 'Ongoing', 3, 450),
('Death Star Troopers', 14.99, 'Dance performance', 'Drop it like its a blaster', '2021-12-23', '2021-12-23', '14:00', '18:00', 'Ongoing', 3, 450),
('Death Star Troopers', 15.99, 'Dance performance', 'It was the Wookie', '2022-12-20', '2021-12-20', '14:00', '18:00', 'Future', 3, 450),
('Death Star Troopers', 15.99, 'Dance performance', 'It was the Wookie', '2022-12-21', '2021-12-21', '14:00', '18:00', 'Future', 3, 450),
('Death Star Troopers', 15.99, 'Dance performance', 'It was the Wookie', '2022-12-22', '2021-12-22', '14:00', '18:00', 'Future', 3, 450),
('Death Star Troopers', 15.99, 'Dance performance', 'It was the Wookie', '2022-12-23', '2021-12-23', '14:00', '18:00', 'Future', 3, 450),
('Olivia Rodrigo', 156.90, 'Concert', 'Sour', '2023-01-13', '2023-03-13', '13:00', '23:00', 'Future', 4, NULL),
('Olivia Rodrigo', 156.90, 'Concert', 'Sour', '2021-01-13', '2021-03-13', '13:00', '23:00', 'Cancelled', 4, NULL)

UPDATE EVENT
SET Event.artistId = Artist.artistId
FROM EVENT
INNER JOIN Artist ON Event.artistName = Artist.artistName
WHERE Event.artistId IS NULL



--- inserting data into Client table
INSERT INTO dbo.Client(phoneNumber)
VALUES
('1745498413'),
('2456451451'),
('5230755128'),
('1508000651'),
('2465075457'),
('9702285332'),
('7147713662'),
('6228259231')

--- inserting data into Booking table
INSERT INTO dbo.Booking (eventName, numberOfTickets, paymentStatus, bookingDate, phoneNumber)
VALUES
('Shoot Me in the heart', 5, 1, '2020-01-11', '2456451451'),
('Shoot Me in the heart', 30, 1, '2020-10-12', '7147713662'),
('Shoot Me in the heart', 50, 1, '2020-10-12', '6228259231'),
('Shoot Me in the heart', 30, 1, '2020-09-12', '12344124124'),
('Shoot Me in the heart', 5, 1, '2020-01-11', '12412431434'),
('Shoot Me in the heart', 30, 1, '2020-10-12', '565454451'),
('Shoot Me in the heart', 50, 1, '2020-10-12', '12315446546'),
('Shoot Me in the heart', 30, 1, '2020-09-12', '1745498413'),
('Shoot Me in the heart', 5, 1, '2020-01-11', '4354564538'),
('Shoot Me in the heart', 30, 1, '2020-10-12', '454453453'),
('Shoot Me in the heart', 50, 1, '2020-10-12', '45345643,5'),
('Shoot Me in the heart', 30, 1, '2020-09-12', '4537856312'),
('Shoot Me in the heart', 5, 1, '2020-01-11', '4257352357'),
('Shoot Me in the heart', 30, 1, '2020-10-12', '1231456'),
('Shoot Me in the heart', 50, 1, '2020-10-12', '121233143'),
('Stormbringer 2022', 30, 1, '2021-09-12', '1745498413'),
('Stormbringer 2022', 5, 1, '2021-01-11', '2456451451'),
('Stormbringer 2022', 30, 1, '2021-10-12', '7147713662'),
('Stormbringer 2022', 50, 1, '2021-10-12', '6228259231'),
('Stormbringer 2022', 30, 1, '2021-09-12', '12344124124'),
('Stormbringer 2022', 5, 1, '2021-01-11', '12412431434'),
('Stormbringer 2022', 30, 1, '2021-10-12', '565454451'),
('Stormbringer 2022', 50, 1, '2021-10-12', '12315446546'),
('Stormbringer 2022', 30, 1, '2021-09-12', '17454498413'),
('Stormbringer 2022', 30, 1, '2021-10-12', '454453453'),
('Stormbringer 2022', 50, 1, '2021-10-12', '453452643,5'),
('Stormbringer 2022', 30, 1, '2021-09-12', '45378156312'),
('Stormbringer 2022', 5, 1, '2021-01-11', '4257312352357'),
('Stormbringer 2022', 30, 1, '2021-10-12', '1231123456'),
('Stormbringer 2022', 50, 1, '2021-10-12', '1212233143'),
('Stormbringer 2022', 30, 1, '2021-09-12', '13131232131'),
('Live in action', 5, 1, '2020-01-11', '123412546546'),
('Live in action', 30, 1, '2020-10-12', '7147713662'),
('Live in action', 50, 1, '2020-10-12', '1245436546'),
('Live in action', 30, 1, '2020-09-12', '123546547'),
('Live in action', 5, 1, '2020-01-11', '12412431434'),
('Live in action', 30, 1, '2020-10-12', '565454451'),
('Live in action', 50, 1, '2020-10-12', '12315446546'),
('Stormbringer 2022', 30, 1, '2020-09-12', '123124141'),
('Stormbringer 2022', 5, 1, '2020-01-11', '12312415'),
('Stormbringer 2022', 30, 1, '2020-10-12', '124125252'),
('Stormbringer 2022', 50, 1, '2020-10-12', '453452643,5'),
('Stormbringer 2022', 30, 1, '2020-09-12', '12312414'),
('Bring the jam', 5, 1, '2020-01-11', '1543564363'),
('Bring the jam', 30, 1, '2020-10-12', '1231123456'),
('Bring the jam', 50, 1, '2020-10-12', '1212233143'),
('Stormbringer 2022', 30, 1, '2020-09-12', '123124141'),
('Stormbringer 2022', 5, 1, '2021-01-11', '12312415'),
('Stormbringer 2022', 30, 1, '2021-10-12', '124125252'),
('Stormbringer 2022', 50, 1, '2021-10-12', '453452643,5'),
('Stormbringer 2022', 30, 1, '2020-09-12', '12312414'),
('Bring the jam', 7, 1, '2021-01-11', '12454363634'),
('Bring the jam', 3, 1, '2021-10-13', '123125436546'),
('Bring the jam', 50, 1, '2021-11-12', '1425647657'),
('Stormbringer 2022', 30, 1, '2020-11-12', '124125252'),
('Stormbringer 2022', 50, 1, '2021-12-12', '453452643,5'),
('Stormbringer 2022', 30, 1, '2020-10-12', '12312414'),
('Bring the jam', 5, 1, '2020-01-11', '1543564363'),
('Bring the jam', 30, 1, '2020-10-12', '1231123456'),
('Bring the jam', 50, 1, '2020-10-12', '1212233143'),
('Stormbringer 2022', 30, 1, '2020-09-12', '123124141'),
('Stormbringer 2022', 5, 1, '2021-01-11', '12312415'),
('Stormbringer 2022', 30, 1, '2021-10-12', '124125252'),
('Stormbringer 2022', 50, 1, '2021-10-12', '453452643,5'),
('Stormbringer 2022', 30, 1, '2020-09-12', '12312414'),
('Drop it like its a blaster', 57, 1, '2021-01-11', '23423542'),
('Drop it like its a blaster', 3, 1, '2021-10-12', '123125436546'),
('Drop it like its a blaster', 50, 1, '2021-10-12', '1425647657'),
('Drop it like its a blaster', 30, 1, '2021-09-12', '1745498413'),
('Drop it like its a blaster', 5, 1, '2021-01-11', '2456451451'),
('Drop it like its a blaster', 30, 1, '2021-10-12', '7147713662'),
('Drop it like its a blaster', 50, 1, '2021-10-12', '6228259231'),
('Drop it like its a blaster', 30, 1, '2021-09-12', '12344124124'),
('Drop it like its a blaster', 5, 1, '2021-01-11', '12412431434'),
('Drop it like its a blaster', 30, 1, '2021-10-12', '565454451'),
('Drop it like its a blaster', 50, 1, '2021-10-12', '12315446546'),
('Drop it like its a blaster', 30, 1, '2021-09-12', '1745498413'),
('Drop it like its a blaster', 5, 1, '2021-01-11', '4354564538'),
('Drop it like its a blaster', 30, 1, '2021-10-12', '454453453'),
('Drop it like its a blaster', 50, 1, '2021-10-12', '45345643,5'),
('Drop it like its a blaster', 30, 1, '2021-09-12', '4537856312'),
('Drop it like its a blaster', 5, 1, '2021-01-11', '4257352357'),
('Drop it like its a blaster', 30, 1, '2021-10-12', '1231456'),
('Drop it like its a blaster', 50, 1, '2021-10-12', '121233143')


