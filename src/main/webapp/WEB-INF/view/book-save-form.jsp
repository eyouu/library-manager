<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Book Save Form</title>
</head>

<body>
    <div class="container">
            <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/book/list">
                    <img src="${pageContext.request.contextPath}/resources/img/book.png" class="d-inline-block align-top" alt="">
                    Books</a>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="${pageContext.request.contextPath}/book/addBookForm">Add Book</a>
                        </li>
                        <security:authorize access="hasRole('ADMIN')">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/librarian/list">Librarians</a>
                        </li>
                        </security:authorize>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/reader/list">Readers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/rent/list">Rent Info</a>
                        </li>
                    </ul>
                    <div style="color: white; margin-left: 400px"><security:authentication property="principal.username" /></div>
                    <form:form cssClass="ml-2" action="${pageContext.request.contextPath}/logout" method="post">
                        <input class="btn btn-danger ml-2" type="submit" value="Logout" />
                    </form:form>
                </div>
            </nav>
            <br>
            <br>
            <br>

            <form:form action="/book/saveBook" modelAttribute="book" method="post">
                <form:hidden path="id" />

                <h2>Save New Book</h2>
                <hr>

                    <label>Author</label>
                <div class="form-inline">
                    <form:input  cssClass="form-control mb-4 col-4 mr-2" placeholder="Author" path="author" />
                    <form:errors cssClass="error" path="author"/>
                </div>

                    <label>Title</label></td>
                <div class="form-inline">
                    <form:input  cssClass="form-control mb-4 col-4 mr-2" placeholder="Title" path="title" />
                    <form:errors cssClass="error" path="title"/>
                </div>

                    <label>Genre</label>
                <div class="form-inline">
                    <form:input  cssClass="form-control mb-4 col-4 mr-2" placeholder="Genre" path="genre" />
                    <form:errors cssClass="error" path="genre"/>
                </div class="form-group">

                    <label>Country</label>
                <div class="form-inline">
                    <form:input  cssClass="form-control mb-4 col-4 mr-2" placeholder="Country" path="country" />
                    <form:errors cssClass="error" path="country"/>
                </div class="form-group">

                    <label>Publication Date</label>
                <div class="form-inline">
                    <form:input  cssClass="form-control mb-4 col-4 mr-2" placeholder="dd-mm-yyyy" path="publicationDate" />
                    <form:errors cssClass="error" path="publicationDate"/>
                </div class="form-group">

                    <label>Quantity</label>
                <div class="form-inline">
                    <form:input  cssClass="form-control mb-4 col-4 mr-2" placeholder="Quantity" path="quantity" />
                    <form:errors cssClass="error" path="quantity"/>
                </div>

                <div>
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/book/list">Back</a>
                    <input class="btn btn-primary col-2" type="submit" value="Save" />
                </div>

            </form:form>
    </div>
</body>

</html>