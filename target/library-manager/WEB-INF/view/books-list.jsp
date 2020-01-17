<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Books</title>
    </head>
    <body>
        <h2>Our Books</h2>
        <hr>
        <a href="addBookForm">Add Book</a>

        <table border="1">
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
                    <a href="${updateLink}">Update</a>
                    |
                    <a href="${deleteLink}"
                       onclick="if (!(confirm('Are you sure you want to delete this book?'))) return false"
                    >Delete</a>
                </td>
            </tr>
            </c:forEach>
        </table>
        <br>
        <a href="${pageContext.request.contextPath}/">Back</a>
    </body>
</html>