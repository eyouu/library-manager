<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
    <title>Librarian Save Form</title>
</head>

<body>
    <div>
        <form:form action="/librarian/saveLibrarian" modelAttribute="librarian" method="post">
            <table>
                <tbody>
                    <tr>
                        <td>First Name:</td>
                        <td><form:input path="firstName" /></td>
                    </tr>

                    <tr>
                        <td>Last name:</td>
                        <td><form:input path="lastName" /></td>
                    </tr>

                    <tr>
                        <td>Email:</td>
                        <td><form:input path="librarianDetail.email"/></td>
                    </tr>

                    <tr>
                        <td>Address:</td>
                        <td><form:input path="librarianDetail.address"/></td>
                    </tr>

                    <tr>
                        <td>Date of Birth:</td>
                        <td><form:input path="librarianDetail.dateOfBirth"/></td>
                    </tr>

                    <tr>
                        <td>Phone:</td>
                        <td><form:input path="librarianDetail.phone" /></td>
                    </tr>

                    <tr>
                        <td>Gender:</td>
                        <td><form:input path="librarianDetail.gender" /></td>
                    </tr>
                </tbody>
            </table>

                <input type="submit" value="Save" />
        </form:form>
    </div>
</body>
</html>