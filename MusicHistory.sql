SELECT * FROM Genre;
--List all by Genre

Select * from Artist Order By ArtistName
--Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords




Select s.title, s.ArtistId, a.Id, a.ArtistName from Song s
join Artist a on s.ArtistId = a.Id
--Write a SELECT query that lists all the songs in the Song table and include the Artist name




Select * from Artist a
join Album al on a.id = al.ArtistId
join Genre g on al.GenreId = g.Id
Where al.GenreId = 7
-- or use Where g.name = 'Pop'
--Write a SELECT query that lists all the Artists that have a Pop Album


Select * from Artist a
join Album al on al.ArtistId =  a.Id
join Genre g on al.GenreId = g.Id
where g.Name = 'Rock' OR g.Name = 'Jazz'
--Write a SELECT query that lists all the Artists that have a Jazz or Rock Album

Select Title from Album
Where AlbumLength = 0
--Write a SELECT statement that lists the Albums with no songs


INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Talking Heads', '1975');
--Using the INSERT statement, add one of your favorite artists to the Artist table.
--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
--Using the INSERT statement, add some songs that are on that album to the Song table.




--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.




Select a.Title, Count (s.Id) AS '# of songs'
from Album a
left Join Song s on a.Id = s. AlbumId
group by a.Title
--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

Select	a.ArtistName, Count(s.Id) as '# of songs'
From Artist a
Left Join Song s on s.ArtistId = a.Id
group by a.ArtistName
--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.


Select g.Name, Count(s.Id) as '# of songs'
from Genre g
Left Join Song s on s.GenreId = g.Id
group by g.Name
--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

Select a.ArtistName, Count(al.Label) as '# of labels'
from Artist a
left Join Album al on al.ArtistId = a.Id
Group by a.ArtistName
Having Count (distinct al.Label) > 1

--Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword

Select al.Title, al.AlbumLength
From Album al
Where AlbumLength = (Select Max(AlbumLength) from Album)
--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.


Select s.Title, s.Songlength
from Song s
Where s.SongLength = (Select Max(s.Songlength) from Song s)
--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
--Modify to show the title of the album
Select s.Title, s.Songlength
from Song s
join Album a on s.AlbumId = a.Id
Where s.SongLength = (Select Max(s.Songlength) from Song s)