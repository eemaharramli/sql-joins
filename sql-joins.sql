create database Cinema
use Cinema


                /*      Table Customers      */

create table Customers
(
    customer_id int primary key identity ,
    customer_name nvarchar(20) not null ,
    customer_surname nvarchar(30) not null,
    customer_phone nvarchar(20) not null
)

                /*      Table Genres      */

create table Genres
(
    genre_id   int primary key identity,
    genre_name nvarchar(20) unique
)

                /*      Table Movies      */

create table Movies
(
    movie_id int primary key identity ,
    movie_name nvarchar(30) unique ,
    movie_genre int references Genres(genre_id),
    movie_duration decimal(2, 2) not null,
    movie_rec_date date not null
)

                /*      Table MoviesGenres      */

create table MoviesGenres
(
    movie_id int references Movies(movie_id),
    genre_id int references Genres(genre_id)
)

                /*      Table Actors      */

create table Actors
(
    actor_id int primary key identity ,
    actor_name nvarchar(20) not null ,
    actor_surname nvarchar(30) not null ,
    actor_gender nvarchar(1) not null ,
    record_movies int references Movies(movie_id)
)

                /*      Table MoviesActors      */

create table MoviesActors
(
    movie_id int references Movies(movie_id),
    actor_id int references Actors(actor_id)
)

                /*      Table Halls      */

create table Halls
(
    hall_id int primary key identity ,
    hall_name nvarchar(20) not null ,
    is_vip bit default 0
)

                /*      Table Sessions      */

create table Sessions
(
    session_id int primary key identity ,
    session_movie int references Movies(movie_id),
    session_time decimal(2,2) default 0
)

                /*      Table HallsSessions      */

create table HallsSessions
(
    hall_id int references Halls(hall_id),
    session_id int references Sessions(session_id)
)

                /*      Table Tickets      */

create table Tickets
(
    ticket_id int primary key identity ,
    movies_id int references Movies(movie_id),
    hall_id int references Halls(hall_id),
    session_id int references Sessions(session_id)
)

                /*      Table TicketCustomer      */

create table TicketCustomer
(
    ticket_id int references Tickets(ticket_id),
    customer_id int references Customers(customer_id)
)

--------------------------------------------------------------------- Adding new data ---------------------------------------------------------------------

                 /*      Add data Table Genres      */

insert into Genres
values ('Action'),
       ('comedy'),
       ('documentary'),
       ('drama'),
       ('fantasy'),
       ('gangster'),
       ('history'),
       ('horror'),
       ('military'),
       ('mystery'),
       ('romance'),
       ('super hero'),
       ('thriller'),
       ('western')

                 /*      Add data Table Movies      */

select *
from Movies;
insert into Movies()
