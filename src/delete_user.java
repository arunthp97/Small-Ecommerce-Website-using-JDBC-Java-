

import java.io.File;
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


@WebServlet("/delete_user")
public class delete_user extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public delete_user() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("id"));
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
			PreparedStatement ps=con.prepareStatement("delete from user where id=? ");
			ps.setInt(1, id);
			int x=0;
			x=ps.executeUpdate();
			if(x!=0)
			{	
				response.sendRedirect("Fetch_Users.jsp");
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}




}
