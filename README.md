# Description
The Spring MVC project 'Library-manager' is primarily created for educational purposes. Consider the program used by the staff of a small library. Via this program you can store library books, data about library readers, keep a report on rented books.
The program has two types of users with slightly different capabilities: **Librarian** and **Admin**.  

**Admin** is the main user who has access to all the features of program, such as:  
* The possibility to register a new user
* View library staff list and *add / delete / update* new employees to the system  
* All the possibilities of a **Librarian**

**Librarian** is the user who has such possibilities:
* View book list and *add / delete / update / rent* books. View book's readers for the particular book.
* View reader list and *add / delete / update* readers. View reader's books for the particular reader.
* View rent info and *change rent status / delete* rent. View more information about rent.

# Used frameworks, libraries, technologies

* Java 8
* MySQL
* Spring Web MVC
* Spring ORM
* Spring Security
* Hibernate 
* Javax Servlet
* JSP
* JSTL
* Aspect J
* Log4j
* Bootstrap

# Few screenshots:
<img src="https://i.imgur.com/wzpfWpm.png" />
<img src="https://i.imgur.com/BZjjXDa.png" />
<img src="https://i.imgur.com/WfgyLEt.png" />
<img src="https://i.imgur.com/iwsNjBV.png" />
<img src="https://i.imgur.com/Jl5Ez4B.png" />
<img src="https://i.imgur.com/kVNAW4x.png" />

# Database structure:
<img src="https://i.imgur.com/HJ2be2d.png" />

# Getting Started
1. Run [**library-manager schema tables and data.sql**](https://github.com/eyouu/library-manager/blob/master/sql-scripts/library-manager%20schema%20tables%20and%20data.sql) from sql-scripts folder to create schema, tables and populate tables with data.
2. Set up your own database connection properties [**persistence-mysql.properties**](https://github.com/eyouu/library-manager/blob/master/src/main/resources/persistence-mysql.properties) instead of underlined lines.![](https://i.imgur.com/YaSeCvi.png)
3. Set up folder where to save program logs (not necessary) [**log4j.properties**](https://github.com/eyouu/library-manager/blob/master/src/main/resources/log4j.properties) ![](https://i.imgur.com/r2CFUoH.png)
4. Use one of already registered users below to log in.

# Registered users by default

**Admin Rights**:  
User: **admin**  
Password: **admin**  

**Librarian Rights**:  
User: **testlibrarian**  
Password: **testlibrarian**  
  
User: **keanu**  
Password: **keanu**  

