package controller.usuario;
import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.UserServiceFactory;

import controllers.PMF;
import model.entity.Access;
import model.entity.Resource;
import model.entity.User;
import model.entity.Usuario;

@SuppressWarnings("serial")
public class UsuarioControllerIndex extends HttpServlet{
	
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException{

		PersistenceManager pm1= PMF.get().getPersistenceManager();
				String query1 = "select from " +
				Usuario.class.getName();
				List<Usuario> users = (List<Usuario>)
				pm1.newQuery(query1).execute();
				
				// pass the list to the jsp
				request.setAttribute("users", users);
				// forward the request to the jsp
				RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher("/WEB-INF/Views/Usuario/index.jsp");
				dispatcher.forward(request, response);
					
	}

}
