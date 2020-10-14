

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

@WebServlet("/delete_product")
public class delete_product extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public delete_product() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("id"));
		String del_image;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
			PreparedStatement ps=con.prepareStatement("select brand_path from all_products where id=? ");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				del_image=rs.getString(1);
				File file=new File(del_image);
				file.delete();
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
			PreparedStatement ps=con.prepareStatement("delete from all_products where id=? ");
			ps.setInt(1, id);
			int x=0;
			x=ps.executeUpdate();
			if(x!=0)
			{	
				response.sendRedirect("Admin_Home.jsp");
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
