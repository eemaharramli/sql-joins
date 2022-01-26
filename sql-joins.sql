					/*		Creating and start using Cinema Database		*/

--create database Cinema
--use Cinema

					/*		Creating Table Customers		*/

create table Customers
(
	customer_id int primary key identity,
	customer_name nvarchar(20) not null,
	customer_surname nvarchar(40) not null,
	customer_phone nvarchar(20) not null
)

					/*		Creating Table Actors		*/

create table Actors
(
	actor_id int primary key identity,
	actor_name nvarchar(20) not null,
	actor_surname nvarchar(40) not null,
	actor_gender nvarchar(1) not null,
	record_movies int not null
)
 

					/*		Creating Table Genres		*/

create table Genres
(
	genre_id int primary key identity,
	genre_name nvarchar(20) not null,
)

					/*		Creating Table Movies		*/

create table Movies
(
	movie_id int primary key identity,
	movie_name nvarchar(30) not null unique,
	movie_duration nvarchar(20) not null,
	movie_record_date date default '2000-01-01'
)

					/*		Creating Table Halls		*/

create table Halls
(
	hall_id int primary key identity,
	hall_name nvarchar(20) not null,
	is_vip bit default 0 not null
)

					/*		Creating Table MoviesGenres		*/

create table MoviesGenres
(
	movie_id int references Movies(movie_id),
	genre_id int references Genres(genre_id)
)

					/*		Creating Table MoviesActors		*/

create table MoviesActors
(
	movie_id int references Movies(movie_id),
	actor_id int references Actors(actor_id)
)

					/*		Creating Table Sessions		*/

create table Sessions
(
	session_id int primary key identity,
	session_movie int references Movies(movie_id),
	hall_id int references Halls(hall_id)
)

					/*		Creating Table Tickets		*/

create table Tickets
(
	ticket_id int primary key identity,
	session_id int references Sessions(session_id),
	customer_id int references Customers(customer_id)
)


------------------------------------------Insert values  ------------------------------------

					/*		Insert Data	Customers		*/

insert into Customers
values
('Elnur', 'Maharramli', '055-111-11-11'),
('Orxan', 'Nasibli', '050-222-22-22'),
('Sabir', 'Amirli','051-333-33-33'),
('Madat', 'Nazaraliyev', '077-444-44-44'),
('Xeyali', 'Mammadov', '070-555-55-55'),
('Akif', 'Talibov', '099-666-66-66')

					/*		Insert Data	Actors	*/

insert into Actors
values
('Robert', 'Dauni', 'm', 1),
('Gwyneth', 'Paltrow', 'w', 1),
('Jon', 'Favreau', 'm', 1),
('Kianu', 'Reeves', 'm', 2),
('Rachel', 'Vice', 'w', 2),
('Peter', 'Stromare', 'm', 2),
('Kianu', 'Reeves', 'm', 3),
('Carrie Anne', 'Moss', 'w', 3),
('Laurence', 'Fishburne', 'm', 3),
('Lin', 'Shaye', 'w', 4),
('Patrick', 'Wilson', 'm', 4),
('Rose', 'Byrne', 'w', 4)

					/*		Insert Data	Genres	*/

insert into Genres
values
('Action'), 
('Comedy'),
('Fantasy'),
('Horror'),
('Thriller'),
('Mystery')

					/*		Insert Data	Halls	*/

insert into Halls
values
('Diamond', 1),
('Platinum', 0),
('Platinum 2', 0)

					/*		Insert Data	Movies  	*/

insert into Movies(movie_name, movie_duration)
values
('Iron man', '2 hours 6 minutes'),
('Constantine', '2 hours 1 minute'),
('Matrix', '2 hours 16 minutes')

					/*		Insert Data	MoviesActors  	*/

insert into MoviesActors
values
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 10),
(4, 11),
(4, 12)

select * from Movies
select * from Actors
select * from MoviesActors

delete from MoviesActors
