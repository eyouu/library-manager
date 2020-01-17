<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Rents</title>
</head>

<body>
    <a href="addRentForm">Add new Rent</a>
    <hr>

    <table border="1">
        <tr>
            <th>Rent ID</th>
            <th>Status</th>
            <th>Librarian ID</th>
            <th>Reader ID</th>
            <th>Book ID</th>
            <th>Date of Rent</th>
        </tr>

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
    </table>

    <a href="${pageContext.request.contextPath}/">Back</a>
</body>

</html>