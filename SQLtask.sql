CREATE TABLE academy (
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT
);

CREATE TABLE program (
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT,
    delivery_type TEXT,
    category TEXT,
    prerequisites TEXT,
    purpose TEXT,
    technologies TEXT
);

CREATE TABLE topic (
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT
);

CREATE TABLE program_topic (
    program_id INT,
    topic_id INT,
    PRIMARY KEY (program_id, topic_id),
    FOREIGN KEY (program_id) REFERENCES program(id),
    FOREIGN KEY (topic_id) REFERENCES topic(id)
);

CREATE TABLE education_group (
    id SERIAL PRIMARY KEY,
    name TEXT,
    status TEXT,
    start_date DATE,
    expected_end_date DATE,
    actual_end_date DATE,
    education_program TEXT
);

CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    father_name TEXT,
    about TEXT,
    education_type TEXT,
    email TEXT UNIQUE
);

CREATE TABLE student_group (
    student_id INT,
    group_id INT,
    PRIMARY KEY (student_id, group_id),
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (group_id) REFERENCES education_group(id)
);

CREATE TABLE contact_info (
    student_id INT,
    birth_date DATE,
    fin_code TEXT UNIQUE,
    id_card_series TEXT,
    group_id INT,
    join_date DATE,
    PRIMARY KEY (student_id),
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (group_id) REFERENCES education_group(id)
);

CREATE TABLE mentor (
    id SERIAL PRIMARY KEY,
    student_id INT,
    salary INT,
    phone_number TEXT,
    address TEXT,
    group_id INT,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (group_id) REFERENCES education_group(id)
);

SELECT * FROM student

INSERT INTO student (first_name,last_name,father_name,about,education_type,email)
VALUES 
('Ali','Salmanov','Vidadi','Student','Bachelor','lisalmanov84@gmailcom')

INSERT INTO topic (name,description) 
VALUES 
('Programing', 'teaches web application programs'),
('Digital Marketing', 'Lorem'),
('Desing', 'Ipsum'),
('cyber security', 'Doler')

SELECT * FROM topic