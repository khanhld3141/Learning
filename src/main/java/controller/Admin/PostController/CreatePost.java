package controller.Admin.PostController;

import java.io.*;
import java.util.List;

import controller.Ulti.FileUploadUtil;
import dal.HashtagDAO;
import dal.PostDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Hashtag;
import model.Post;
import model.User;

@MultipartConfig
@WebServlet(name = "CreatePostServlet", value = "/dashboard/create-post")
public class CreatePost extends HttpServlet {
    private String message;
    private PostDAO postDAO;
    private UserDAO userDAO;
    private HashtagDAO hashtagDAO;
    public void init() {
        message = "Hello World!";
        postDAO=new PostDAO();
        userDAO=new UserDAO();
        hashtagDAO=new HashtagDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<User> users=userDAO.getAllUser();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/dashboard_post/add-post.jsp").forward(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String content=request.getParameter("Content");
        String comment=request.getParameter("comment");
        String title=request.getParameter("title");
        Part image=request.getPart("image");
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        String realPath = request.getServletContext().getRealPath("/images");
        String filename = FileUploadUtil.uploadFile(image, realPath);

        String[] hashtags = request.getParameterValues("hashtag[]");


        try{
            int postid=postDAO.create(new Post(title,content,comment,filename,user.getId()));
            if (hashtags != null && postid!=-1) {
                for (String hashtag : hashtags) {
                   hashtagDAO.create(new Hashtag(
                           postid,
                           hashtag
                   ));
                }
            }
            response.sendRedirect("/dashboard/posts");
        }catch (Exception e){
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
            e.printStackTrace();
        }

    }
    public void destroy() {
    }
}