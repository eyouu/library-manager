<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Rent Save Form</title>
</head>

<body>
<div class="container">
    <form:form action="/rent/saveRent"  modelAttribute="rentInfo" method="post">
        <form:hidden path="rentId" />

                <h2>Save New Rent</h2>
                <hr>

                <div class="form-group">
                    <label>Status</label>
                    <form:select id="brow" cssClass="form-control mb-4 col-4" path="status" >
                        <form:option value="NONE">SELECT</form:option>
                        <form:option value="IN RENT" label="IN RENT"  />
                        <form:option value="RETURNED" label="RETURNED"  />
                    </form:select>
                </div>

                <div class="form-group">
                    <label>Librarian ID</label>
                    <form:select cssClass="form-control mb-4 col-4"  path="librarian.id">
                            <form:option value="NONE">SELECT</form:option>
                        <c:forEach var="temp" items="${librarians}">
                            <form:option value="${temp.id}" />
                        </c:forEach>
                    </form:select>
                </div>

                <div class="form-group">
                    <label>Reader id:</label>
                    <form:input cssClass="form-control mb-4 col-4" path="reader.id"/>
                </div>

                <div class="form-group">
                    <label>Book id</label>
                    <form:input cssClass="form-control mb-4 col-4" path="book.id" />
                </div>

                <div>
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/rent/list">Back</a>
                    <input class="btn btn-primary col-2" type="submit" value="Save" />
                </div>
    </form:form>

</div>

</body>

</html>