package com.example.app_calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "calucator", value = "/calucator")
public class calucator extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String num1Str = req.getParameter("num1");
        String num2Str = req.getParameter("num2");
        String operation = req.getParameter("operation");
        try {
            double num1 = Double.parseDouble(num1Str);
            double num2 = Double.parseDouble(num2Str);
            double result = 0;
            switch (operation) {
                case "add":
                    result = num1 + num2;
                    break;
                case "subtract":
                    result = num1 - num2;
                    break;
                case "multiply":
                    result = num1 * num2;
                    break;
                case "divide":
                    if (num2 == 0) {
                        throw new ArithmeticException("Không thể chia cho 0.");
                    }
                    result = num1 / num2;
                    break;
                default:
                    throw new ArithmeticException("Phép toán không hợp lệ.");
            }
            resp.getWriter().print("Result: " + result);
        } catch (NumberFormatException e) {
            resp.getWriter().print(e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
