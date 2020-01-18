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
        <a class="btn btn-primary mb-3"  href="addRentForm">Add new Rent</a>

        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Rent ID</th>
                    <th>Status</th>
                    <th>Librarian ID</th>
                    <th>Reader ID</th>
                    <th>Book ID</th>
                    <th>Date of Rent</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="tempRents" items="${rents}">
                <tr>
                    <td>${tempRents.rentId}</td>
                    <td>${tempRents.status}</td>
                    <td>${tempRents.librarian.id}</td>
                    <td>${tempRents.reader.id}</td>
                    <td>${tempRents.book.id}</td>
                    <td>${tempRents.dateOfRent}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>

        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/">Back</a>
    </div>
</body>

</html>