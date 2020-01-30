<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Error</title>
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/book/addBookForm">Add Book</a>
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
            <div style="color: white; margin-left: 400px;"><security:authentication property="principal.username" /></div>
            <form:form cssClass="ml-2" action="${pageContext.request.contextPath}/logout" method="post">
                <input class="btn btn-danger ml-2" type="submit" value="Logout" />
            </form:form>
        </div>
    </nav>
    <br><br><br>

    <h2 class="error-general">Error. Book quantity is 0</h2>
    <hr>
    <img class="rounded mx-auto d-block mb-2" src="${pageContext.request.contextPath}/resources/img/broken.png" alt="">
</div>
</body>
</html>