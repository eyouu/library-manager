package org.project.library.service;

import org.project.library.dao.RentInfoDAO;
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
    public void saveRent(RentInfo rentInfo) {
        rentInfoDAO.saveRent(rentInfo);
    }

    @Override
    @Transactional
    public void deleteRent(Long id) {
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
        rentInfoDAO.changeRentStatus(id);
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
}
