package controller.usuario;
import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import controllers.PMF;
import model.entity.Access;
import model.entity.Resource;
import model.entity.User;
import model.entity.Usuario;

@SuppressWarnings("serial")
public class UsuarioControllerIndex extends HttpServlet{
	
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req,HttpServletResponse resp)throws IOException, ServletException{

		final PersistenceManager pm = PMF.get().getPersistenceManager();
		try{
		UserService us = UserServiceFactory.getUserService();
		com.google.appengine.api.users.User count = us.getCurrentUser();
		if(count==null){
			RequestDispatcher dp= req.getRequestDispatcher("/WEB-INF/Views/Error/error1.jsp");
			dp.forward(req, resp);
		}else{
			String query= "select from "+User.class.getName()+" where email=='"+count.getEmail()
			+"'"+" && status==true";
			List<User>cSearch=(List<User>)pm.newQuery(query).execute();
			if(cSearch.isEmpty()){
				RequestDispatcher dp= req.getRequestDispatcher("/WEB-INF/Views/Error/error2.jsp");
				dp.forward(req, resp);
			}else{
				System.out.println(req.getServletPath());
				String query2="select from "+Resource.class.getName()+" where name=='"+req.getServletPath()+
				"'"+" && status==true";
				List<Resource>rSearch=(List<Resource>)pm.newQuery(query2).execute();
				if(rSearch.isEmpty()){
					RequestDispatcher dp= req.getRequestDispatcher("/WEB-INF/Views/Error/error3.jsp");
					dp.forward(req, resp);
				}else{
					String query3="select from "+Access.class.getName()+
					" where role=="+cSearch.get(0).getRole()+
					" && resource=="+Long.parseLong(rSearch.get(0).getId())+
				    " && status==true";
					List<Access>aSearch=(List<Access>)pm.newQuery(query3).execute();
					if(aSearch.isEmpty()){
						RequestDispatcher dp= req.getRequestDispatcher("/WEB-INF/Views/Error/error4.jsp");
						dp.forward(req, resp);
					}else{

		
		
				String query1 = "select from " +
				Usuario.class.getName();
				List<Usuario> users = (List<Usuario>)
				pm.newQuery(query1).execute();
				
				// pass the list to the jsp
				req.setAttribute("users", users);
				// forward the request to the jsp
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Usuario/index.jsp");
				dispatcher.forward(req, resp);
					
				
				
					}}}}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pm.close();}
	}

}
