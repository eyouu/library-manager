<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <h2>Rent List</h2>
        <br>
        <hr>

        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Rent ID</th>
                    <th>Status</th>
                    <th>Reader ID</th>
                    <th>Book ID</th>
                    <th>Date of Rent</th>
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
                    <td>${tempRents.status}</td>
                    <td>${tempRents.reader.id}</td>
                    <td>${tempRents.book.id}</td>
                    <td>${tempRents.dateOfRent}</td>
                    <td>
                        <a  class="btn btn-warning btn-sm" href="${changeStatusLink}"
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