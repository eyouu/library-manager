<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Librarians</title>
</head>
<body>
    <div>
        <h2>Librarians</h2>
        <hr>
        <a href="addLibrarianForm">Add Librarian</a>
        <table border="1">
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

            <c:forEach var="tempLibrarian" items="${librarians}" >

                <c:url var="updateLing" value="/librarian/updateLibrarian">
                    <c:param name="librarianId" value="${tempLibrarian.id}" />
                </c:url>

                <c:url var="deleteLing" value="/librarian/deleteLibrarian" >
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
                    <a href="${updateLing}">Update</a> |
                    <a href="${deleteLing}"
                        onclick="if (!(confirm('Are you sure you want to delete this Librarian?'))) return false"
                    >Delete</a>
                </td>
            </tr>
            </c:forEach>
        </table>
        <br>
        <a href="${pageContext.request.contextPath}/">Back</a>
    </div>
</body>
</html>
