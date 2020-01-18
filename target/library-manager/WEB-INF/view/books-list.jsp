<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>Books</title>
    </head>
    <body>

        <div class="container">
            <h2>Books</h2>
            <br>
            <hr>
            <a class="btn btn-primary mb-3" href="addBookForm">Add Book</a>

            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Id</th>
                        <th>Author</th>
                        <th>Title</th>
                        <th>Genre</th>
                        <th>Country</th>
                        <th>Publication Date</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="tempBook" items="${books}" >

                        <c:url var="updateLink" value="/book/updateBook">
                            <c:param name="bookId" value="${tempBook.id}" />
                        </c:url>

                        <c:url var="deleteLink" value="/book/deleteBook">
                            <c:param name="bookId" value="${tempBook.id}" />
                        </c:url>

                    <tr>
                        <td>${tempBook.id}</td>
                        <td>${tempBook.author}</td>
                        <td>${tempBook.title}</td>
                        <td>${tempBook.genre}</td>
                        <td>${tempBook.country}</td>
                        <td>${tempBook.publicationDate}</td>
                        <td>${tempBook.quantity}</td>
                        <td>
                            <a class="btn  btn-outline-success btn-sm" href="${updateLink}">Update</a>

                            <a class="btn  btn-outline-danger btn-sm" href="${deleteLink}"
                               onclick="if (!(confirm('Are you sure you want to delete this book?'))) return false"
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