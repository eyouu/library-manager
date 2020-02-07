package org.project.library.service;

import org.project.library.dao.BookDAO;
import org.project.library.dao.RentInfoDAO;
import org.project.library.entity.Book;
import org.project.library.entity.RentInfo;
import org.project.library.exception.NotEnoughBookException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class RentInfoServiceImpl implements RentInfoService {

    @Autowired
    private RentInfoDAO rentInfoDAO;

    @Autowired
    private BookDAO bookDAO;


    @Override
    @Transactional
    public List<RentInfo> getRentList() {
        return rentInfoDAO.getRentList();
    }

    @Override
    @Transactional
    public void saveRent(RentInfo rentInfo) {
        Long bookId = rentInfo.getBook().getId();

        changeBookQuantityAfterRent(bookId);

        Book book = bookDAO.getBook(bookId);
        book.addReader(rentInfo.getReader());

        rentInfo.setDateOfRent(new Date());
        rentInfo.setStatus("IN RENT");

        rentInfoDAO.saveRent(rentInfo);
    }

    @Override
    @Transactional
    public void deleteRent(Long id) {
        RentInfo rentInfo = rentInfoDAO.getRent(id);

        if (rentInfo != null) {
            rentInfo.getBook().removeReader(rentInfo.getReader());
        }

        if (rentInfo.getBook() == null) {
        } else if (rentInfo.getStatus().equals("IN RENT")) {
            // if delete rentInfo when book "IN RENT" set book quantity +1 to avoid book leak
            rentInfo.getBook().setQuantity(rentInfo.getBook().getQuantity() + 1);
        }
        rentInfoDAO.deleteRent(id);
    }

    @Override
    @Transactional
    public RentInfo getRent(Long id) {
        return rentInfoDAO.getRent(id);
    }

    @Override
    @Transactional
    public void changeRentStatus(Long id) {
        RentInfo rentInfo = rentInfoDAO.getRent(id);

        String rentStatus = rentInfo.getStatus();

        if (rentInfo.getBook() == null) {
            if (rentStatus.equals("IN RENT")) {
                rentStatus = "RETURNED";
            } else {
                rentStatus = "IN RENT";
            }
        } else {
            if (rentStatus.equals("IN RENT")) {
                rentInfo.getBook().removeReader(rentInfo.getReader());
                rentStatus = "RETURNED";
                rentInfo.getBook().setQuantity(rentInfo.getBook().getQuantity() + 1);
            } else {
                rentInfo.getBook().addReader(rentInfo.getReader());
                rentStatus = "IN RENT";
                rentInfo.getBook().setQuantity(rentInfo.getBook().getQuantity() - 1);
            }
        }
        rentInfo.setStatus(rentStatus);
    }

    @Override
    @Transactional
    public List<RentInfo> getRentedBooks() {
        return rentInfoDAO.getRentedBooks();
    }

    @Override
    @Transactional
    public List<RentInfo> getReturnedBooks() {
        return rentInfoDAO.getReturnedBooks();
    }

    @Override
    @Transactional
    public List<RentInfo> searchRentByReaderId(Long readerId) {
        return rentInfoDAO.searchRentByReaderId(readerId);
    }

    @Override
    @Transactional
    public List<RentInfo> searchRentByBookId(Long bookId) {
        return rentInfoDAO.searchRentByBookId(bookId);
    }

    @Override
    @Transactional
    public List<RentInfo> searchRentByRentId(Long rentId) {
        return rentInfoDAO.searchRentByRentId(rentId);
    }

    private void changeBookQuantityAfterRent(Long bookId) {
        Book book = bookDAO.getBook(bookId);
        int bookQuantity = book.getQuantity();

        if (bookQuantity > 0) {
            book.setQuantity(bookQuantity - 1);
        } else {
            throw new NotEnoughBookException();
        }
    }
}
