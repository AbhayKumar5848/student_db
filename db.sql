-- Create the database
CREATE DATABASE IF NOT EXISTS report_card;
USE report_card;

-- Table: student
CREATE TABLE student (
    admno INT AUTO_INCREMENT PRIMARY KEY, -- Admission number (auto-generated)
    name VARCHAR(100) NOT NULL,           -- Student name
    fname VARCHAR(100) NOT NULL,          -- Father's name
    class VARCHAR(20) NOT NULL,           -- Class (e.g., 10, 12)
    section CHAR(1) NOT NULL,              -- Section (e.g., A, B)
    status ENUM('active','inactive') DEFAULT 'active'
);

-- Table: marks
CREATE TABLE marks (
    id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique row ID
    admno INT NOT NULL,                   -- Foreign key to student table
    term VARCHAR(50) NOT NULL,             -- Term name (e.g., Term 1, Term 2)
    session VARCHAR(20) NOT NULL,          -- Academic session (e.g., 2020-21)
    phy INT CHECK (phy BETWEEN 0 AND 100), -- Physics marks
    chem INT CHECK (chem BETWEEN 0 AND 100), -- Chemistry marks
    math INT CHECK (math BETWEEN 0 AND 100), -- Mathematics marks
    eng INT CHECK (eng BETWEEN 0 AND 100),   -- English marks
    comp INT CHECK (comp BETWEEN 0 AND 100), -- Computer marks
    FOREIGN KEY (admno) REFERENCES student(admno) ON DELETE CASCADE
);

-- Optional: Insert some sample data
INSERT INTO student (name, fname, class, section, status)
VALUES 
('Rahul Sharma', 'Amit Sharma', '10', 'A', 'active'),
('Priya Das', 'Suresh Das', '10', 'A', 'active');

INSERT INTO marks (admno, term, session, phy, chem, math, eng, comp)
VALUES
(1, 'Term 1', '2020-21', 85, 78, 92, 88, 90),
(2, 'Term 1', '2020-21', 80, 82, 85, 87, 89);
