package org.project.library.dao;

import org.project.library.entity.Book;
import org.project.library.entity.RentInfo;

import java.util.List;

public interface RentInfoDAO {

    List<RentInfo> getRentList();

    List<RentInfo> getRentsByReaderId(Long id);

    List<RentInfo> getRentsGivenByLibrarianId(Long id);

    List<Book> getRentedBooks();

    void saveRent(RentInfo rentInfo);

    void deleteRent(Long id);

    RentInfo getRent(Long id);

}
