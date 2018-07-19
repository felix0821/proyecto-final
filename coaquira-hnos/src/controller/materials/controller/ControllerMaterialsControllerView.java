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
import model.entity.Project;
import model.entity.User;
import model.entity.MaterialController;

@SuppressWarnings("serial")
public class ControllerMaterialsControllerView extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException{
		PersistenceManager pm= PMF.get().getPersistenceManager();
		String id=request.getParameter("id");
		final Query u = pm.newQuery(User.class);
		final Query m = pm.newQuery(Material.class);
		final Query p = pm.newQuery(Project.class);
		try{
			MaterialController MC=pm.getObjectById(MaterialController.class,Long.parseLong(id));
			List<User> usuarios = (List<User>) u.execute();
			List<Material> materiales = (List<Material>) m.execute();
			List<Project> proyectos = (List<Project>) p.execute();
			int cantidad =MC.getCantidad();
			String fechaS=MC.getFechaSalida();
			String fechaE=MC.getFechaEntrada();
			request.setAttribute("usuarios", usuarios);
			request.setAttribute("proyectos", proyectos);
			request.setAttribute("materiales", materiales);
			request.setAttribute("materialController", MC);
			request.setAttribute("fechaSalida", fechaS);
			request.setAttribute("fechaEntrada", fechaE);
			request.setAttribute("cantidad", cantidad);
		RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/WEB-INF/Views/MaterialsController/view.jsp");
		try{
			dispatcher.forward(request, response);
		}catch(ServletException e){
			e.printStackTrace();
		}
		}catch(Exception e){
			System.out.println(e);
			response.getWriter().println("Ocurrió un error, vuelva a intentarlo.");
			response.sendRedirect("/materialsController");
		}finally{
			pm.close();
			u.closeAll();
			p.closeAll();
			m.closeAll();
		}
	}

}