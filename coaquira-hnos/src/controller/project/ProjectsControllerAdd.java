package controller.project;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controllers.PMF;
import model.entity.Material;
import model.entity.Project;

@SuppressWarnings("serial")
public class ProjectsControllerAdd extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException{
		PersistenceManager pm= PMF.get().getPersistenceManager();
		
		if(request.getParameter("enviar")!=null){
		String dato=request.getParameter("name");
		Double dato1=Double.parseDouble(request.getParameter("cost"));
		Project a = new Project(dato,dato1);
				// persist the entity
				try {
				pm.makePersistent(a);
				} finally {
				pm.close();
				}
				response.sendRedirect("/projects");
		}else{
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/WEB-INF/Views/Projects/add.jsp");
			try{
				dispatcher.forward(request, response);
			}catch(ServletException e){
				e.printStackTrace();
			}

		}
	}

}
