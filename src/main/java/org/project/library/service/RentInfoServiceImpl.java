package org.project.library.service;

import org.project.library.dao.RentInfoDAO;
import org.project.library.entity.Book;
import org.project.library.entity.Librarian;
import org.project.library.entity.Reader;
import org.project.library.entity.RentInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RentInfoServiceImpl implements RentInfoService {

    @Autowired
    private RentInfoDAO rentInfoDAO;

    @Override
    @Transactional
    public List<RentInfo> getRentList() {
        return rentInfoDAO.getRentList();
    }

    @Override
    @Transactional
    public List<RentInfo> getRentsByReaderId(Long id) {
        return rentInfoDAO.getRentsByReaderId(id);
    }

    @Override
    @Transactional
    public List<RentInfo> getRentsGivenByLibrarianId(Long id) {
        return rentInfoDAO.getRentsGivenByLibrarianId(id);
    }

    @Override
    @Transactional
    public List<Book> getRentedBooks() {
        return rentInfoDAO.getRentedBooks();
    }

    @Override
    @Transactional
    public void saveRent(RentInfo rentInfo) {
        rentInfoDAO.saveRent(rentInfo);
    }

    @Override
    public void deleteRent(Long id) {
        rentInfoDAO.deleteRent(id);
    }

    @Override
    public RentInfo getRent(Long id) {
        return rentInfoDAO.getRent(id);
    }
}
