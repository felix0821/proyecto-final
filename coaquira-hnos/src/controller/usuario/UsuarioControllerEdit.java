package controller.usuario;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controllers.PMF;
import model.entity.Usuario;

@SuppressWarnings("serial")
public class UsuarioControllerEdit extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String id = request.getParameter("id");
		String dato1 = request.getParameter("nombre");
		if (dato1 != null) {
			Usuario m = pm.getObjectById(Usuario.class, Long.parseLong(id));
			String dato2 = request.getParameter("apellido");
			String dato3 = request.getParameter("email");
			m.setNombre(dato1);
			m.setApellido(dato2);
			m.setEmail(dato3);
			response.sendRedirect("/usuario");
		} else {
			Usuario m = pm.getObjectById(Usuario.class, Long.parseLong(id));
			request.setAttribute("user", m);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Usuario/edit.jsp");
			try {
				dispatcher.forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			}
		}
	}
}
