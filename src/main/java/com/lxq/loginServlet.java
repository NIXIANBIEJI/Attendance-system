package web;

import mapper.Usermapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import pojo.User;
import service.UserService;
import utils.SqlSessionFactoryutils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class loginServlet extends HttpServlet {
    private  UserService service = new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String remember= req.getParameter("remember");

        User user = service.login(username,password);
        if(user != null)
        {

            //req.setAttribute("users", users);
           // req.getRequestDispatcher("/user.jsp").forward(req, resp);
           // String contextPath = req.getContextPath();
           // resp.sendRedirect( contextPath+"/selectAllServlet");

            if("1".equals(remember))
            {
                Cookie c_username = new Cookie("username",username);
                Cookie c_password = new Cookie("password",password);
                c_username.setMaxAge(60*60);
                c_password.setMaxAge(3600);
                resp.addCookie(c_username);
                resp.addCookie(c_password);
            }
            HttpSession session = req.getSession();
            session.setAttribute("nowuser", user);
            resp.sendRedirect( "/selectAllServlet");
           // resp.sendRedirect("a.jsp");
        }
        else
        {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();
            writer.write("<h1>登录失败</h1>");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}

