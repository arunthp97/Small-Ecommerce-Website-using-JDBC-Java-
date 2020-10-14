

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


@WebServlet("/add_user")
public class add_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public add_user() {
        super();
   
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String first_name=request.getParameter("first_name");
		String lastname=request.getParameter("last_name");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String zip=request.getParameter("zip");
		String address=request.getParameter("address");
		int id=0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
			PreparedStatement ps=con.prepareStatement("select max(id) from user");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				id=rs.getInt(1);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		id=id+1;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
			PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, first_name);
			ps.setString(2, lastname);
			ps.setString(3, username);
			ps.setString(4, password);
			ps.setString(5, city);
			ps.setString(6, state);
			ps.setString(7, zip);
			ps.setString(8, address);
			ps.setInt(9, id);
			int x=0;
			x=ps.executeUpdate();
			if(x!=0)
			{
				response.sendRedirect("Store_Home.jsp");
			}
			else {
				response.sendRedirect("User_Registration.jsp");
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
