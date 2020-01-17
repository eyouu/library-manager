<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <title>Rent Save Form</title>
</head>

<body>
<div>
    <form:form action="/rent/saveRent"  modelAttribute="rentInfo" method="post">
        <form:hidden path="rentId" />

        <table>
            <tbody>
            <tr>
                <td>Status:</td>
                <td>
                    <form:select path="status" >
                    <form:option value="IN RENT" label="IN RENT"  />
                    <form:option value="RETURNED" label="RETURNED"  />
                    </form:select>
                </td>
            </tr>

            <tr>
                <td>Librarian id:</td>
                <td><form:input path="librarian.id" /></td>
            </tr>

            <tr>
                <td>Reader id:</td>
                <td><form:input path="reader.id"/></td>
            </tr>

            <tr>
                <td>Book id:</td>
                <td><form:input path="book.id" /></td>
            </tr>

            </tbody>
        </table>

        <input type="submit" value="Save" />
    </form:form>
    <br>
    <a href="${pageContext.request.contextPath}/rent/list">Back</a>

</div>
</body>

</html>