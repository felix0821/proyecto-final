package controller.materials;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controllers.PMF;
import model.entity.Material;

@SuppressWarnings("serial")
public class MaterialsControllerView extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException{
		PersistenceManager pm= PMF.get().getPersistenceManager();
		String id=request.getParameter("id");
		Material m=pm.getObjectById(Material.class,Long.parseLong(id));
		request.setAttribute("material", m);
		RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/WEB-INF/Views/Materials/view.jsp");
		try{
			dispatcher.forward(request, response);
		}catch(ServletException e){
			e.printStackTrace();
		}
	
	}

}