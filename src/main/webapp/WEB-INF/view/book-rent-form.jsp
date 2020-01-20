<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Rent Book</title>

</head>

<body>
    <div class="container">
        <form:form action="/book/saveBookRent" modelAttribute="rentInfo" method="post">
            <form:hidden path="book.id" />

            <h2>Rent book</h2>
            <hr>

            <div class="form-group">
                <label>Book: ${rentInfo.book.title}</label>
            </div>

            <div class="form-group">
                <label>Reader id:</label>
                <form:input cssClass="form-control mb-4 col-4" path="reader.id"/>
            </div>

            <div>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/book/list">Back</a>
                <input class="btn btn-primary col-2" type="submit" value="Save" />
            </div>

        </form:form>
    </div>
</body>
</html>
