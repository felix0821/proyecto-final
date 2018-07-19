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
public class ProjectsControllerView extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
		PersistenceManager pm= PMF.get().getPersistenceManager();
		String id=request.getParameter("id");
		Project m=pm.getObjectById(Project.class,Long.parseLong(id));
		request.setAttribute("project", m);
		RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/WEB-INF/Views/Projects/view.jsp");
		dispatcher.forward(request, response);
	
	}

}