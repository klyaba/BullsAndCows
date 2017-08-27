package service.impl;

import domain.User;
import domain.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    public List<User> getAllUsers() {
        return userRepository.getAllUsers();
    }

    public void addUser(User user) {
        userRepository.addUser(user);
    }
}
