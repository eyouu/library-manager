package org.project.library.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.project.library.entity.Book;
import org.project.library.entity.Librarian;
import org.project.library.entity.Reader;
import org.project.library.entity.RentInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RentInfoDAOImpl implements RentInfoDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<RentInfo> getRentList() {
        Session session = sessionFactory.getCurrentSession();

        Query<RentInfo> query = session.createQuery("from RentInfo", RentInfo.class);
        List<RentInfo> rents = query.getResultList();

        return rents;
    }

    @Override
    public List<RentInfo> getRentsByReaderId(Long id) {
        Session session = sessionFactory.getCurrentSession();

        Query<RentInfo> query = session.createQuery("from RentInfo where reader.id=:readerId", RentInfo.class);
        query.setParameter("readerId", id).getResultList();

        List<RentInfo> rents = query.getResultList();

        return rents;
    }

    @Override
    public List<RentInfo> getRentsGivenByLibrarianId(Long id) {
        Session session = sessionFactory.getCurrentSession();

        Query<RentInfo> query = session.createQuery("from RentInfo where librarian.id=:librarianId", RentInfo.class);
        query.setParameter("librarianId", id);

        List<RentInfo> rents = query.getResultList();

        return rents;
    }

    @Override
    public List<Book> getRentedBooks() {
        Session session = sessionFactory.getCurrentSession();

        Query<Book> query = session.createQuery("select Book from RentInfo where book.id=Book.id", Book.class);
        List<Book> books = query.getResultList();

        return books;
    }

    @Override
    public void saveRent(RentInfo rentInfo) {
        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(rentInfo);
    }

    @Override
    public void deleteRent(Long id) {
        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery("delete from RentInfo where rentId=:rentId");
        query.setParameter("rentId", id);
        query.executeUpdate();
    }

    @Override
    public RentInfo getRent(Long id) {
        Session session = sessionFactory.getCurrentSession();

        RentInfo rentInfo = session.get(RentInfo.class, id);

        return rentInfo;
    }
}
