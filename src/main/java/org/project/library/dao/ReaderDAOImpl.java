package org.project.library.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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

        Query<Reader> query = session.createQuery("from Reader", Reader.class);
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
        query.setParameter("readerId", id);
        query.executeUpdate();
    }
}
