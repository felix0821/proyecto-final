package controller.usuario;
import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.UserServiceFactory;

import controllers.PMF;
import model.entity.Access;
import model.entity.Resource;
import model.entity.User;
import model.entity.Usuario;

@SuppressWarnings("serial")
public class UsuarioControllerAdd extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException{
		PersistenceManager pm= PMF.get().getPersistenceManager();
		int entrada=0;
		String dato=request.getParameter("name");
		if(dato!=null){
		int dato1=Integer.parseInt(request.getParameter("dni"));
		String dato2=request.getParameter("apellido");
		String dato3=request.getParameter("email");
		String query1= "select from "+Usuario.class.getName();
		List<Usuario>users=(List<Usuario>)pm.newQuery(query1).execute();
		for(int i=0;i<users.size();i++){
			if(users.get(i).getDni()==dato1){
				entrada=1;
				String men="Ha ingresado un dni repetido,porfavor vuelve a llenar!";
				request.setAttribute("men", men);
				RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/WEB-INF/Views/Usuario/add.jsp");
				try{
					dispatcher.forward(request, response);
				}catch(ServletException e){
					e.printStackTrace();
				}
				break;
			}
		}
		if(entrada==0){
		Usuario a = new Usuario(
				dato,
				dato2,
				dato1,
				dato3
				);
				// persist the entity
				try {
				pm.makePersistent(a);
				} finally {
				pm.close();
				}
				response.sendRedirect("/usuario");
		}
		}
		else{
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/WEB-INF/Views/Usuario/add.jsp");
			try{
				dispatcher.forward(request, response);
			}catch(ServletException e){
				e.printStackTrace();
			}
		}
	}
				
}
