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
public class MaterialsControllerEdit extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException{
			PersistenceManager pm= PMF.get().getPersistenceManager();
			String id=request.getParameter("id");
			String dato=request.getParameter("name");
			if(dato!=null){
		Material m =pm.getObjectById(Material.class,Long.parseLong(id));
		String dato1=request.getParameter("cost");
		String dato2=request.getParameter("fecha");
		String dato3=request.getParameter("quantity");
		m.setName(dato);
		m.setCost(dato1);
		m.setDate(dato2);
		m.setQuantity(dato3);
		response.sendRedirect("/materials");
	}
	else{
        Material m=pm.getObjectById(Material.class,Long.parseLong(id));
		request.setAttribute("material", m);
		RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/WEB-INF/Views/Materials/edit.jsp");
		try{
			dispatcher.forward(request, response);
		}catch(ServletException e){
			e.printStackTrace();
		}
	}
	}
}

