package org.project.library.dao;

import org.project.library.entity.Role;

public interface RoleDAO {
    Role findRoleByName(String theRoleName);
}
