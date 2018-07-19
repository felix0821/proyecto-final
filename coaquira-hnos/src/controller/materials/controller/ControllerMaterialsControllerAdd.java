package controller.materials.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controllers.PMF;
import model.entity.User;
import model.entity.Material;
import model.entity.MaterialController;
import model.entity.Project;
import model.entity.Resource;
import model.entity.Role;

@SuppressWarnings("serial")
public class ControllerMaterialsControllerAdd extends HttpServlet{
		public void doGet(HttpServletRequest request, HttpServletResponse response)
				throws IOException, ServletException {
			PersistenceManager pm=PMF.get().getPersistenceManager();
			//LocalDateTime horaPeru=LocalDateTime.now(ZoneId.of("America/Lima"));
			final Query u = pm.newQuery(User.class);
			final Query m = pm.newQuery(Material.class);
			final Query p = pm.newQuery(Project.class);
			try{
				List<User> usuarios = (List<User>) u.execute();
				List<Material> materiales = (List<Material>) m.execute();
				List<Project> proyectos = (List<Project>) p.execute();
			if(request.getParameter("enviar")!=null){
				String fechaS=request.getParameter("fechaS");
				String fechaE=request.getParameter("fechaE");
				String queryUser= "select from "+User.class.getName()+" where email=='"+request.getParameter("nameUser")+"'"+" && status==true";
				String queryMaterial= "select from "+Material.class.getName()+" where name=='"+request.getParameter("nameMaterial")+"'";
				String queryProject= "select from "+Project.class.getName()+" where name=='"+request.getParameter("nameProject")+"'";
				List<Project>ProjectSearch=(List<Project>)pm.newQuery(queryProject).execute();
				List<User>UserSearch=(List<User>)pm.newQuery(queryUser).execute();
				List<Material>MaterialSearch=(List<Material>)pm.newQuery(queryMaterial).execute();
			Long dato=Long.parseLong(UserSearch.get(0).getId());
			Long dato1=ProjectSearch.get(0).getId();
			Long dato2=MaterialSearch.get(0).getId();
			int dato3=Integer.parseInt(request.getParameter("can"));
			int modificar=MaterialSearch.get(0).getQuantity()-dato3;
			MaterialSearch.get(0).setQuantity(String.valueOf(modificar));
			MaterialController a = new MaterialController(dato1,dato,dato2,dato3,fechaS,fechaE);
					// persist the entity
					try {
					pm.makePersistent(a);
					} finally {
					pm.close();
					}
					response.sendRedirect("/materialsController");
			}
			else{
				request.setAttribute("usuarios", usuarios);
				request.setAttribute("proyectos", proyectos);
				request.setAttribute("materiales", materiales);
				RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/WEB-INF/Views/MaterialsController/add.jsp");
					dispatcher.forward(request, response);
			}
			
			}catch(Exception e){
				System.out.println(e);
				response.getWriter().println("Ocurrió un error, vuelva a intentarlo.");
				response.sendRedirect("/MaterialsController");
			}finally{
				pm.close();
				u.closeAll();
				p.closeAll();
				m.closeAll();
			}
		}
}

