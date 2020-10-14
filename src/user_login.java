

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user_login")
public class user_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public user_login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		HttpSession session=request.getSession();
		int idss=0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
			PreparedStatement ps=con.prepareStatement("select username,password from user where username=? and password=?");
			ps.setString(1, username);
			ps.setString(2, password);	
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				
				if(username.equals(rs.getString(1)) && password.equals(rs.getString(2)))
				{
			
					response.sendRedirect("Store_Home.jsp");
					session.setAttribute("user",username);
					
					
				}
				else
				{	
					out.print("<center><h2>Failed To Sign In.Please check all the details and try again.</h2></center>");
					request.getRequestDispatcher("Admin_Login.jsp").include(request, response);
				}
			
			}
			else
			{
				out.print("<center><h2>Failed To Sign In.Please check all the details and try again.</h2></center>");
				request.getRequestDispatcher("Store_Home.jsp").include(request, response);
			}
		
		
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}



}
