package controller.BannerController;

import java.io.*;

import dal.BannerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Banner;
import model.User;

@WebServlet(name = "UpdateBannerServlet", value = "/update-banner")
public class UpdateBanner extends HttpServlet {
    private String message;
    private BannerDAO bannerDAO;

    public void init() {
        message = "Hello World!";
        bannerDAO = new BannerDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            String idStr=request.getParameter("id");
            try{
                int id=Integer.parseInt(idStr);
                Banner banner= bannerDAO.get(id);

                request.setAttribute("banner", banner);
                request.getRequestDispatcher("Banner/update-banner.jsp").forward(request, response);
            }catch (Exception e){
                e.printStackTrace();
            }


        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        String image = request.getParameter("image");
        String content = request.getParameter("content");
        String startDay = request.getParameter("start");
        String starts[] = startDay.split("T");
        String endDay = request.getParameter("end");
        String ends[] = endDay.split("T");

        bannerDAO.update(new Banner(Integer.parseInt(id), image, content, starts[0] + " " + starts[1],
                ends[0] + " " + ends[1]));


        request.setAttribute("message", "Update banner successfully");
        response.sendRedirect("/banners");

    }

    public void destroy() {
    }
}