CREATE DATABASE `lab4`;

CREATE TABLE `lab4`.`department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) NOT NULL,
   PRIMARY KEY (`department_id`)
);

CREATE TABLE `lab4`.`professor` (
  `professor_id` int(11) NOT NULL AUTO_INCREMENT,
  `professor_name` varchar(255) NOT NULL,
   PRIMARY KEY (`professor_id`)
);

CREATE TABLE `lab4`.`course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL,
  `course_description` varchar(255) NOT NULL,
  `department_id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL,
   PRIMARY KEY (`course_id`),
   FOREIGN KEY (`department_id`) REFERENCES `department`(`department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY (`professor_id`) REFERENCES `professor`(`professor_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `lab4`.`department` (`department_name`) VALUES
('Computer and Communication'),
('Electromechanics Engineering'),
('Construction Engineering'),
('Building Engineering'),
('Business'),
('Medicine'),
('Fine Arts'),
('Offshore'),
('Petrochemicals Engineering'),
('Archchitecture Engineering'),
('Chemical Engineering'),
('Aerospace Engineering'),
('Industrial Engineering'),
('Materials Engineering'),
('Nuclear Engineering'),
('Agricultural Engineering'),
('Mining and Geological Engineering'),
('Computer Hardware Engineering'),
('Petroleum Engineering');

INSERT INTO `lab4`.`professor` (`professor_name`) VALUES
('Dr Mohamed Ahmed'),
('Dr Ahmed Said'),
('Dr Hisham Khaled'),
('Dr Magdy Sameh'),
('Dr Mohamed Abuzeid'),
('Dr Hossam Samy'),
('Dr Noha Hisham'),
('Dr Layla Fawzy'),
('Dr Ayman Khaled'),
('Dr Mervat Sabry'),
('Dr Gaber Wahba'),
('Dr Refaat Ahmed');

INSERT INTO `lab4`.`course` (`course_name`, `course_description`, `department_id`, `professor_id`) VALUES
('Database', 'Introduction to database', 1, 7),
('Discrete Mathematical Structures','Discrete mathematics is the study of mathematical structures that are fundamentally discrete rather than continuous',1,2),
('Algorithms', 'Introduction to algorithms', 2, 3),
('Microprocessors', 'Introduction to microprocessors', 4, 5),
('Rock Mechanics',' course are for the students to develop an understanding of the engineering properties of rocks',15,10),
('Maths', 'Introduction to maths', 1, 5),
('Operating Systems', 'Introduction to OS', 4, 3),
('Numericals', 'Introduction to numericals', 10, 1),
('English', 'Introduction to english', 4, 4),
('Systems Analysis in Agriculture.','An understanding of the economic framework that underpins agricultural industries',14,9),
('Human Rights', 'Introduction to human rights', 5, 6),
('Matlab', 'Introduction to MATLAB', 6, 4),
('HTML', 'Introduction to HTML', 3, 5),
('Thermodynamics','Develops understanding of mass, energy, heat, work, efficiency, ideal and real thermodynamic cycles and processes',8,6),
('CSS', 'Introduction to CSS', 1, 1),
('Arabic', 'Introduction to Arabic', 2, 7),
('AI', 'AI refers to the simulation of human intelligence in machines that are programmed to think like humans and mimic their actions', 8, 7),
('Computer Architecture', 'Introduction to computer architecture', 5, 5),
('Rock Mechanics',' course are for the students to develop an understanding of the engineering properties of rocks',15,11),
('Logic 1', 'Introduction to logic 1', 1, 7),
('Logic 2', 'Introduction to logic 2', 4, 6),
('Data Structures 1', 'Introduction to data structures 1', 2, 1),
('Oil & Gas Industry','course looks at the two most fundamental aspects of the oil and gas industry, its operations and markets',17,10),
('Data Structurs 2', 'Introduction to data structures 2', 9, 1),
('Math 2', 'Solving Equations', 8, 5),
('Maths 3', 'Solving Equations', 3, 5),
('Maths 4', 'Solving Equations', 10, 4),
('Mathematics','Solving Equations',1,2),
('Petroleum engineering','A field of engineering concerned with the activities related to the production of Hydrocarbonss',17,6);