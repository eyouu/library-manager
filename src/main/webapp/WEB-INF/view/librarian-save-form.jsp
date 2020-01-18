<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Librarian Save Form</title>
</head>

<body>
    <div class="container">
        <form:form action="/librarian/saveLibrarian" modelAttribute="librarian" method="post">
            <form:hidden path="id" />

                <h2>Save New Librarian</h2>
                <hr>

                <div class="form-group">
                    <label>First Name</label>
                    <form:input cssClass="form-control mb-4 col-4" path="firstName"/>
                </div>

                <div class="form-group">
                    <label>Last name</label>
                    <form:input cssClass="form-control mb-4 col-4" path="lastName" />
                </div>

                <div class="form-group">
                    <label>Phone</label>
                    <form:input cssClass="form-control mb-4 col-4" path="phone"/>
                </div>


                <div class="form-group">
                    <label>Address</label>
                    <form:input cssClass="form-control mb-4 col-4" path="address" />
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <form:input cssClass="form-control mb-4 col-4" path="email" />
                </div>

                <div class="form-group">
                    <label>Date of Birth</label>
                    <form:input cssClass="form-control mb-4 col-4" path="dateOfBirth"/>
                </div>

                <div class="form-group">
                    <label>Gender</label>
                    <form:input cssClass="form-control mb-4 col-4" path="gender" />
                </div>


                <div>
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/librarian/list">Back</a>
                    <input class="btn btn-primary col-2" type="submit" value="Save" />
                </div>

        </form:form>
    </div>
</body>
</html>