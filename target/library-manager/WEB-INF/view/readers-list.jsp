<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Readers</title>

</head>
<body>
    <h2>Our Readers</h2>
    <br>
    <hr>
    <a href="addReaderForm">Add Reader</a>
    <hr>
    <br>
    <table border="1">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Rating</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Date of Birth</th>
            <th>Gender</th>
            <th>Registration Date</th>
            <th>Action</th>
        </tr>

    <c:forEach var="tempReader" items="${readers}">

        <c:url var="updateLing" value="/reader/updateReader">
            <c:param name="readerId" value="${tempReader.id}" />
        </c:url>

        <tr>
            <td>${tempReader.firstName}</td>
            <td>${tempReader.lastName}</td>
            <td>${tempReader.rating}</td>
            <td>${tempReader.phone}</td>
            <td>${tempReader.email}</td>
            <td>${tempReader.dateOfBirth}</td>
            <td>${tempReader.gender}</td>
            <td>${tempReader.registrationDate}</td>
            <td>
                <a href="${updateLing}">Update</a>
                |
                <a href="#">Delete</a>
            </td>
        </tr>

    </c:forEach>
    </table>
    <script type="text/javascript" src="/resources/js/encoder-decoder.js"></script>
</body>
</html>
