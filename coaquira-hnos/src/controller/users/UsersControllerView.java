package controller.users;

import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
import model.entity.Access;
import model.entity.Resource;
import model.entity.Role;
import model.entity.User;

	@SuppressWarnings("serial")
	public class UsersControllerView extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			
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
									//Ejecucion de la pagina
									final Query q = pm.newQuery(User.class);
									final Query r = pm.newQuery(Role.class);
									try{
									List<Role> roles = (List<Role>) r.execute();
				                    if(req.getParameter("editar")!=null){
				                    	resp.setContentType("text/plain");
				                    	//Verificamos que el correo sea unico
				                    	RequestDispatcher rd = req.getRequestDispatcher("/users/edit");
			                        	rd.forward(req, resp);
										
				                    }else{
										resp.setContentType("text/plain");
			                        	req.setAttribute("users", cSearch);
			                        	req.setAttribute("roles", roles);
			                        	RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/Views/Users/view.jsp");
			                        	rd.forward(req, resp);}
				                    
								}catch(Exception e){
									resp.setContentType("text/plain");
									RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/Views/Error/errorEdit.jsp");
									rd.forward(req, resp);
							    	System.out.println(e);
								}finally{
									q.closeAll();
									r.closeAll();
								}
				                //fin de la ejecucion
				}}}}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					pm.close();}
						
		}
		
		public String fecha(){
			String date;
			Calendar calendario = Calendar.getInstance();
			calendario = new GregorianCalendar();
			int hora, minutos, segundos, mes, dia, a�o;
		    hora =calendario.get(Calendar.HOUR_OF_DAY);
		    minutos = calendario.get(Calendar.MINUTE);
		    segundos = calendario.get(Calendar.SECOND);
		    mes=calendario.get(Calendar.MONTH)+1;
		    a�o=calendario.get(Calendar.YEAR);
		    dia=calendario.get(Calendar.DAY_OF_MONTH);
		    date = hora + ":" + minutos + ":" + segundos+"-"+dia+"/"+mes+"/"+a�o;
		    return date;
		}
	}

	