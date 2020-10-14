

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/Add_Cart")
public class Add_Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Add_Cart() {
        super();
        // TODO Auto-generated constructor stub
    }



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("id"));
		String product_name=request.getParameter("name");
		String product_price=request.getParameter("price");
		String product_category=request.getParameter("category");
		String brand_path=request.getParameter("path");
		ArrayList<Integer> li=new ArrayList<Integer>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
			PreparedStatement ps=con.prepareStatement("select id from cart");
			ResultSet rs=ps.executeQuery();
			if(rs.next()) 
			{
				do {
					li.add(rs.getInt(1));
				}while(rs.next());
			}
			else
			{
				out.print("<center><h2>Failed To Add Cart</h2></center>");
				request.getRequestDispatcher("Store_Home.jsp").include(request, response);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		if(!li.contains(id))
		{
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
				PreparedStatement ps=con.prepareStatement("insert into cart values(?,?,?,?,?)");
				ps.setInt(1, id);
				ps.setString(2, product_name);
				ps.setString(3, product_price);
				ps.setString(4, product_category);
				ps.setString(5, brand_path);
				int x=0;
				x=ps.executeUpdate();
				if(x!=0) 
				{
					response.sendRedirect("Store_Home.jsp");
				}
				else
				{
					out.print("<center><h2>Failed To Add Cart</h2></center>");
					request.getRequestDispatcher("Store_Home.jsp").include(request, response);
				}
				con.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
			else
			{
				out.print("<div class='text-center text-primary'><b>Can't add same product twice to cart.</b></div>");
				request.getRequestDispatcher("Store_Home.jsp").include(request, response);
			}
		
		
	}

}
