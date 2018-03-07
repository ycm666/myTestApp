package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class AjaxCrossDomainFilter
 */
public class AjaxCrossDomainFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AjaxCrossDomainFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter( ServletRequest request, 
			               ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
        HttpServletRequest req = (HttpServletRequest) request;
        String uri = req.getRequestURI();
        
        if(uri.contains("myopenapi/visit/list.do")) {
        	HttpServletResponse res = (HttpServletResponse) response;
        	res.setHeader("Access-Control-Allow-Origin", "*");
        	res.setHeader("Access-Control-Allow-Headers", "x-requested-with, origin, content-type, accept");
        	/*res.setHeader("Access-Control-Allow-Methods", "POST, GET, DELETE, PUT");
        	res.setHeader("Access-Control-Max-Age", "3600");*/
        	
        }
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
