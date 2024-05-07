package controller.Student.BlogController;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

import controller.Ulti.FileUploadUtil;
import dal.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Post;

@MultipartConfig()
@WebServlet(name = "UploadImageBlogServlet",value ="/upload-image-blog")
public class UploadImageBlog extends HttpServlet {
    private PostDAO postDAO;

    @Override
    public void init() throws ServletException {
        postDAO = new PostDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/Home/add-user.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //delete
            String realPath = request.getServletContext().getRealPath("/images");


            String postid = request.getParameter("postid");
            Post post = postDAO.get(Integer.parseInt(postid));
            if (post.getImage() != null) {
                FileUploadUtil.deleteFile(realPath, post.getImage());
            }

            //create
            Part photo = request.getPart("image");
            String filename =
                    Path.of(UUID.randomUUID().toString()).getFileName().toString()+ "_" +photo.getSubmittedFileName()  ;
            if (!Files.exists(Path.of(realPath))) {
                Files.createDirectory(Path.of(realPath));
            }
            post.setImage(filename);
            postDAO.update(post);
            photo.write(realPath + "/" + filename);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
