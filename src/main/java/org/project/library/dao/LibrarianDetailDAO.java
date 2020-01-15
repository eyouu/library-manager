package org.project.library.dao;

import org.project.library.entity.Librarian;
import org.project.library.entity.LibrarianDetail;

public interface LibrarianDetailDAO {

    LibrarianDetail getLibrarianDetail(Long id);

    void saveLibrarianDetail(LibrarianDetail librarianDetail);

    // librarianDetail.getLibrarian().setLibrarianDetail(null)
    void deleteLibrarianDetail(Long id);
}
