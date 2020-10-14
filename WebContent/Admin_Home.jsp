<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"> 
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <title>Ecommerce Website</title>
</head>
<body>
    <br>
    <div class="container-fluid">
   			 <%
   			response.setHeader("Cache-Control", "no-cache,no-store, must-revalidate");
   			response.setHeader("Pragma", "no-cache");
   			response.setHeader("Expires", "0");
   			
        	String name=(String)session.getAttribute("admin");
   			 if(session.getAttribute("admin")==null)
   			 {
   				 response.sendRedirect("Admin_Login.jsp");
   			 }
   			 else{
   				%><h1 class="text-center">Logged In => <span class="text-success text-uppercase"><b><%=name %></b></span></h1><%
   			 }
   			 %>
        	
        <div class="d-flex justify-content-center ">
        	
            <div><a href="Fetch_Users.jsp" class="btn btn-warning m-5">Fetch Users List</a></div><div class="m-5"><a href="admin_add_product.jsp"><i class="fa fa-plus-circle fa-2x"></i></a></div><div><a href="admin_logout" class="btn btn-danger m-5">Log out</a></div>
        </div>
    </div>
    <div><h2 class="text-center text-primary"><u>Products List</u></h2></div>
            <div class="d-flex flex-wrap m-2 justify-content-center">
              <% 
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
		PreparedStatement ps=con.prepareStatement("select * from all_products");
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			do
			{
				%>
				<div class="card text-center m-3" style="width: 18rem;">
                    <img class="card-img-top" src=<%=rs.getString(5)%> style="height:18rem">
                    <div class="card-body">
                      <h5 class="card-title"><%=rs.getString(2) %></h5>
                      <p class="card-text">$<%=rs.getString(3) %></p>
                      <div class="d-flex" >
                        <a href="Edit_Products.jsp?id=<%=rs.getInt(1)%>&name=<%=rs.getString(2)%>&price=<%=rs.getString(3)%>&category=<%=rs.getString(4)%>&path=<%=rs.getString(5)%>" class="btn btn-warning m-auto">Edit</a>
                        <a href="delete_product?id=<%=rs.getInt(1) %>" class="btn btn-danger m-auto">Remove</a>
                      </div>
                    </div>
                  </div>
				
				<%
			}while(rs.next());
		}
		
		con.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
  	
  %>
               
                </div>
         


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</body>
</html>