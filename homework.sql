--1. Create a table called Director with following columns: FirstName, LastName, Nationality and Birth date. Insert 5 rows into it.
CREATE TABLE Director (
Id int IDENTITY(1,1) PRIMARY KEY,
FirstName nvarchar(100),
LastName nvarchar(100),
Nationality nvarchar(100),
BirthDate date
);
--2. Create a table called Director with following columns: FirstName, LastName, Nationality and Birth date. Insert 5 rows into it.
INSERT INTO Director
 VALUES('Andreea','Samson','Romanian','1990-01-11'),
           ('Maria','Popescu','Romanian','1991-02-22'),
		   ('Tom','Miller','British','1992-03-05'),
		   ('Andra','Turcescu','Romanian','1993-04-14'),
		   ('Jessica','Smith','American','1994-05-10');

--3. Delete the director with id = 3
DELETE FROM Director WHERE Id=3

--4.Create a table called Movie with following columns: DirectorId, Title, ReleaseDate, Rating and Duration. Each movie has a director. Insert some rows into it
CREATE TABLE Movie (
DirectorId int IDENTITY(1,1) PRIMARY KEY,
Title nvarchar(100),
ReleaseDate Date,
Rating int,
Duration time
);
INSERT INTO Movie
VALUES
('MovieONE','1990-01-11','5','1:05:50'),
('MovieTwo','1991-02-22','6','5:07:22'),
('MovieThree','1992-03-05','7','4:24:55'),
('MovieFour','1993-04-14', '8','3:23:33'),
('MovieFive','1994-05-10','9','2:55:50');

--5. Update all movies that have a rating lower than 10.
UPDATE Movie SET Title='ArtificiallyUpdated' WHERE Rating<10;

--6. Create a table called Actor with following columns: FirstName, LastName, Nationality, Birth date and PopularityRating.
--Insert some rows into it.

CREATE TABLE Actor (
ActorId int IDENTITY(1,1) PRIMARY KEY,
FirstName nvarchar(100),
LastName nvarchar(100),
Nationality nvarchar(100),
BirthDate date,
PopularityRating int
);

INSERT INTO Actor
VALUES
('Leonardo','DiCaprio','American','1974-11-11','1'),
('Johnny','Depp','American','1963-06-09','2'),
('Kate','Winslet','British','1975-10-05','3');

--7. Which is the movie with the lowest rating?
SELECT MIN(Rating) AS SmallestRating FROM Movie

--8. Which director has the most movies directed?
SELECT MAX(Id) AS MostMovieDirected FROM Director;

--9. Display all movies ordered by director's LastName in ascending order, then by birth date descending.
SELECT * FROM Director ORDER BY LastName ASC;
SELECT * FROM Director ORDER BY BirthDate DESC;

--10.Create a function that will calculate and return the average rating of movies for a given director id

SELECT AVG(Rating)
   FROM Movie
 WHERE DirectorId=4;


 --12. Create a stored procedure that will increment the rating by 1 for a given movie id.
UPDATE Movie SET Rating = Rating + 1 WHERE DirectorId=2;

--13.Create a table called MovieHistory with a column for Id and a column for Message. 
--Create a trigger that will add a new entry in the MovieHistory table when a row from Movie's table is updated.

  CREATE TABLE MovieHistory(
MovieHistoryId int IDENTITY(1,1) PRIMARY KEY,
MessageMovie nvarchar(100)
);

--16.Implement many to many relationship between Movie and Genre
 
  CREATE TABLE Genre(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(MAX) NOT NULL
);
 INSERT INTO Genre VALUES('Horror');
 INSERT INTO Genre VALUES('SF');
 INSERT INTO Genre VALUES('Comedies');

 SELECT * FROM Genre;

 CREATE TABLE MovieGenre(
	MovieId int CONSTRAINT fk_movieId REFERENCES Movie(DirectorId),
	GenreId int CONSTRAINT fk_genreId REFERENCES Genre(Id)
);
INSERT INTO MovieGenre(MovieId,GenreId) VALUES(2,1);
INSERT INTO MovieGenre(MovieId,GenreId) VALUES(5,2);
INSERT INTO MovieGenre(MovieId,GenreId) VALUES(1,2);


--17.Which actor has worked with the most distinct movie directors?


--18.Which is the preferred genre of each actor?


--11.Create a view that will display all the movie titles with the directors' first names and last names.

--CREATE  VIEW 
 -- movie_view AS
--SELECT *
--FROM Movie
--WHERE Title<10; 

--14.Create a cursor that will print on the screen all movies with a title shorter than 10 characters

DECLARE db_cursor CURSOR FOR 
SELECT Title
FROM Movie
WHERE Title <10; 

--15.Implement many to many relationship between Movie and Actor

