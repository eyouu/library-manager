package org.project.library.service;


import org.project.library.entity.RentInfo;

import java.util.List;

public interface RentInfoService {

    List<RentInfo> getRentList();

    void saveRent(RentInfo rentInfo);

    void deleteRent(Long id);

    RentInfo getRent(Long id);

    void changeRentStatus(Long id);

    List<RentInfo> getRentedBooks();

    List<RentInfo> getReturnedBooks();

    List<RentInfo> searchRentByReaderId(Long readerId);

    List<RentInfo> searchRentByBookId(Long bookId);

    List<RentInfo> searchRentByRentId(Long rentId);
}
