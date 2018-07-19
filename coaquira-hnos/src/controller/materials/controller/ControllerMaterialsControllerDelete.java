package controller.materials.controller;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controllers.PMF;
import model.entity.Material;
import model.entity.MaterialController;

@SuppressWarnings("serial")
public class ControllerMaterialsControllerDelete extends HttpServlet{
	@SuppressWarnings("deprecation")
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException{
		PersistenceManager pm1= PMF.get().getPersistenceManager();
		String id=request.getParameter("id");
		final Query mat = pm1.newQuery(Material.class);
		try{
		MaterialController m=pm1.getObjectById(MaterialController.class,Long.parseLong(id));
		String queryMaterial= "select from "+Material.class.getName()+" where id=="+m.getMaterials();
		List<Material>MaterialSearch=(List<Material>)pm1.newQuery(queryMaterial).execute();
		int dato3=m.getCantidad();
		int modificar=MaterialSearch.get(0).getQuantity()+dato3;
		MaterialSearch.get(0).setQuantity(String.valueOf(modificar));
		pm1.deletePersistent(m);
		response.sendRedirect("/materialsController");
		}catch(Exception e){
			System.out.println(e);
			response.getWriter().println("Ocurrió un error, vuelva a intentarlo.");
			response.sendRedirect("/MaterialsController");
		}finally{
			pm1.close();
			mat.closeAll();
		}
	}

}