package controller.materials;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controllers.PMF;
import model.entity.Material;

@SuppressWarnings("serial")
public class MaterialsControllerAdd extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException{
		PersistenceManager pm= PMF.get().getPersistenceManager();
		String dato=request.getParameter("name");
		if(dato!=null){
		Double dato1=Double.parseDouble(request.getParameter("cost"));
		String dato2=request.getParameter("fecha");
		int dato3=Integer.parseInt(request.getParameter("quantity"));
		Material a = new Material(
				dato,
				dato1,
				dato2,
				dato3
				);
				// persist the entity
				try {
				pm.makePersistent(a);
				} finally {
				pm.close();
				}
				response.sendRedirect("/materials");
		}
		else{
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/WEB-INF/Views/Materials/add.jsp");
			try{
				dispatcher.forward(request, response);
			}catch(ServletException e){
				e.printStackTrace();
			}

		}
	}

}
