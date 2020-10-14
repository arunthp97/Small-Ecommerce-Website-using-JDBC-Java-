<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"> 
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <title>Ecommerce Website</title>
</head>
<body>
    <div class="container">
        <%
   			response.setHeader("Cache-Control", "no-cache,no-store, must-revalidate");
   			response.setHeader("Pragma", "no-cache");
   			response.setHeader("Expires", "0");
   			
        	String name=(String)session.getAttribute("user");
   			 if(session.getAttribute("user")==null)
   			 {
   				 response.sendRedirect("Store_Home.jsp");
   			 }
   			 %>
        <h1 class="text-info text-center"><u> Cart</u></h1>
        <div class="d-flex align-items-center text-center bg-dark text-white" style="border: 1px solid grey;" >
            <div class="flex-grow-1">Id</div>
            <div class="flex-grow-1">Product_Name</div>
            <div class="flex-grow-1">Product_Price</div>
            <div class="flex-grow-1">Product_Category</div>
            <div class="flex-grow-1">Product_Image</div>
            <div class="flex-grow-1">Option</div>
        </div>
        <% 
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
			PreparedStatement ps=con.prepareStatement("select * from cart");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				
				do{%>
					   <div class="d-flex align-items-center text-center" style="border: 1px solid grey;" >
				        <div class="flex-grow-1"><%=rs.getInt(1) %></div>
				        <div class="flex-grow-1"><%=rs.getString(2) %></div>
				        <div class="flex-grow-1">$<%=rs.getString(3)%></div>
				        <div class="flex-grow-1">$<%=rs.getString(4)%></div>
				        <div class="flex-grow-1">
				            <img src="<%=rs.getString(5) %>" class="img-thumbnail img-fluid" style="width: 200px;">
				        </div>
				        <div class="flex-grow-1"><a href="remove_cart?id=<%=rs.getInt(1) %>" class="btn btn-danger">Remove</a></div>
				    </div><% 
				}while(rs.next());
			
			}
			else{
				
			}
		
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
        %>
 
    <div class="d-flex align-items-center text-center m-4" >
    <%
    try {
    	int total_cost=0;
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
			PreparedStatement ps=con.prepareStatement("select brand_price from cart");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				do{
					total_cost=total_cost + Integer.parseInt(rs.getString(1));
				}while(rs.next());
			
			}
			
			 %><div class="flex-grow-1"><b>Order Total : </b>$ (<%=total_cost %>)</div></div><%
					 
					 if(total_cost!=0)
					 {
						 %> <div class="m-2"><a href="Checkout.jsp" class="btn btn-success" style="width: 100%;">Procceed to checkout</a></div>  <%
					 }
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
        %>
       
    
      
      <div class="m-2"><a href="Store_Home.jsp" class="btn btn-warning" style="width: 100%;">Continue Shopping</a></div>
    </div>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
 
</body>
</html>