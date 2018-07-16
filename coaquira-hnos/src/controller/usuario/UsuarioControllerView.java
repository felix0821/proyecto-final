package controller.usuario;
import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controllers.PMF;
import model.entity.Usuario;

@SuppressWarnings("serial")
public class UsuarioControllerView extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException{
		PersistenceManager pm= PMF.get().getPersistenceManager();
		String id=request.getParameter("id");
		Usuario m=pm.getObjectById(Usuario.class,Long.parseLong(id));
		request.setAttribute("user", m);
		RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/WEB-INF/Views/Usuario/view.jsp");
		try{
			dispatcher.forward(request, response);
		}catch(ServletException e){
			e.printStackTrace();
		}
	
	}

}
