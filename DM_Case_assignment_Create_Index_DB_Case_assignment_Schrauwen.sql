--Creating indexes for Event table

USE Case_Assignment
GO

CREATE INDEX ix_eventName
ON Event(eventName)

CREATE INDEX ix_FK_venueId
ON Event(venueId)

CREATE INDEX ix_Date
ON Event(startDate, endDate)

CREATE INDEX ix_eventType
ON Event(eventType)

CREATE INDEX ix_capacity
ON Event(capacity)

CREATE INDEX ix_artistName
ON Event(artistName)

--Creating indexes for Booking table
CREATE INDEX ix_FK_eventId
ON Booking(eventId)

CREATE INDEX ix_refundState
ON Booking(refundStatus)

CREATE INDEX ix_eventName
ON Booking(eventName)

--Creating indexes for Artist table
CREATE INDEX ix_artistName
ON Artist(artistName)

CREATE INDEX ix_artistType
ON Artist(artistType)

CREATE INDEX ix_isDomestic
ON Artist(isDomestic)

--Creating index for Venue table
CREATE INDEX ix_venueName
ON Venue(venueName)
