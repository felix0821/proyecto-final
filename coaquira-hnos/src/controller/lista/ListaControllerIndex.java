package controller.lista;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.PMF;
import model.entity.Lista;
import model.entity.Material;

@SuppressWarnings("serial")
public class ListaControllerIndex extends HttpServlet {
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		
			PersistenceManager pm1=PMF.get().getPersistenceManager();
			

								String query1 = "select from " +
								Lista.class.getName();
								@SuppressWarnings("unchecked")
								List<Lista> lista = (List<Lista>)
								pm1.newQuery(query1).execute();
								
								// pass the list to the jsp
								request.setAttribute("lista", lista);
								// forward the request to the jsp
								RequestDispatcher dispatcher =
								getServletContext().getRequestDispatcher("/WEB-INF/Views/Lista/index.jsp");
								dispatcher.forward(request, response);
			
	}

}