package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

@WebFilter(filterName = "TeacherFilterFilter", urlPatterns = {"/TeacherFilter"})
public class TeacherFilter implements Filter {

    private static final boolean debug = true;
    private FilterConfig filterConfig = null;

    public TeacherFilter() {

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
        if(session.getAttribute("user")!=null) {
            User user=(User) session.getAttribute("user");
            if (user.getRole().compareTo("R3")==0) {
                res.sendRedirect("/home");
            } else {
                chain.doFilter(request, response);
            }
        }else{
            res.sendRedirect("/login");
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