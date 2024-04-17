package controller.BannerController;

import java.io.*;

import dal.BannerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Banner;

@WebServlet(name = "DeleteBannerServlet", value = "/delete-banner")
public class DeleteBanner extends HttpServlet {
    private String message;
    private BannerDAO bannerDAO;

    public void init() {
        message = "Hello World!";
        bannerDAO=new BannerDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter(("id"))!=null){
            String idStr=request.getParameter(("id"));

            try{
                int id = Integer.parseInt(idStr);
                bannerDAO.delete(id);
                response.sendRedirect("/banners");
            }catch (Exception e){
                e.printStackTrace();
            }
        }else{
            request.setAttribute("message","Missing parameter id");
            request.getRequestDispatcher("/banners").forward(request,response);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}