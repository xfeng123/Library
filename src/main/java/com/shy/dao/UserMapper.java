package com.shy.dao;

<<<<<<< HEAD
import com.shy.pojo.Book;

public interface UserMapper {

    int addBook(Book book);

    int deleteBook(String id);

    int updateBook(Book book);
=======
import com.shy.pojo.User;

import java.util.List;

public interface UserMapper {

    List<User> selectAll();

    int deleteUser(String id);

    int addUser(User user);

    int updateUser(User user);
>>>>>>> 40de1819055201ab802e4dc95b8565e398528416

}
