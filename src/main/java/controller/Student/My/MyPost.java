package controller.Student.My;

import java.io.*;
import java.util.List;

import dal.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Post;
import model.User;

@WebServlet(name = "MyPostServlet", value = "/my-posts")
public class MyPost extends HttpServlet {
    private String message;
    private PostDAO postDAO;

    public void init() {
        message = "Hello World!";
        postDAO=new PostDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session =request.getSession();
        User user =(User)session.getAttribute("user");

        List<Post> posts=postDAO.getMyPost(user.getId());
        request.setAttribute("posts",posts);

        request.getRequestDispatcher("/my/my-posts.jsp").forward(request, response);
    }

    public void destroy() {
    }
}