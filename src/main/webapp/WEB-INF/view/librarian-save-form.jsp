<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Librarian Save Form</title>
</head>

<body>
    <div>
        <form:form action="/librarian/saveLibrarian" modelAttribute="librarian" method="post">


            <table>
                <tbody>
                    <tr>
                        <td>First Name:</td>
                        <td><form:input path="firstName"/></td>
                    </tr>

                    <tr>
                        <td>Last name:</td>
                        <td><form:input path="lastName" /></td>
                    </tr>

                    <tr>
                        <td>Phone:</td>
                        <td><form:input path="phone"/></td>
                    </tr>

                    <tr>
                        <td>Address:</td>
                        <td><form:input path="address" /></td>
                    </tr>

                    <tr>
                        <td>Email:</td>
                        <td><form:input path="email" /></td>
                    </tr>
                    <tr>
                        <td>Date of Birth:</td>
                        <td><form:input path="dateOfBirth"/></td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td><form:input path="gender" /></td>
                    </tr>
                </tbody>
            </table>

                <input type="submit" value="Save" />
        </form:form>
    </div>
    <br>
    <a href="${pageContext.request.contextPath}/librarian/list">Back</a>
</body>
</html>