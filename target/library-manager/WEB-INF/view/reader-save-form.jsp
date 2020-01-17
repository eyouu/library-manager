<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Reader Save Form</title>

</head>

<body>
<div>
    <form:form action="/reader/saveReader"  modelAttribute="reader" method="post">
        <form:hidden path="id" />

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
                <td>Rating:</td>
                <td><form:input path="rating"/></td>
            </tr>

            <tr>
                <td>Phone:</td>
                <td><form:input path="phone" /></td>
            </tr>

            <tr>
                <td>Email:</td>
                <td><form:input path="email" /></td>
            </tr>

            <tr>
                <td>Date of Birth:</td>
                <td><form:input path="dateOfBirth" /></td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td><form:input path="gender" /></td>
            </tr>
            </tbody>
        </table>

        <input type="submit" value="Save" />
    </form:form>
    <br>
    <a href="${pageContext.request.contextPath}/reader/list">Back</a>
</div>
</body>
</html>