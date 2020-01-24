<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <div class="navbar-expand{-sm|-md|-lg|-xl}">
                <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/book/list">Books</a>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/book/addBookForm">Add Book</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/librarian/list">Librarians</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/reader/list">Readers</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/rent/list">Rent Info</a>
                            </li>
                        </ul>
                        <form:form cssClass="form-inline my-2 my-lg-0" action="searchBook" method="get">
                            <div class="input-group">
                                <input class="form-control mr-sm-2" placeholder="Find Book" type="search" name="searchBook" />
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                            </div>
                        </form:form>
                    </div>
                </nav>
                <br>
                <br>
                <br>
            </div>
            <h2>Books</h2>
            <hr>
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

                            <c:url var="rentLink" value="/book/rentBook">
                                <c:param name="bookId" value="${tempBook.id}"/>
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
                                <a class="btn  btn-warning btn-sm" href="${rentLink}">Rent Book</a>
                                <a class="btn  btn-success btn-sm" href="${updateLink}">Update</a>
                                <a class="btn  btn-danger btn-sm" href="${deleteLink}"
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