package controller.Admin.BannerController;

import java.io.*;
import java.util.List;

import dal.BannerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Banner;

@WebServlet(name = "IndexBannerServlet", value = "/banners")
public class GetBanner extends HttpServlet {
    private String message;
    private BannerDAO bannerDAO;

    public void init() {
        message = "Hello World!";
        bannerDAO=new BannerDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Banner> lists=bannerDAO.getAllBanners();
        request.setAttribute("banners",lists);
        request.getRequestDispatcher("Banner/index.jsp").forward(request,response);
    }

    public void destroy() {
    }
}