package web;

import com.alibaba.fastjson.JSON;
import pojo.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/selectAllServlet")
public class selectAllServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userService = new UserService();
        List<User> users = userService.selectAll();
       // System.out.println(users);
        req.setAttribute("users", users);
        req.getRequestDispatcher("/user.jsp").forward(req, resp);
        //转换
        //String jsonString = JSON.toJSONString(users);
        //响应数据
        //resp.setContentType("text/json;charset=utf-8");
       // resp.getWriter().write(jsonString);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
