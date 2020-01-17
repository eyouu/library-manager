<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
</head>

<body>
    <div>
        <form:form action="/book/saveBook" modelAttribute="book" method="post">
            <form:hidden path="id" />
        <table>

            <tbody>
                <tr>
                    <td><label>Author:</label></td>
                    <td><form:input path="author" /></td>
                </tr>
                <tr>
                    <td><label>Title:</label></td>
                    <td><form:input path="title" /></td>
                </tr>
                <tr>
                    <td><label>Genre:</label></td>
                    <td><form:input path="genre" /></td>
                </tr>
                <tr>
                    <td><label>Country:</label></td>
                    <td><form:input path="country" /></td>
                </tr>
                <tr>
                    <td><label>Publication Date:</label></td>
                    <td><form:input path="publicationDate" /></td>
                </tr>
                <tr>
                    <td><label>Quantity:</label></td>
                    <td><form:input path="quantity" /></td>
                </tr>

            </tbody>
           
        </table>
            <input type="submit" value="Save" />
        </form:form>
    </div>
</body>

</html>