<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/books-stack-of-three.png" type="image/icon type">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/books-stack-of-three.png" type="image/icon type">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <div class="container h-150">
        <div class= "row h-150 justify-content-center align-items-center">
            <div class="col-4">
            <h1 style="text-align: center; margin-top: 100px">Login</h1>
            <img  src="${pageContext.request.contextPath}/resources/img/study.png" class="rounded mx-auto d-block mb-2" alt="img" >

            <form:form action="${pageContext.request.contextPath}/authenticate" method="post">

                <c:if test="${param.error != null}">
                    <div class="alert alert-danger m-2" role="alert">
                        <b>Wrong username or password!</b>
                    </div>
                </c:if>

                <c:if test="${param.logout != null}">
                    <div class="alert alert-secondary m-2" role="alert">
                        <b>Logged out!</b>
                    </div>
                </c:if>

                <div class="form-group">
                    <input type="text" class="form-control" id="username" placeholder="Username" name="username">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="password" placeholder="Password" name="password">
                </div>
                <div class="text-center">
                <button type="submit" class="btn btn-dark col-4">Login</button>
                </div>
            </form:form>

            </div>
        </div>
    </div>
</body>
</html>