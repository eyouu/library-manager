<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Readers</title>
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
                            <a class="nav-link" href="${pageContext.request.contextPath}/reader/addReaderForm">Add Reader</a>
                        </li>
                        <security:authorize access="hasRole('ADMIN')">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/librarian/list">Librarians</a>
                        </li>
                        </security:authorize>
                        <li class="nav-item">
                            <a class="nav-link active" href="${pageContext.request.contextPath}/reader/list">Readers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/rent/list">Rent Info</a>
                        </li>
                    </ul>
                    <form:form cssClass="form-inline my-2 my-lg-0 m-auto" action="searchByName" method="get">
                        <div class="input-group">
                            <input class="form-control mr-sm-2" placeholder="Find Reader" type="search" name="searchName" />
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                        </div>
                    </form:form>
                    <div style="color: white; margin-left: 400px"><security:authentication property="principal.username" /></div>
                    <form:form cssClass="ml-2" action="${pageContext.request.contextPath}/logout" method="post">
                        <input class="btn btn-danger ml-2" type="submit" value="Logout" />
                    </form:form>
                </div>
            </nav>
            <br>
            <br>
            <br>


            <h2>Readers</h2>
            <hr>
            <br>
            <table class="table table-hover table-bordered text-center" >
                <thead class="thead-dark">
                    <tr>
                        <th>Id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Rating</th>
                        <th>Phone</th>
                        <th >Email</th>
                        <th>Date of Birth</th>
                        <th>Gender</th>
                        <th>Registration Date</th>
                        <th style="width: 15%">Action</th>
                    </tr>
                </thead>

                <tbody>
                        <c:forEach var="tempReader" items="${readers}">

                            <c:url var="updateLing" value="/reader/updateReader">
                                <c:param name="readerId" value="${tempReader.id}" />
                            </c:url>

                            <c:url var="deleteLink" value="/reader/deleteReader" >
                                <c:param name="readerId" value="${tempReader.id}" />
                            </c:url>


                            <tr>
                                <td>${tempReader.id}</td>
                                <td>${tempReader.firstName}</td>
                                <td>${tempReader.lastName}</td>
                                <td>${tempReader.rating}</td>
                                <td>${tempReader.phone}</td>
                                <td>${tempReader.email}</td>
                                <td>${tempReader.dateOfBirth}</td>
                                <td>${tempReader.gender}</td>
                                <td>${tempReader.registrationDate}</td>
                                <td>
                                    <a class="btn  btn-success btn-sm" href="${updateLing}">Update</a>
                                    <a class="btn btn-danger btn-sm" href="${deleteLink}"
                                       onclick="if (!(confirm('Are you sure you want to delete this Reader?'))) return false"
                                    >Delete</a>
                                </td>
                            </tr>

                        </c:forEach>
                </tbody>
            </table>

            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/">Back</a>
    </div>
</body>
</html>
