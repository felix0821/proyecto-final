package controller.materials.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import controllers.PMF;
import model.entity.Material;
import model.entity.MaterialController;
import model.entity.Access;
import model.entity.Resource;
import model.entity.User;

@SuppressWarnings("serial")
public class ControllerMaterialsControllerIndex extends HttpServlet {
	
	public void doGet(HttpServletRequest req,HttpServletResponse resp)throws IOException,ServletException{
		
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
						
						
						
								String queryM = "select from " + MaterialController.class.getName();
								Date dia=new Date();
								@SuppressWarnings("unchecked")
								List<MaterialController> materialsC = (List<MaterialController>)pm.newQuery(queryM).execute();
								try{
								for(int i=0;i<materialsC.size();i++){
							        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
							        String dateInString =materialsC.get(i).getFechaEntrada();
                                    
							        try {

							            Date date = formatter.parse(dateInString);
							            System.out.println(date);
							            System.out.println(formatter.format(date));
							            if(date.compareTo(dia)<0){
							            	materialsC.get(i).setStatus(false);
							            }else materialsC.get(i).setStatus(true);

							        } catch (java.text.ParseException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
									
								}
								
								
								// pass the list to the jsp
								req.setAttribute("fecha", dia);
								req.setAttribute("materialsC", materialsC);
								// forward the request to the jsp
								RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/MaterialsController/index.jsp");
								dispatcher.forward(req, resp);
								
								}catch(Exception e){
									System.out.println(e);
									resp.getWriter().println("Ocurrió un error, vuelva a intentarlo.");
									resp.sendRedirect("/MaterialsController");
								}
								
								
								
					}}}}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pm.close();}
	}

}
