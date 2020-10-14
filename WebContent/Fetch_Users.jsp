<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"> 
   
    <title>Ecommerce Website</title>
</head>
<style>
    .cust_tab{
        border: 1px solid black;
    }
</style>
<body>
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
   			 %>
        <br><h2 class="text-center"><u>REGISTERED USERS</u></h2><div class="text-center"><a href="Admin_Home.jsp" class="btn btn-success m-1">Home</a></div>
    <table class="table cust_tab text-center">
        <thead class="thead-dark">
          <tr>
          	<th scope="col">Id</th>
            <th scope="col">First_Name</th>
            <th scope="col">Last_Name</th>
            <th scope="col">User_Name</th>
            <th scope="col">CIty</th>
            <th scope="col">State</th>
            <th scope="col">Zip</th>
            <th scope="col">Address</th>
            <th scope="col">Option</th>
          </tr>
        </thead>
        <tbody>  
        <%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
	PreparedStatement ps=con.prepareStatement("select * from user");
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{	
		do{
		
		%> 	<tr>
			<td><%=rs.getInt(9) %></td>
			<td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(5) %></td>
            <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
            <td><%=rs.getString(8) %></td>
            <td><a href="delete_user?id=<%=rs.getInt(9)%>" class="btn btn-danger">Delete</a></td>
              </tr>
          	  <% }while(rs.next());
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
       
        </tbody>
      </table>
      
     </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
     
</body>
</html>