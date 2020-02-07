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
public class ReaderDAOImpl implements ReaderDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Reader> getReaders() {
        Session session = sessionFactory.getCurrentSession();

        Query<Reader> query = session.createQuery("from Reader order by registrationDate desc", Reader.class);
        List<Reader> readers = query.getResultList();

        return readers;
    }

    @Override
    public Reader getReader(Long id) {
        Session session = sessionFactory.getCurrentSession();

        Reader reader = session.get(Reader.class, id);

        return reader;
    }

    @Override
    public void saveReader(Reader reader) {
        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(reader);
    }

    @Override
    public void deleteReader(Long id) {
        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery("delete from Reader where id=:readerId");
        session.createQuery("update RentInfo set reader.id=null").executeUpdate();

        query.setParameter("readerId", id).executeUpdate();
    }

    @Override
    public List<Reader> searchReaderByName(String searchName) {
        Session session = sessionFactory.getCurrentSession();

        Query<Reader> query = session.createQuery("from Reader where lower(firstName) like :theName" +
                " or lower(lastName) like :theName", Reader.class);
        query.setParameter("theName", "%" + searchName.toLowerCase() + "%");

        List<Reader> readers = query.getResultList();

        return readers;
    }

    @Override
    public List<Book> getReaderBooks(Long readerId) {
        Session session = sessionFactory.getCurrentSession();

        Query q = session.createQuery("from Reader r join fetch r.books b WHERE r.id = :id");
        Reader reader = (Reader) q.setParameter("id", readerId).getSingleResult();
        List<Book> books = reader.getBooks();

        return books;
    }
}
