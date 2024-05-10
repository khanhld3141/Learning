package filter;

import dal.UserCourseDAO;
import dal.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.UserCourse;

import java.io.IOException;

@WebFilter(filterName = "CourseFilterFilter", urlPatterns = {"/CourseFilter"})
public class CourseFilter implements Filter {

    private static final boolean debug = true;
    private FilterConfig filterConfig = null;
    private UserDAO userDAO;
    private UserCourseDAO userCourseDAO;

    public CourseFilter() {
        userDAO = new UserDAO();
        userCourseDAO = new UserCourseDAO();
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {

            }
        }

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        if (session.getAttribute("user") == null) {
            res.sendRedirect("/login");
        } else {
            String id = req.getParameter("courseid");
            User user = (User) session.getAttribute("user");
            UserCourse userCourse = userCourseDAO.findByUserAndCourse(user.getId(),Integer.parseInt(id));
            if(userCourse == null){
                res.sendRedirect("buy?courseid="+id);
            }else {
                chain.doFilter(request, response);
            }
        }

    }

    public FilterConfig getFilterConfig() {
        return filterConfig;
    }

    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    @Override
    public void destroy() {
        // invoked when the filter instance is being destroyed by the container
        // used clean up resources

    }
}