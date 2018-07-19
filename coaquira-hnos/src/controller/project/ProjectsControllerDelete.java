package controller.project;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controllers.PMF;
import model.entity.Material;
import model.entity.Project;

@SuppressWarnings("serial")
public class ProjectsControllerDelete extends HttpServlet{
	@SuppressWarnings("deprecation")
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException{
		PersistenceManager pm1= PMF.get().getPersistenceManager();
		String id=request.getParameter("id");
		Project m=pm1.getObjectById(Project.class,Long.parseLong(id));
		pm1.deletePersistent(m);
		response.sendRedirect("/projects");
		
	}

}