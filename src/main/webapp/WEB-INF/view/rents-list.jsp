<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Rents</title>
</head>

<body>

    <div class="container">

            <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/book/list">
                    <img src="${pageContext.request.contextPath}/resources/img/book.png" class="d-inline-block align-top" alt="">
                    Books</a>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <security:authorize access="hasRole('ADMIN')">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/librarian/list">Librarians</a>
                        </li>
                        </security:authorize>
                        <li class="nav-item">
                            <a class="nav-link " href="${pageContext.request.contextPath}/reader/list">Readers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="${pageContext.request.contextPath}/rent/list">Rent Info</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/rent/showBooksInRent">Books In Rent</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/rent/showReturnedBooks">Returned Books</a>
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

        <h2>Rent Info</h2>
        <hr>

        <table class="table table-hover table-bordered text-center">
            <thead class="thead-dark">
                <tr>
                    <th style="width: 13%">
                        <form:form  action="searchByRentId" method="get">
                            <input class="form-control" placeholder="Rent ID" type="text" name="rentId">
                        </form:form>
                    </th>
                    <th  style="width: 20%">Status</th>
                    <th style="width: 13%">
                        <form:form  action="searchByReaderId" method="get">
                            <input class="form-control" placeholder="Reader ID" type="text" name="readerId">
                        </form:form>
                    </th>

                    <th style="width: 13%">
                        <form:form  action="searchByBookId" method="get">
                            <input class="form-control" placeholder="Book ID" type="text" name="bookId">
                        </form:form>
                    </th>
                    <th style="width: 20%">Date of Rent</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="tempRents" items="${rents}">

                    <c:url var="deleteLink" value="/rent/deleteRent" >
                        <c:param name="rentId" value="${tempRents.rentId}"/>
                    </c:url>

                    <c:url var="changeStatusLink" value="/rent/changeStatus" >
                        <c:param name="statusId" value="${tempRents.rentId}" />
                    </c:url>

                <tr>
                        <td>${tempRents.rentId}</td>
                    <c:if test="${tempRents.status.equals('IN RENT')}" >
                        <td style="color:red">${tempRents.status}</td>
                    </c:if>
                    <c:if test="${tempRents.status.equals('RETURNED')}" >
                        <td style="color:black">${tempRents.status}</td>
                    </c:if>
                        <td>${tempRents.reader.id}</td>
                        <td>${tempRents.book.id}</td>
                        <td>${tempRents.dateOfRent}</td>
                        <td>
                            <a  class="btn btn-warning btn-sm" href="${changeStatusLink}"
                                onclick="if (!(confirm('Are you sure you want to change rent status?'))) return false"
                            >Change Status</a>
                            <a class="btn btn-danger btn-sm" href="${deleteLink}"
                               onclick="if (!(confirm('Are you sure you want to delete this rent info?'))) return false"
                            >Delete</a>
                        </td>
                </c:forEach>
                </tr>
            </tbody>
        </table>

        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/">Back</a>
    </div>
</body>

</html>