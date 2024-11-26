package com.example.ss10_dskh;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "")
public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> customers = new ArrayList<>();
        customers.add(new Customer("A", "2002", "123", "data:image/jpeg;base64,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"));
        customers.add(new Customer("A", "2002", "123", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4D1Cg52MbLy287_rWdRUjDtjxwUon1e0UIg&s"));
        customers.add(new Customer("A", "2002", "123", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFa1aOl9PUwZ0va3N3AWxx1qj3Psw4K0CzjQ&s"));
        customers.add(new Customer("A", "2002", "123", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpvEuStaLOTdpc_hSqI1Vunvu9qiLtLK7W1A&s"));
        customers.add(new Customer("A", "2002", "123", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhyzCS5lLfi61rkuXj02s68yjT9nQXQ4SmQA&s"));
        req.setAttribute("list", customers);
        req.getRequestDispatcher("index.jsp").forward(req, resp);

    }

    public void destroy() {
    }


}