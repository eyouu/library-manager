package org.project.library.service;

import org.project.library.entity.Librarian;

import java.util.List;

public interface LibrarianService {

    List<Librarian> getLibrarians();

    Librarian getLibrarian(Long id);

    void saveLibrarian(Librarian librarian);

    void deleteLibrarian(Long id);
}
