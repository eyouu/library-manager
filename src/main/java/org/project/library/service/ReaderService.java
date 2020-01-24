package org.project.library.service;

import org.project.library.entity.Reader;

import java.util.List;

public interface ReaderService {

    List<Reader> getReaders();

    Reader getReader(Long id);

    void saveReader(Reader reader);

    void deleteReader(Long id);

    List<Reader> searchReaderByName(String searchName);
}
