package domain.repository;

import domain.User;

import java.util.List;

public interface UserRepository {
    List<User> getAllUsers();
    void addUser(User user);
//    void addAttempt(String username, long index);
    User getUserByUsername(String username);
}
