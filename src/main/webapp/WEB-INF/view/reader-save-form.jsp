<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Reader Save Form</title>
</head>

<body>
    <div class="container">

        <div class="navbar-expand{-sm|-md|-lg|-xl}">
            <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/book/list">Books</a>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="${pageContext.request.contextPath}/librarian/addLibrarianForm">Add Reader</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/librarian/list">Librarians</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="${pageContext.request.contextPath}/reader/list">Readers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/rent/list">Rent Info</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <br>
            <br>
            <br>
        </div>

        <form:form action="/reader/saveReader"  modelAttribute="reader" method="post">
            <form:hidden path="id" />

                <h2>Save New Reader</h2>
                <hr>

                <div class="form-group">
                    <label>First Name</label>
                    <form:input cssClass="form-control mb-4 col-4" placeholder="First Name" path="firstName"/>
                </div>

                <div class="form-group">
                    <label>Last Name</label>
                    <form:input cssClass="form-control mb-4 col-4" placeholder="Last Name" path="lastName"/>
                </div>

                <div class="form-group">
                    <label>Rating</label>
                    <form:select cssClass="form-control mb-4 col-4" path="rating" >
                        <form:option value="1" >1</form:option>
                        <form:option value="2">2</form:option>
                        <form:option value="3">3</form:option>
                        <form:option value="4">4</form:option>
                        <form:option value="5">5</form:option>
                        <form:option value="6">6</form:option>
                        <form:option value="7">7</form:option>
                        <form:option value="8">8</form:option>
                        <form:option value="9">9</form:option>
                        <form:option selected="10" value="10">10</form:option>
                    </form:select>
                </div>

                <div class="form-group">
                    <label>Phone</label>
                    <form:input cssClass="form-control mb-4 col-4" placeholder="+38-(000)-00-00-000" path="phone"/>
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <form:input cssClass="form-control mb-4 col-4" placeholder="Email" path="email"/>
                </div>

                <div class="form-group">
                    <label>Date Of Birth</label>
                    <form:input cssClass="form-control mb-4 col-4" placeholder="dd-mm-yyyy" path="dateOfBirth"/>
                </div>
                <div class="form-group">
                    <label>Gender</label>
                    <form:select cssClass="form-control mb-4 col-4" path="gender" >
                        <form:option value="Male" >Male</form:option>
                        <form:option value="Female">Female</form:option>
                        <form:option selected="Other" value="Other">Other</form:option>
                    </form:select>
                </div>

                <div class="form-group">
                    <label>Registration Date</label>
                    <form:input cssClass="form-control mb-4 col-4" placeholder="dd-mm-yyyy" path="registrationDate" />
                </div>

                <div>
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/reader/list">Back</a>
                    <input class="btn btn-primary col-2" type="submit" value="Save" />
                </div>

        </form:form>

    </div>
</body>
</html>