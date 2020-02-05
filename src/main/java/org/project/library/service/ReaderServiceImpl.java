package org.project.library.service;

import org.project.library.dao.ReaderDAO;
import org.project.library.entity.Book;
import org.project.library.entity.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ReaderServiceImpl implements ReaderService {

    @Autowired
    private ReaderDAO readerDAO;

    @Override
    @Transactional
    public List<Reader> getReaders() {
        return readerDAO.getReaders();
    }

    @Override
    @Transactional
    public Reader getReader(Long id) {
        return readerDAO.getReader(id);
    }

    @Override
    @Transactional
    public void saveReader(Reader reader) {
        readerDAO.saveReader(reader);
    }

    @Override
    @Transactional
    public void deleteReader(Long id) {
        readerDAO.deleteReader(id);
    }

    @Override
    @Transactional
    public List<Reader> searchReaderByName(String searchName) {
        return readerDAO.searchReaderByName(searchName);
    }

    @Override
    @Transactional
    public List<Book> getReaderBooks(Long readerId) {
        return readerDAO.getReaderBooks(readerId);
    }
}
