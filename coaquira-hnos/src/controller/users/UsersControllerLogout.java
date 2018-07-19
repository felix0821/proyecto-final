package controller.users;
import java.io.IOException;
import java.util.Date;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import controller.PMF;
import model.entity.Lista;
@SuppressWarnings("serial")
public class UsersControllerLogout extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		PersistenceManager pm= PMF.get().getPersistenceManager();

		UserService us = UserServiceFactory.getUserService();
		User user=us.getCurrentUser();
		Date dato=new Date();

		if(user==null){
			resp.sendRedirect(us.createLoginURL(us.createLogoutURL("index.html")));
		}else{
			Lista a = new Lista(user.getEmail(),req.getRemoteAddr(),dato);
			try {
				pm.makePersistent(a);
				} finally {
				pm.close();
				}

			resp.sendRedirect(us.createLoginURL(us.createLogoutURL("index.html")));
		}
	}

}