<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/resources/css/styles.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Reader Save Form</title>
</head>

<body>
    <div class="container">

            <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/book/list">
                    <img src="${pageContext.request.contextPath}/resources/img/book.png" class="d-inline-block align-top" alt="">
                    Books</a>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="${pageContext.request.contextPath}/librarian/addLibrarianForm">Add Reader</a>
                        </li>
                        <security:authorize access="hasRole('ADMIN')">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/librarian/list">Librarians</a>
                        </li>
                        </security:authorize>
                        <li class="nav-item">
                            <a class="nav-link " href="${pageContext.request.contextPath}/reader/list">Readers</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/rent/list" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Rent Info
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/rent/list">Rent Info</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/rent/showBooksInRent">Books In Rent</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/rent/showReturnedBooks">Returned Books</a>
                            </div>
                        </li>
                    </ul>
                    <div style="color: white; margin-left: 400px"><security:authentication property="principal.username" /></div>
                    <form:form cssClass="ml-2" action="${pageContext.request.contextPath}/logout" method="post">
                        <input class="btn btn-danger ml-2" type="submit" value="Logout" />
                    </form:form>
                </div>
            </nav>
            <br>
            <br>
            <br>

        <form:form action="/reader/saveReader"  modelAttribute="reader" method="post">
            <form:hidden path="id" />

                <h2>Save New Reader</h2>
                <hr>

                    <label>First Name</label>
                <div class="form-inline">
                    <form:input cssClass="form-control mb-4 col-4 mr-2" placeholder="First Name" path="firstName"/>
                    <form:errors cssClass="error" path="firstName" />
                </div>

                    <label>Last Name</label>
                <div class="form-inline">
                    <form:input cssClass="form-control mb-4 col-4 mr-2" placeholder="Last Name" path="lastName"/>
                    <form:errors cssClass="error" path="lastName" />
                </div>

                    <label>Phone</label>
                <div class="form-inline">
                    <form:input cssClass="form-control mb-4 col-4 mr-2" placeholder="000-000-0000" path="phone"/>
                    <form:errors cssClass="error" path="phone" />
                </div>

                    <label>Email</label>
                <div class="form-inline">
                    <form:input cssClass="form-control mb-4 col-4 mr-2" placeholder="Email" path="email"/>
                    <form:errors cssClass="error" path="email" />
                </div>

                    <label>Date Of Birth</label>
                <div class="form-inline">
                    <form:input cssClass="form-control mb-4 col-4 mr-2" placeholder="yyyy-mm-dd" path="dateOfBirth"/>
                    <form:errors cssClass="error" path="dateOfBirth" />
                </div>
                <div class="form-group">
                    <label>Gender</label>
                    <form:select cssClass="form-control mb-4 col-4" path="gender" >
                        <form:option value="Male" >Male</form:option>
                        <form:option value="Female">Female</form:option>
                        <form:option value="Other">Other</form:option>
                    </form:select>
                </div>

                    <label>Registration Date</label>
                <div class="form-inline">
                    <form:input cssClass="form-control mb-4 col-4 mr-2" placeholder="dd-mm-yyyy" path="registrationDate" />
                    <form:errors cssClass="error" path="registrationDate" />
                </div>

                <div>
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/reader/list">Back</a>
                    <input class="btn btn-primary col-2" type="submit" value="Save" />
                </div>

        </form:form>

    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>