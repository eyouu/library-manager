<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Book Save Form</title>
</head>

<body>
    <div class="container">
            <form:form action="/book/saveBook" modelAttribute="book" method="post">
                <form:hidden path="id" />

                <h2>Save New Book</h2>
                <hr>

                <div class="form-group">
                    <label>Author</label>
                    <form:input  cssClass="form-control mb-4 col-4" path="author" />
                </div>

                <div class="form-group">
                    <label>Title</label></td>
                    <form:input  cssClass="form-control mb-4 col-4" path="title" />
                </div class="form-group">

                <div class="form-group">
                    <label>Genre</label>
                    <form:input  cssClass="form-control mb-4 col-4" path="genre" />
                </div class="form-group">

                <div class="form-group">
                    <label>Country</label>
                    <form:input  cssClass="form-control mb-4 col-4" path="country" />
                </div class="form-group">

                <div class="form-group">
                    <label>Publication Date</label>
                    <form:input  cssClass="form-control mb-4 col-4" path="publicationDate" />
                </div class="form-group">

                <div class="form-group">
                    <label>Quantity</label>
                    <form:input  cssClass="form-control mb-4 col-4" path="quantity" />
                </div>

                <div>
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/book/list">Back</a>
                    <input class="btn btn-primary col-2" type="submit" value="Save" />
                </div>

            </form:form>
    </div>
</body>

</html>