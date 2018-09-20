package cn.sxt.listen;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class ApplicationContextListener
 *
 */
@WebListener
public class ApplicationContextListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ApplicationContextListener() {
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
    	
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent contextEvent)  { 
    	ServletContext context = contextEvent.getServletContext();
    	String contextPath = context.getContextPath();
    	context.setAttribute("ctx", contextPath);
    }
	
}
