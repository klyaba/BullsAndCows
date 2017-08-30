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

    public User getUserByUsername (String username){
        User userByUsername = null;

        for(User user : userList) {
            if(user!=null && user.getUsernamename()!=null && user.getUsernamename().equals(username)){
                userByUsername = user;
                break;
            }
        }

        if(userByUsername == null){
            throw new IllegalArgumentException("No users found with this username: "+ username);
        }

        return userByUsername;

    }

//    public void addAttempt(String username, long index){
//        User user = getUserByUsername(username);
//    };
}
