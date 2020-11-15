package filters;

import dataaccess.UserDB;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;

/**
 *
 * @author 751682
 */
public class AdminFilter implements Filter {
     

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            HttpSession session = httpRequest.getSession();
            
            String email = (String) session.getAttribute("email");
            
            UserDB userdb= new UserDB();
                       
            if(email == null){
                HttpServletResponse httpResponse = (HttpServletResponse) response;
                httpResponse.sendRedirect("login");
                return;
            }
              
            User user = userdb.get(email);
            if(user==null){
                HttpServletResponse httpResponse = (HttpServletResponse) response;
                httpResponse.sendRedirect("login");
                return;
            }
            
            if (user.getRole().getRoleId()!= 1){
                HttpServletResponse httpResponse = (HttpServletResponse) response;
                httpResponse.sendRedirect("notes");
                return;
            }
            chain.doFilter(request, response);
    }


    /**
     * Destroy method for this filter
     */
    public void destroy() {        
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {        

    }

    
}
