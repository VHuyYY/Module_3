package Controller;

import Service.UserService;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "userController", value = "/Users")
public class UserController extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getParameter("path");
        switch (path) {
            case "Home":
                showHome(req, resp);
                break;
            case "Add":
                showFormAdd(req, resp);
                break;
            case "delete":
                deleteUser(req,resp);
                break;
                case "edit":
                    showFormEdit(req,resp);
                    break;
            default:
                showError(req, resp);
        }
    }

    private void showFormEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idEdit = Integer.parseInt(req.getParameter("id"));
        User user = userService.findById(idEdit);
        req.setAttribute("user", user);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/View/edit.jsp");
        dispatcher.forward(req, resp);
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            int idDelete = Integer.parseInt(req.getParameter("id"));
            userService.delete(idDelete);
            resp.sendRedirect("/Users?path=Home");
    }

    private void showError(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("error.jsp");
        dispatcher.forward(req, resp);
    }

    private void showFormAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Add.jsp");
        dispatcher.forward(req, resp);
    }

    private void showHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> list = userService.getAll();
        req.setAttribute("list", list);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Home.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getParameter("path");
        switch (path) {
            case "Add":
                addUser(req, resp);
                break;
            case "edit":
                editUser(req, resp);
                break;
            default:
                showError(req, resp);
        }
    }

    private void editUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String mail = req.getParameter("mail");
            String coutry = req.getParameter("country");
            User newUser = new User(id, name, mail, coutry);
            userService.update(id,newUser);
            resp.sendRedirect("/Users?path=Home");
        } catch (Exception e) {

        }
    }


    private void addUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("name");
            String mail = req.getParameter("mail");
            String coutry = req.getParameter("country");
            User newUser = new User( name, mail, coutry);
            userService.add(newUser);
            resp.sendRedirect("/Users?path=Home");

        } catch (Exception e) {

        }
    }

    private void showErrorPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("error.jsp");
        dispatcher.forward(req, resp);
    }
}
