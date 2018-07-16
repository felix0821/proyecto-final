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
public class MaterialsControllerDelete extends HttpServlet{
	@SuppressWarnings("deprecation")
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException{
		PersistenceManager pm1= PMF.get().getPersistenceManager();
		String id=request.getParameter("id");
		Material m=pm1.getObjectById(Material.class,Long.parseLong(id));
		pm1.deletePersistent(m);
		response.sendRedirect("/materials");
		
	}

}