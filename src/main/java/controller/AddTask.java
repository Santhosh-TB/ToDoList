package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.Dto;
import dto.TaskDto;

@WebServlet("/addtask")
public class AddTask extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		Dto user = (Dto)req.getSession().getAttribute("Dto");
		int userid = user.getUserid();
		
		Dao dao = new Dao();
		
		if(!req.getParameter("button").equals("cancel"))
		{
		
		int taskid = 1;
		try 
		{
			taskid += Dao.setTaskId();
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}
		String tasktitle = req.getParameter("tasktitle");
		String taskdescription = req.getParameter("taskdescription");
		String taskpriority = req.getParameter("taskpriority");
		String taskduedate = req.getParameter("taskduedate");
		
		
		TaskDto task = new TaskDto (taskid, tasktitle, taskdescription, taskpriority, taskduedate, "Pending", userid);
		
		
		try                                                     // can't use throws becoz servlets can't handle sql exception
		{
			int res = dao.createTask(task);
		if(res>0)
		{
			HttpSession ses = req.getSession();
			Dto u = (Dto)ses.getAttribute("Dto");
			
			req.setAttribute("tasks", dao.getAllTasksByUserId(u.getUserid()));
			
			req.getRequestDispatcher("home.jsp").include(req, resp);
		}
		else
		{
			resp.getWriter().println("Failed");
		}
		
		}
		
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}
		
	}
		else
		{
			try 
            {
				req.setAttribute("tasks", dao.getAllTasksByUserId(userid));
			} 
            catch (ClassNotFoundException | SQLException e) 
            {
				e.printStackTrace();
			}
			
			req.getRequestDispatcher("home.jsp").include(req, resp);
		}
				
	}

}
