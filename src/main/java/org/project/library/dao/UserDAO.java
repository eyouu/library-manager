package org.project.library.dao;

import org.project.library.entity.User;

public interface UserDAO {
    User findByUserName(String userName);

    void save(User user);
}
