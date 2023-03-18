CREATE TABLE  IF NOT EXISTS  users (
    id INT PRIMARY KEY auto_increment,
    phone VARCHAR(20),
    name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20),
    status ENUM('active', 'inactive', 'blocked') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- create course DATABASE
CREATE TABLE IF NOT EXISTS courses(
    id INT PRIMARY KEY auto_increment,
    name VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    description VARCHAR(255) NOT NULL,
    status ENUM('active', 'inactive', 'blocked') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- create lesson DATABASE
CREATE TABLE IF NOT EXISTS lessons(
    id INT PRIMARY KEY auto_increment,
    name VARCHAR(255) NOT NULL,
    course_id INT NOT NULL,
    video VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    status ENUM('active', 'inactive', 'blocked') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

-- create enrollment DATABASE
CREATE TABLE IF NOT EXISTS enrollment(
    id INT PRIMARY KEY auto_increment,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    status ENUM('active', 'inactive', 'blocked') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

-- create quiz DATABASE

CREATE TABLE IF NOT EXISTS quiz(
    id INT PRIMARY KEY auto_increment,
    lesson_id INT NOT NULL,
    question VARCHAR(255) NOT NULL,
    answer VARCHAR(255) NOT NULL,
    status ENUM('active', 'inactive', 'blocked') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (lesson_id) REFERENCES lessons(id) ON DELETE CASCADE
);
