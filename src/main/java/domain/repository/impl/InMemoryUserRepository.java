package domain.repository.impl;

import domain.User;
import domain.repository.UserRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class InMemoryUserRepository implements UserRepository {

    private List<User> userList = new ArrayList<User>();

    public List<User> getAllUsers() {
        return userList;
    }

    public void addUser(User user) {
        userList.add(user);
    }
}
