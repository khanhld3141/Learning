package controller.Admin.PostController;

import com.google.gson.Gson;
import controller.Ulti.FileUploadUtil;
import dal.CourseDAO;
import dal.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Course;
import model.Post;

import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
@WebServlet(name = "UploadImageServletPost", value = "/upload-post")
public class UploadImage extends HttpServlet {
    private String message;
    private PostDAO postDAO;

    public void init() {
        message = "Hello World!";
        postDAO = new PostDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String realPath = request.getServletContext().getRealPath("/images");
            String postid = request.getParameter("id");
            //create
            Part photo = request.getPart("image");
            String filename = FileUploadUtil.uploadFile(photo, realPath);

            Post post=postDAO.get(Integer.parseInt(postid));
            post.setImage(filename);
            postDAO.update(post);
            Gson gson = new Gson();
            String jsonfile = gson.toJson(filename);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(jsonfile  );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void destroy() {
    }
}