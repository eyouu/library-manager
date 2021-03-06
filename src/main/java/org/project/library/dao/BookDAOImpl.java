package org.project.library.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.project.library.entity.Book;
import org.project.library.entity.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDAOImpl implements BookDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Book> getBooks() {
        Session session = sessionFactory.getCurrentSession();

        Query<Book> query = session.createQuery("from Book", Book.class);
        List<Book> books = query.getResultList();

        return books;
    }

    @Override
    public Book getBook(Long id) {
        Session session = sessionFactory.getCurrentSession();

        Book book = session.get(Book.class, id);

        return book;
    }

    @Override
    public void saveBook(Book book) {
        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(book);
    }

    @Override
    public void deleteBook(Long id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("delete from Book where id=:bookId");
        query.setParameter("bookId", id).executeUpdate();
    }

    @Override
    public List<Book> searchBook(String searchBook) {
        Session session = sessionFactory.getCurrentSession();

        Query<Book> query = session.createQuery("from Book where lower(author) like :theName or lower(title) like :theName" +
                " or lower(genre) like :theName", Book.class);
        query.setParameter("theName", "%" + searchBook.toLowerCase() + "%");

        List<Book> foundBooks = query.getResultList();

        return foundBooks;
    }


    public List<Reader> getBookReaders(Long bookId) {
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery("from Book b join fetch b.readers r WHERE b.id = :id");

        Book book = (Book) q.setParameter("id", bookId).getSingleResult();
        List<Reader> readers = book.getReaders();

        return readers;
    }

}
