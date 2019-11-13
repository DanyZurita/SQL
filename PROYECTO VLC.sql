PROYECTO VLC
-----------------------------------------------------------------------------------------------------------------------

CREATE DATABASE VLC;
USE VLC;

CREATE TABLE Artist (id VARCHAR(5) NOT NULL PRIMARY KEY, name VARCHAR(50) NOT NULL);

CREATE TABLE Album (id VARCHAR(5) NOT NULL PRIMARY KEY, title VARCHAR(50) NOT NULL);

CREATE TABLE Media_Types (id VARCHAR(5) NOT NULL, name VARCHAR(25));

CREATE TABLE Genre (id VARCHAR(5) NOT NULL, name VARCHAR(25));

CREATE TABLE Playlist (id VARCHAR(5) NOT NULL, name VARCHAR(25));

CREATE TABLE Album_Artist (id_album VARCHAR(5) NOT NULL, id_artist VARCHAR(5) NOT NULL, PRIMARY KEY (id_album, id_artist), FOREIGN KEY (id_album) REFERENCES Album (id), FOREIGN KEY (id_artist) REFERENCES Artist (id)); 

*CREATE TABLE Track (id VARCHAR(5), name VARCHAR(25) NOT NULL, miliseconds REAL DEFAULT 0, bytes REAL DEFAULT 0, id_media_type VARCHAR(5), id_genre VARCHAR(5), PRIMARY KEY (id), FOREIGN KEY (id_media_type) REFERENCES Media_Types (id), FOREIGN KEY (id_genre) REFERENCES Genre (id));

*CREATE TABLE Track_Composer (id_track VARCHAR(5) NOT NULL, id_artist VARCHAR(5) NOT NULL, year DATE, PRIMARY KEY (id_track), PRIMARY KEY (id_artist), FOREIGN KEY (id_track) REFERENCES Track (id), FOREIGN KEY (id_artist) REFERENCES Artist (id));

*CREATE TABLE Album_Tracks (id_album VARCHAR(5) NOT NULL, id_track VARCHAR(5) NOT NULL, number_track REAL, PRIMARY KEY (id_album), PRIMARY KEY (id_track), FOREIGN KEY (id_album) REFERENCES Album (id), FOREIGN KEY (id_track) REFERENCES Track (id));

*CREATE TABLE Track_Composer (id_playlist VARCHAR(5) NOT NULL, id_track VARCHAR(5), number_track REAL, PRIMARY KEY (id_playlist), PRIMARY KEY (id_track), FOREIGN KEY (id_playlist) REFERENCES Playlist (id), FOREIGN KEY (id_track) REFERENCES Track (id));