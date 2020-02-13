# Library Manager
Library manager program written in Java with with the following frameworks, libraries, technologies:

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


# To test the code
1. Run **library-manager schema tables and data.sql** from sql-scripts folder to create schema, tables and populate tables with data.
2. Set up your own database connection (file -> library-manager/src/main/resources/**persistence-mysql.properties**) properties instead of underlined lines. ![](https://i.imgur.com/YaSeCvi.png)
3. Set up folder where to save program logs (not necessary) (file -> library-manager/src/main/resources/**log4j.properties**) ![](https://i.imgur.com/r2CFUoH.png)

# Registered users by default

**Admin Rights** (sees all the content, can register new users):  
User: admin  
Password: admin  

**Librarian Rights**:  
User: testlibrarian  
Password: testlibrarian  
  
User: keanu  
Password: keanu  

