create database triggers_;
use triggers_;
CREATE TABLE IF NOT EXISTS films_audit(
 audit_id INT AUTO_INCREMENT PRIMARY KEY,
 film_num INT,
 film_title varchar(254),
 changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 );
 
 DELIMITER $$
 CREATE TRIGGER trg_after_insert_pixar_films
 AFTER INSERT ON pixar_films
 FOR EACH ROW 
 BEGIN
     INSERT INTO films_audit (film_num , film_title)
     VALUES (NEW.number,NEW.film);
END $$
DELIMITER ;
 
select * from films_audit;

INSERT INTO pixar_films(number,film,release_date,run_time,film_rating) 
            values(677,"hanusha",12-08-2018,3,"PG");
select * from pixar_films;



 DELIMITER $$
 CREATE TRIGGER trg_before_insert_genres
 BEFORE INSERT ON genres_
 FOR EACH ROW
 BEGIN 
    IF TRIM(NEW.category) = ''  THEN 
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Genre category cannot be empty';
	END IF;
    END $$
DELIMITER ;
    
SELECT * FROM genres_;
INSERT INTO genres_(film,category,value)
                values("toy story",'',10);
INSERT INTO genres_(film,category,value)
               values("toy story",'Animation',10);
select * from genres_;
 
 
 
 CREATE TABLE IF NOT EXISTS pre_queue( 
 pre_queue_id INT AUTO_INCREMENT PRIMARY KEY,
 film_num INT,
 film_title varchar(254),
 changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 
 );
 
DELIMITER $$
 CREATE TRIGGER trg_after_insert_public_response
 AFTER INSERT ON public_response
 FOR EACH ROW
 BEGIN
   INSERT INTO pre_queue (film_title)
               values (NEW.film);
 END $$
 select * from public_response;
 insert into public_response (film, rotten_tomatoes_score,rotten_tomatoes_counts,metacritic_score,metacritic_counts,cinema_score,imdb_score,imdb_counts)
              values ("car life",90,345,89,30,'A',8.3,34556);
select * from pre_queue;
 
 
 
