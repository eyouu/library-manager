package org.project.library.service;

import org.project.library.dao.RoleDAO;
import org.project.library.dao.UserDAO;
import org.project.library.entity.Role;
import org.project.library.entity.User;
import org.project.library.user.LibraryUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private RoleDAO roleDAO;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    @Transactional
    public User findByUserName(String userName) {
        // check the database if the user already exists
        return userDAO.findByUserName(userName);
    }

    @Override
    @Transactional
    public void save(LibraryUser libraryUser) {
        User user = new User();

        user.setUserName(libraryUser.getUserName());
        user.setPassword(passwordEncoder.encode(libraryUser.getPassword()));
        user.setFirstName(libraryUser.getFirstName());
        user.setLastName(libraryUser.getLastName());
        user.setEmail(libraryUser.getEmail());

        // give user default role of "librarian"
        user.setRoles(Collections.singletonList(roleDAO.findRoleByName("ROLE_LIBRARIAN")));

        userDAO.save(user);
    }

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDAO.findByUserName(username);
        if (user == null) {
            throw new UsernameNotFoundException("Invalid username of password.");
        }
        return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(),
                mapRolesToAuthorities(user.getRoles()));
    }

    private List<? extends GrantedAuthority> mapRolesToAuthorities(List<Role> roles) {
        return roles.stream().map(role -> new SimpleGrantedAuthority(role.getName())).collect(Collectors.toList());
    }
}
