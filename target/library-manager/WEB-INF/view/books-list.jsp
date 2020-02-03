<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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
                <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/book/list">
                        <img src="${pageContext.request.contextPath}/resources/img/book.png" class="d-inline-block align-top" alt="">
                        Books</a>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/book/addBookForm">Add Book</a>
                            </li>
                            <security:authorize access="hasRole('ADMIN')">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/librarian/list">Librarians</a>
                            </li>
                            </security:authorize>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/reader/list">Readers</a>
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
                        <form:form cssClass="form-inline my-2 my-lg-0 m-auto" action="searchBook" method="get">
                            <div class="input-group">
                                <input class="form-control mr-sm-2" placeholder="Find Book" type="search" name="searchBook" />
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                            </div>
                        </form:form>
                        <div style="color: white; margin-left: 400px;"><security:authentication property="principal.username" /></div>
                        <form:form cssClass="ml-2" action="${pageContext.request.contextPath}/logout" method="post">
                            <input class="btn btn-danger ml-2" type="submit" value="Logout" />
                        </form:form>
                    </div>
                </nav>
                <br>
                <br>
                <br>

            <h2>Books</h2>
            <hr>
                <table  class="table table-hover table-bordered text-center">
                    <thead class="thead-dark">
                        <tr>
                            <th style="width: 2%">Id</th>
                            <th style="width: 16%">Author</th>
                            <th>Title</th>
                            <th>Genre</th>
                            <th style="width: 14%">Country</th>
                            <th style="width: 10%">Publication Date</th>
                            <th style="width: 6%">Quantity</th>
                            <th style="width: 22%">Action</th>
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
                            <c:choose>
                                <c:when test="${tempBook.quantity == 0}">
                                    <td style="color: red">${tempBook.quantity}</td>
                                </c:when>
                                <c:otherwise>
                                    <td>${tempBook.quantity}</td>
                                </c:otherwise>
                            </c:choose>
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
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>