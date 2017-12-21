//////////////////Practice JOINs///////////////////
Step 1
SELECT * FROM InvoiceLine
WHERE UnitPrice > 0.99

Step 2
SELECT InvoiceDate, FirstName, LastNAme, Total FROM Customer 
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId

Step 3
SELECT Customer.FirstName, Customer.LastName, Employee.FirstName, Employee.LastName FROM Customer
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId

Step 4
SELECT Album.Title, Artist.Name FROM Artist
JOIN Album ON Artist.ArtistId = Album.ArtistId

Step 5
SELECT PlaylistTrack.TrackId FROM PlaylistTrack
JOIN Playlist ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
WHERE Playlist.Name = 'Music'

Step 6
SELECT Track.Name FROM TRACK
JOIN PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId
WHERE PlaylistTrack.PlaylistID = 5;

Step 7
SELECT Track.Name AS Track_Name, Playlist.Name AS Playlist_Name FROM TRACK
JOIN PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId
JOIN Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId;

Step 8
SELECT Track.Name, Album.Title FROM Track
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Genre ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Alternative';




//////////////////Practice nested Queries///////////////////

Step 1
SELECT * FROM Invoice
WHERE InvoiceId IN 
(SELECT InvoiceId FROM InvoiceLine WHERE UnitPrice > 0.99)

Step 2
SELECT * FROM PlaylistTrack
WHERE PlaylistId IN
(SELECT PlaylistId FROM Playlist WHERE Name = 'Music')

Step 3
SELECT Name FROM Track
WHERE TrackId IN 
(SELECT TrackId FROM PlaylistTrack WHERE PlaylistID = 5)

Step 4
SELECT * FROM Track
WHERE GenreId IN
(SELECT GenreId FROM Genre WHERE Name = "Comedy");

Step 5
SELECT * FROM Track
WHERE AlbumId IN
(SELECT AlbumId FROM Album WHERE Title = "Fireball");

Step 6
SELECT * FROM Track
WHERE AlbumId IN
(SELECT AlbumId FROM Album WHERE ArtistId IN
 (SELECT ArtistId FROM Artist WHERE Name = "Queen"));


//////////////////Practice updating Rowss///////////////////

Step 1
UPDATE Customer
SET Fax = null;

Step 2
UPDATE CUSTOMER
SET Company = "Self"
WHERE Company IS null;

Step 3
UPDATE Customer
SET LastName = "Thompson"
WHERE FirstName = "Julia" AND LastName = "Barnett";

Step 4
UPDATE Customer
SET SupportRepId = 4
WHERE Email = 'luisrojas@yahoo.cl'

Step 5
UPDATE Track
SET Composer = "The darkness around us"
WHERE GenreId = ( SELECT GenreId FROM Genre WHERE Name = "Metal" )
AND Composer IS null;



//////////////////'Group By'///////////////////

Step 1
SELECT COUNT(*), Genre.name
FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId
GROUP BY Genre.Name

Step 2
SELECT COUNT(*), Genre.name
FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = "Pop" OR Genre.Name = "Rock"
GROUP BY Genre.Name

Step 3
SELECT COUNT(*), Artist.Name
FROM Artist
JOIN Album ON Artist.ArtistId = Album.ArtistId
GROUP BY Album.ArtistId


//////////////////'Use Distinct'///////////////////

Setp 1
SELECT DISTINCT Composer FROM Track

Step 2
SELECT DISTINCT BillingPostalCode FROM Invoice

Step 3
SELECT DISTINCT Company FROM Customer


//////////////////'Delete Rows'///////////////////

Step 1
done - create table

Step 2
DELETE FROM practice_delete WHERE Type = "bronze"

Step 3
DELETE FROM practice_delete WHERE Type = "silver"

Step 4
DELETE FROM practice_delete WHERE Value = 150

///////eCommerce Simulation - No Hints////////////

Creating Tables
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL, 
  email TEXT NOT NULL UNIQUE
);

CREATE TABLE products (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL, 
  price INTEGER NOT NULL
);

CREATE TABLE orders (
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  product_id INTEGER NOT NULL
);


Filling up data

INSERT INTO users 
(name, email) 
VALUES 
("Austin", "AAAAmazing@gmail"),
("BOB", "MeBob@gmail"),
("Stacy", "StuStuStacy@gmail");

