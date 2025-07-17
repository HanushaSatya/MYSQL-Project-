-- Create the table
use class;
CREATE TABLE StudentGrades (
    student_id INT,
    student_name VARCHAR(50),
    subject VARCHAR(50),
    score INT
);

-- Insert some sample data
INSERT INTO StudentGrades (student_id, student_name, subject, score) VALUES
(1, 'Alice', 'Math', 85),
(1, 'Alice', 'Science', 92),
(1, 'Alice', 'History', 78),
(2, 'Bob',   'Math', 90),
(2, 'Bob',   'Science', 88),
(2, 'Bob',   'History', 95),
(3, 'Charlie', 'Math', 85),
(3, 'Charlie', 'Science', 70),
(3, 'Charlie', 'History', 81);

select * from StudentGrades;

select 
   student_name,
   subject,
   score,
   avg(score) over() as overall_avg_score
from StudentGrades;

select 
   student_name,
   subject,
   score,
   Rank() over (partition by subject order by score Desc) as subject_rank
from StudentGrades;

select 
   student_name,
   subject,
   score,
   avg(score) over (partition by student_name) as stu_avg_score
from StudentGrades;

select 
   student_name,
   subject,
   score,
   sum(score) over (partition by student_name order by subject) as running_total_score
from StudentGrades;

select 
   student_name,
   subject,
   score,
   lag(score, 1, 0) over () as previous_subject_score
from StudentGrades;

select 
   student_name,
   subject,
   score,
   lead(score, 2, 0) over () as previous_subject_score
from StudentGrades;