

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
import javax.servlet.http.Part;


@WebServlet("/update_product")
public class update_product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public update_product() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
	
		String product_name=request.getParameter("product_name");
		String product_price=request.getParameter("product_price");
		String product_category=request.getParameter("product_category");
		String file_path=request.getParameter("file_path");
		int id=Integer.parseInt(request.getParameter("id"));
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
			PreparedStatement ps=con.prepareStatement("update all_products set brand_name=?,brand_price=?,brand_category=?,brand_path=? where id=? ");
			ps.setString(1, product_name);
			ps.setString(2, product_price);
			ps.setString(3, product_category);
			ps.setString(4, file_path);
			ps.setInt(5, id);
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
