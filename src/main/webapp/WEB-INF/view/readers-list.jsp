<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Readers</title>
</head>
<body>


    <div class="container">
            <h2>Our Readers</h2>
            <br>
            <hr>
            <a class="btn btn-primary mb-3" href="addReaderForm">Add Reader</a>


            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Rating</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Date of Birth</th>
                        <th>Gender</th>
                        <th>Registration Date</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                        <c:forEach var="tempReader" items="${readers}">

                            <c:url var="updateLing" value="/reader/updateReader">
                                <c:param name="readerId" value="${tempReader.id}" />
                            </c:url>

                            <c:url var="deleteLink" value="/reader/deleteReader" >
                                <c:param name="readerId" value="${tempReader.id}" />
                            </c:url>


                            <tr>
                                <td>${tempReader.id}</td>
                                <td>${tempReader.firstName}</td>
                                <td>${tempReader.lastName}</td>
                                <td>${tempReader.rating}</td>
                                <td>${tempReader.phone}</td>
                                <td>${tempReader.email}</td>
                                <td>${tempReader.dateOfBirth}</td>
                                <td>${tempReader.gender}</td>
                                <td>${tempReader.registrationDate}</td>
                                <td>
                                    <a class="btn  btn-outline-success btn-sm" href="${updateLing}">Update</a>
                                    <a class="btn btn-outline-danger btn-sm" href="${deleteLink}"
                                       onclick="if (!(confirm('Are you sure you want to delete this Reader?'))) return false"
                                    >Delete</a>
                                </td>
                            </tr>

                        </c:forEach>
                </tbody>
            </table>

            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/">Back</a>
    </div>
</body>
</html>
