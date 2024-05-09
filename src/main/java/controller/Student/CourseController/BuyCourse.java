package controller.Student.CourseController;

import java.io.*;
import java.util.List;

import dal.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

@WebServlet(name = "BuyCourseServlet", value = "/buy")
public class BuyCourse extends HttpServlet {
    private String message;
    private CourseDAO courseDAO;
    private CategoryDAO categoryDAO;
    private ChapterDAO chapterDAO;
    private LessionDAO lessionDAO;
    private UserCourseDAO userCourseDAO;
    private VoucherDAO voucherDAO;
    private UserDAO userDAO;

    public void init() {
        message = "Hello World!";
        courseDAO = new CourseDAO();
        categoryDAO = new CategoryDAO();
        chapterDAO = new ChapterDAO();
        lessionDAO = new LessionDAO();
        voucherDAO = new VoucherDAO();
        userCourseDAO = new UserCourseDAO();
        userDAO = new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getParameter("courseid") != null) {
            try {
                int id = Integer.parseInt(request.getParameter("courseid"));
                Course course = courseDAO.get(id);

                List<Chapter> chapters = chapterDAO.getAllChapters(id);

                for (int i = 0; i < chapters.size(); i++) {
                    List<Lession> lessions = lessionDAO.getAllLessions(chapters.get(i).getId());
                    chapters.get(i).setLessions(lessions);
                }
                course.setChapters(chapters);
                request.setAttribute("course", course);

                List<Category> categories = categoryDAO.getWithNumberOfCourses();
                request.setAttribute("categories", categories);


                request.getRequestDispatcher("/BuyCourse/index.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }


        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String courseid = request.getParameter("courseid");
        String voucher = request.getParameter("voucher");
        System.out.println(courseid);
        try {
            Voucher v = voucherDAO.findCode(voucher);
            Course course = courseDAO.get(Integer.parseInt(courseid));
            int price = course.getPrice();
            if(v!=null){
                price-=v.getDiscount();
                v.setUsed(v.getUsed()+1);
                voucherDAO.update(v);
            }
            HttpSession session = request.getSession();
            User us = (User) session.getAttribute("user");
            if (price > 0) {
                User user = userDAO.get(us.getId());
                user.setBalance(user.getBalance() - price);
                userDAO.deposit(user);
            }
            userCourseDAO.create(new UserCourse(
                    us.getId(),
                    Integer.parseInt(courseid)
            ));
            response.sendRedirect("/learning?courseid=" + courseid);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void destroy() {
    }
}