<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/books-stack-of-three.png" type="image/icon type">
    <title>Librarians</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <div class="container">

        <!-- Navbar -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/book/list">
                <img src="${pageContext.request.contextPath}/resources/img/book.png" class="d-inline-block align-top" alt="">
                Books
            </a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/librarian/addLibrarianForm">Add Librarian</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/librarian/list">Librarians</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/reader/list">Readers</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/rent/list" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Rent Info
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/rent/list">Rent Info</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/rent/showBooksInRent">Books In Rent</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/rent/showReturnedBooks">Returned Books</a>
                        </div>
                    </li>
                </ul>

                <form:form cssClass="form-inline my-2 my-lg-0 m-auto" action="searchLibrarian" method="get">
                    <div class="input-group">
                        <input class="form-control mr-sm-2" placeholder="Search Librarian" type="search" name="librarianName" />
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </div>
                </form:form>

                <security:authorize access="hasRole('ADMIN')">
                <a style="margin-left: 70px" href="${pageContext.request.contextPath}/register/showRegistrationForm"
                   class="btn btn-outline-primary"
                   role="button" aria-pressed="true">
                   Register New User
                </a>
                </security:authorize>

                <div class="ml-username">
                    <security:authentication property="principal.username" />
                </div>

                <form:form cssClass="ml-2" action="${pageContext.request.contextPath}/logout" method="post">
                    <input class="btn btn-danger ml-2" type="submit" value="Logout" />
                </form:form>
            </div>
        </nav>
        <br><br><br>

        <h2>Librarians</h2>
        <hr>

            <table class="table table-hover table-bordered text-center">
                <thead class="thead-dark">
                    <tr>
                        <th>First name</th>
                        <th>Last name</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>Date of Birth</th>
                        <th>Gender</th>
                        <th>Registration Date</th>
                        <th style="width: 14%">Action</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach var="tempLibrarian" items="${librarians}" >

                        <c:url var="updateLink" value="/librarian/updateLibrarian">
                            <c:param name="librarianId" value="${tempLibrarian.id}" />
                        </c:url>

                        <c:url var="deleteLink" value="/librarian/deleteLibrarian" >
                            <c:param name="librarianId" value="${tempLibrarian.id}" />
                        </c:url>

                    <tr>
                        <td>${tempLibrarian.firstName}</td>
                        <td>${tempLibrarian.lastName}</td>
                        <td>${tempLibrarian.phone}</td>
                        <td>${tempLibrarian.address}</td>
                        <td>${tempLibrarian.email}</td>
                        <td>${tempLibrarian.dateOfBirth}</td>
                        <td>${tempLibrarian.gender}</td>
                        <td>${tempLibrarian.registrationDate}</td>
                        <td>
                            <a class="btn  btn-success btn-sm" href="${updateLink}">Update</a>
                            <a class="btn btn-danger btn-sm" href="${deleteLink}"
                                onclick="if (!(confirm('Are you sure you want to delete this Librarian?'))) return false"
                            >Delete</a>
                        </td>
                    </tr>
                    </c:forEach>

                </tbody>
            </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
