package controller.users;
import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


import controller.PMF;
import model.entity.User;
@SuppressWarnings("serial")
public class UsersControllerLogin2 extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		try{
			final Query q = pm.newQuery(User.class);
			try{
		UserService us = UserServiceFactory.getUserService();
		com.google.appengine.api.users.User user = us.getCurrentUser();
		String query= "select from "+User.class.getName()+" where email=='"+user.getEmail()+"'"+" && status==true";
		List<User>cSearch=(List<User>)pm.newQuery(query).execute();
		 req.setAttribute("user", user);
		 req.setAttribute("users", cSearch);
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/Views/Login/index.jsp");
			rd.forward(req, resp);
			}catch(Exception e){
				resp.setContentType("text/plain");
				resp.sendRedirect("http://coaquira-hnos.appspot.com/");
		    	System.out.println(e);
			}finally{
				q.closeAll();
			}
		 /*if(user == null){
			 resp.sendRedirect(us.createLoginURL("/user/login"  req.getRequestURI()));*/
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pm.close();}
	}

}
