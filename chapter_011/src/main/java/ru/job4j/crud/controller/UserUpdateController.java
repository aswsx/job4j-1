package ru.job4j.crud.controller;

import ru.job4j.crud.logic.Validate;
import ru.job4j.crud.logic.ValidateService;
import ru.job4j.crud.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Alexander Abramov (alllexe@mail.ru)
 * @version 1
 * @since 04.10.2019
 */
public class UserUpdateController extends HttpServlet {

    private final Validate logic = ValidateService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));

        User user = logic.findById(userId);

        if (user != null) {
            request.setAttribute("action", "edit");
            request.setAttribute("title", "Edit user");
            request.setAttribute("user", user);
            request.setAttribute("buttonName", "Edit user");
            getServletContext().getRequestDispatcher("/WEB-INF/views/user.jsp").forward(request, response);
        } else {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().append("user with id ").append(String.valueOf(userId)).append(" not found");
            response.setStatus(HttpServletResponse.SC_OK);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        Integer id = null;
        if (request.getParameter("id") != null) {
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

        }
        String name = request.getParameter("name");
        String login = request.getParameter("login");
        String email = request.getParameter("email");

        User user = new User(id, name, login, email);

        if (logic.update(user)) {
            response.sendRedirect("/");
        } else {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().append("error update user with id ").append(String.valueOf(id)).append(" not found");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}