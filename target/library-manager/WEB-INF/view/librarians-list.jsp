<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Librarians</title>
</head>
<body>
        <div class="container">

            <div class="navbar-expand{-sm|-md|-lg|-xl}">
                <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/book/list">Books</a>

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
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/rent/list">Rent Info</a>
                            </li>
                        </ul>
                        <form:form cssClass="form-inline my-2 my-lg-0" action="searchLibrarian" method="get">
                            <div class="input-group">
                                <input class="form-control mr-sm-2" placeholder="Find Librarian" type="search" name="librarianName" />
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                            </div>
                        </form:form>
                    </div>
                </nav>
                <br>
                <br>
                <br>
            </div>

            <h2>Librarians</h2>
            <hr>
                <table class="table table-striped table-bordered">
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
                            <th>Action</th>
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
            <br>
            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/">Back</a>
        </div>
</body>
</html>
