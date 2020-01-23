package org.project.library.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.project.library.entity.Book;
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

        Query<RentInfo> query = session.createQuery("from RentInfo order by dateOfRent desc", RentInfo.class);
        List<RentInfo> rents = query.getResultList();

        return rents;
    }


    @Override
    public void saveRent(RentInfo rentInfo) {
        Session session = sessionFactory.getCurrentSession();

        Long bookId = rentInfo.getBook().getId();
        Book book = session.get(Book.class, bookId);

        int bookQuantity = book.getQuantity();

        if (bookQuantity > 0) {
            book.setQuantity(bookQuantity - 1);
        } else {
            // throw exception
        }
        session.saveOrUpdate(rentInfo);
    }

    @Override
    public void deleteRent(Long id) {
        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery("delete from RentInfo where rentId=:rentId");
        query.setParameter("rentId", id);

        RentInfo rentInfo = session.get(RentInfo.class, id);

        if (rentInfo.getBook() == null || rentInfo.getReader() ==null) {
        } else if (rentInfo.getStatus().equals("IN RENT")) {
            rentInfo.getBook().setQuantity(rentInfo.getBook().getQuantity() + 1);
        }

        query.executeUpdate();
    }

    @Override
    public RentInfo getRent(Long id) {
        Session session = sessionFactory.getCurrentSession();

        RentInfo rentInfo = session.get(RentInfo.class, id);

        return rentInfo;
    }

    @Override
    public void changeRentStatus(Long id) {
        Session session = sessionFactory.getCurrentSession();

        RentInfo rentInfo = session.get(RentInfo.class, id);

        if (rentInfo.getBook() == null || rentInfo.getReader() == null) {
        }  else {
            String rentStatus = rentInfo.getStatus();

            if (rentStatus.equals("IN RENT")) {
                rentStatus = "RETURNED";
                rentInfo.getBook().setQuantity(rentInfo.getBook().getQuantity() + 1);
            } else {
                rentStatus = "IN RENT";
                rentInfo.getBook().setQuantity(rentInfo.getBook().getQuantity() - 1);
            }
            rentInfo.setStatus(rentStatus);
        }
    }

    @Override
    public List<RentInfo> getRentedBooks() {
        Session session = sessionFactory.getCurrentSession();

        Query<RentInfo> query = session.createQuery("from RentInfo where status='IN RENT'", RentInfo.class);
        List<RentInfo> books = query.getResultList();

        return books;
    }

    @Override
    public List<RentInfo> getReturnedBooks() {
        Session session = sessionFactory.getCurrentSession();

        Query<RentInfo> query = session.createQuery("from RentInfo where status='RETURNED'", RentInfo.class);
        List<RentInfo> books = query.getResultList();

        return books;
    }



    @Override
    public List<RentInfo> searchRentByReaderId(Long readerId) {
        Session session = sessionFactory.getCurrentSession();

            Query<RentInfo> query = session.createQuery("from RentInfo where reader.id=:readerId", RentInfo.class);
            query.setParameter("readerId", readerId);

            List<RentInfo> rents = query.getResultList();

        return rents;
    }

    @Override
    public List<RentInfo> searchRentByBookId(Long bookId) {
        Session session = sessionFactory.getCurrentSession();

        Query<RentInfo> query = session.createQuery("from RentInfo where book.id=:bookId", RentInfo.class);
        query.setParameter("bookId", bookId);

        List<RentInfo> rents = query.getResultList();

        return rents;
    }

    @Override
    public List<RentInfo> searchRentByRentId(Long rentId) {
        Session session = sessionFactory.getCurrentSession();

        Query<RentInfo> query = session.createQuery("from RentInfo where rentId=:rentId", RentInfo.class);
        query.setParameter("rentId", rentId);

        List<RentInfo> rents = query.getResultList();
        return rents;
    }


}
