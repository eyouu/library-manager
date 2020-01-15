package org.project.library.service;

import org.project.library.dao.LibrarianDAO;
import org.project.library.entity.Librarian;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class LibrarianServiceImpl implements LibrarianService {

    @Autowired
    private LibrarianDAO librarianDAO;

    @Override
    @Transactional
    public List<Librarian> getLibrarians() {
        return librarianDAO.getLibrarians();
    }

    @Override
    @Transactional
    public Librarian getLibrarian(Long id) {
        return librarianDAO.getLibrarian(id);
    }

    @Override
    @Transactional
    public void saveLibrarian(Librarian librarian) {
        librarianDAO.saveLibrarian(librarian);
    }

    @Override
    @Transactional
    public void deleteLibrarian(Long id) {
        librarianDAO.deleteLibrarian(id);
    }
}
