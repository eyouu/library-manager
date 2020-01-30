package org.project.library.dao;

import org.project.library.entity.Book;
import org.project.library.entity.RentInfo;

import java.util.List;

public interface RentInfoDAO {

    List<RentInfo> getRentList();

    void saveRent(RentInfo rentInfo);

    void deleteRent(Long id);

    RentInfo getRent(Long id);

    List<RentInfo> getRentedBooks();

    List<RentInfo> getReturnedBooks();

    List<RentInfo> searchRentByReaderId(Long readerId);

    List<RentInfo> searchRentByBookId(Long bookId);

    List<RentInfo> searchRentByRentId(Long rentId);
}
