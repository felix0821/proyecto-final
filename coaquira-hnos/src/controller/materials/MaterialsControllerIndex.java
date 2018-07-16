package controller.materials;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.UserServiceFactory;

import controllers.PMF;
import model.entity.Material;
import model.entity.Access;
import model.entity.Resource;
import model.entity.User;

@SuppressWarnings("serial")
public class MaterialsControllerIndex extends HttpServlet {
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		
			PersistenceManager pm1=PMF.get().getPersistenceManager();
			

								String query1 = "select from " +
								Material.class.getName();
								@SuppressWarnings("unchecked")
								List<Material> materials = (List<Material>)
								pm1.newQuery(query1).execute();
								
								// pass the list to the jsp
								request.setAttribute("materials", materials);
								// forward the request to the jsp
								RequestDispatcher dispatcher =
								getServletContext().getRequestDispatcher("/WEB-INF/Views/Materials/index.jsp");
								dispatcher.forward(request, response);
			
	}

}
