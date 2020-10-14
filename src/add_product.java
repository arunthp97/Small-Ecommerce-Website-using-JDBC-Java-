

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig(maxFileSize=32123123)
@WebServlet("/add_product")
public class add_product extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public add_product() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,FileNotFoundException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String product_name=request.getParameter("product_name");
		String product_price=request.getParameter("product_price");
		String product_category=request.getParameter("product_category");
		Part file_path=request.getPart("file_path");
		
		
		int id=0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
			PreparedStatement ps=con.prepareStatement("select max(id) from all_products");
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
		try
		{
			InputStream in=file_path.getInputStream();
			BufferedInputStream bis=new BufferedInputStream(in);
			FileOutputStream fos=new FileOutputStream("C://Users/Arun/eclipse-workspace/Ecommerce/WebContent/Website_images/image_"+id+".jpg");
			BufferedOutputStream bos=new BufferedOutputStream(fos);
			int ss=0;
			while((ss=bis.read())!=-1)
			{
				bos.write(ss);
			}
			bos.close();
			fos.close();
		}
	catch(Exception e) {
		e.printStackTrace();
	}
		String file_paths="C://Users/Arun/eclipse-workspace/Ecommerce/WebContent/Website_images/image_"+id+".jpg";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
			PreparedStatement ps=con.prepareStatement("insert into all_products values(?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, product_name);
			ps.setString(3, product_price);
			ps.setString(4, product_category);
			ps.setString(5, file_paths);
			int x=0;
			x=ps.executeUpdate();
			if(x!=0) 
			{
				response.sendRedirect("Admin_Home.jsp");
			}
			else
			{
				out.print("<center><h2>Failed To Add Product</h2></center>");
				request.getRequestDispatcher("admin_add_product.jsp").include(request, response);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
