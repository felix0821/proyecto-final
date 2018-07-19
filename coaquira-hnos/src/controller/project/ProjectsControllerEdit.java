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
public class ProjectsControllerEdit extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
			PersistenceManager pm= PMF.get().getPersistenceManager();
			String id=request.getParameter("id");
			if(request.getParameter("enviar")!=null){
		Project m =pm.getObjectById(Project.class,Long.parseLong(id));
		String dato=request.getParameter("name");
		double dato1=Double.parseDouble(request.getParameter("cost"));
		boolean status=false;
		if(request.getParameter("status")!=null){status=true;}
		m.setName(dato);
		m.setValue(dato1);
		m.setState(status);
		response.sendRedirect("/projects");
	}
	else{
        Project proyect=pm.getObjectById(Project.class,Long.parseLong(id));
		request.setAttribute("project", proyect);
		RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/WEB-INF/Views/Projects/edit.jsp");
		dispatcher.forward(request, response);
	}
	}
}

