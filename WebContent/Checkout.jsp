<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
    <br>
    <div class="container">
    <%
    try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
	PreparedStatement ps=con.prepareStatement("truncate table cart");
	int x=0;
	x=ps.executeUpdate();
	con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
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
   			
    <%
try {
	String users=(String)session.getAttribute("user");
	String first_name="";
	String address="";
	String username="";
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
	PreparedStatement ps=con.prepareStatement("select * from user where username=?");
	ps.setString(1, users);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{	
		first_name=rs.getString(1);
		username=rs.getString(3);
		address=rs.getString(8);
	}
	%><h3 class="text-center text-primary ">Thank you <span class="text-success"><%=first_name%></span> for shopping with us. We received your order and it will be delivered to <span class="text-success"><%=address%></span> with in 4-5 working days.</h3>
    <h2 class="text-center text-primary">Confirmaton mail will be sent shortly to <span class="text-success"><%=username%></span>.</h2>
	<%
	con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
    
        <a href="Store_Home.jsp" class="btn btn-warning m-2" style="width: 100%;">Continue Shopping</a>
</div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
 
</body>
</html>