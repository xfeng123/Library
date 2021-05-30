package com.shy.servlet.admin;

import com.alibaba.fastjson.JSON;
import com.shy.pojo.Book;
import com.shy.service.BookService;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "addBookServlet", urlPatterns = "/book/add")
public class addBookServlet extends HttpServlet {

<<<<<<< HEAD
    private BookService bookService = new BookService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String author = req.getParameter("author");
        String sort = req.getParameter("sort");
        String description = req.getParameter("description");
        Book book = new Book(name, author, sort, description);
        boolean flag = bookService.addBook(book);
        req.getRequestDispatcher("/admin/BookList.jsp?message=" + flag).forward(req, resp);
=======
    private BookService bookService ;
    private String message;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String paramJson = IOUtils.toString(req.getInputStream(), "UTF-8");
        HashMap<String, Object> parseObject = JSON.parseObject(paramJson, HashMap.class);
        String name =(String) parseObject.get("name");
        String author =(String) parseObject.get("author");
        String sort =(String) parseObject.get("sort");
        String description =(String) parseObject.get("description");
        bookService=new BookService();
        Book book = new Book(name, author, sort, description);
        boolean flag = bookService.addBook(book);
        if (flag){
            message="添加成功";
        }else {
            message="添加失败";
        }
        req.getRequestDispatcher("/admin/BookList.jsp?message=" + message).forward(req, resp);
>>>>>>> 40de1819055201ab802e4dc95b8565e398528416

    }
}
