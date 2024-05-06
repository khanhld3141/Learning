package controller.Admin.BannerController;

import java.io.*;

import dal.BannerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Banner;

@WebServlet(name = "CreateBannerServlet", value = "/create-banner")
public class CreateBanner extends HttpServlet {
    private String message;
    private BannerDAO bannerDAO;
    public void init() {
        message = "Hello World!";
        bannerDAO=new BannerDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("Banner/create-banner.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String image = request.getParameter("image");
        String content = request.getParameter("content");
        String startDay = request.getParameter("start");
        String starts[]=startDay.split("T");
        String endDay = request.getParameter("end");
        String ends[]=endDay.split("T");

        bannerDAO.create(new Banner(image, content, starts[0]+" "+starts[1], ends[0]+" "+ends[1]));

        request.setAttribute("message","Add new banner successfully");
        response.sendRedirect("/banners");

    }

    public void destroy() {
    }
}