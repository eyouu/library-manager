package org.project.library.service;

import org.project.library.entity.User;
import org.project.library.user.LibraryUser;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    User findByUserName(String userName);

    void save(LibraryUser user);
}
