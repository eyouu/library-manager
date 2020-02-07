CREATE USER 'librarydb'@'localhost' IDENTIFIED BY 'librarydb';

GRANT ALL PRIVILEGES ON * . * TO 'librarydb'@'localhost';

ALTER USER 'librarydb'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345678';