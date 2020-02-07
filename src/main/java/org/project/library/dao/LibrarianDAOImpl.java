package org.project.library.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.project.library.entity.Librarian;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LibrarianDAOImpl implements LibrarianDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Librarian> getLibrarians() {
        Session session = sessionFactory.getCurrentSession();

        Query<Librarian> query = session.createQuery("from Librarian ", Librarian.class);
        List<Librarian> librarians = query.getResultList();

        return librarians;
    }

    @Override
    public Librarian getLibrarian(Long id) {
        Session session = sessionFactory.getCurrentSession();

        Librarian librarian = session.get(Librarian.class, id);

        return librarian;
    }

    @Override
    public void saveLibrarian(Librarian librarian) {
        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(librarian);
    }

    @Override
    public void deleteLibrarian(Long id) {
        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery("delete from Librarian where id=:librarianId");
        query.setParameter("librarianId", id).executeUpdate();
    }

    @Override
    public List<Librarian> searchLibrarian(String librarianName) {
        Session session = sessionFactory.getCurrentSession();

        Query<Librarian> query = session.createQuery("from Librarian where lower(firstName) like :theName" +
                " or lower(lastName) like :theName", Librarian.class);
        query.setParameter("theName", "%" + librarianName.toLowerCase() + "%");

        List<Librarian> foundLibrarians = query.getResultList();

        return foundLibrarians;
    }

}
