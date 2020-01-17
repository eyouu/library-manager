package org.project.library.dao;

import org.project.library.entity.Librarian;

import java.util.List;

public interface LibrarianDAO {

    List<Librarian> getLibrarians();

    Librarian getLibrarian(Long id);

    void saveLibrarian(Librarian librarian);

    void deleteLibrarian(Long id);

}
