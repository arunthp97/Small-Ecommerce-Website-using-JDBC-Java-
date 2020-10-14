<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"> 
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <title>Ecommerce Website</title>
  </head>
  <body>
    <div class="container-fluid">
    <%
    int cart_count=0;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
		PreparedStatement ps=con.prepareStatement("select count(id) from cart");
		ResultSet rs=ps.executeQuery();
		if(rs.next()) 
		{
			cart_count=rs.getInt(1);
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
    %>
      <section>
    <nav class="navbar navbar-expand-md navbar-dark bg-blue-100" style="background-color: gray;">
        <div class="container-fluid text-center">
          <a class="navbar-brand" href="Store_Home.jsp" style="font-weight: bolder;">Ecommerce</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="Store_Home.jsp">Home</a>
              </li>
              <li class="nav-item">
              <%
              	response.setHeader("Cache-Control", "no-cache,no-store, must-revalidate");
     			response.setHeader("Pragma", "no-cache");
     			response.setHeader("Expires", "0");
     			 String user=(String)session.getAttribute("user");
     			 if(session.getAttribute("user")==null)
     			 {
     				 %>
     				 <a class="nav-link" href="#" data-toggle="modal" data-target="#staticBackdrop">Login/Signup</a>
     			  </li>    
              <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#staticBackdrop" tabindex="-1" aria-disabled="true"><i class="fa fa-shopping-cart"></i>(<%=cart_count %>)</a>
              </li>
     			 <%}
     			 else{%>
     				 <a class="nav-link disabled" href="#"><%=user %></a>
     				 </li>
          
          
              <li class="nav-item">
                <a class="nav-link" href="Cart.jsp" tabindex="-1" aria-disabled="true"><i class="fa fa-shopping-cart"></i>(<%=cart_count %>)</a>
              </li>
                <li class="nav-item">
                <a class="nav-link btn btn-danger" aria-current="page" href="user_logout">Log_Out</a>
              </li>
     		<% }
              %>
            </ul>
            <form class="d-flex" action="Search.jsp" method="get">
              <input class="form-control mr-2" type="search" name="name" placeholder="Search" aria-label="Search">
              <button class="btn btn-success" type="submit">Search</button>
            </form>
          </div>
        </div>
      </nav>
      <!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title mx-auto" id="staticBackdropLabelr">Login</h3>
        <button type="button" class="btn btn-dark" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="user_login" method="get">
          <div class="form-group">
            <label><i class="fa fa-user "></i> UserName :- </label>
            <input type="text" name="username" class="form-control" required>
          </div>
          <div class="form-group">
            <label><i class="fa fa-lock "></i> Password :- </label>
            <input type="password" name="password" class="form-control" required>
          </div>
          
          <div class="form-group">
            <input type="submit" value="Sign_In" class="form-control btn-success">
          </div>
      </form>
      </div>
      <div class="modal-footer justify-content-center">
        <div>New User ? <a href="User_Registration.jsp" class="btn btn-primary">Click Here</a></div>
      </div>
    </div>
  </div>
</div>
    </section>
   
   
<hr>
    <section>
     
           <ul class="nav-tabs nav nav-justified">
               <li class="nav-item">
                   <a href="#home1" class="nav-link active" data-toggle="tab">All products</a>
               </li>
               <li class="nav-item">
                <a href="#home2" class="nav-link" data-toggle="tab">Smartphones</a>
            </li>
            <li class="nav-item">
                <a href="#home3" class="nav-link" data-toggle="tab">Clothes</a>
            </li>
            <li class="nav-item">
                <a href="#home4" class="nav-link" data-toggle="tab">Tv's</a>
            </li>
           </ul>

           <div class="tab-content">
               <div class="tab-pane active" id="home1">
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
				<div class="card text-center m-3" style="width: 15rem;">
                        <img class="card-img-top" src="<%=rs.getString(5) %>" style="width:15rem;">
                        <div class="card-body">
                          <h5 class="card-title"><%=rs.getString(2)%></h5>
                          <p class="card-text">$<%=rs.getString(3)%></p>
                          <a href="Add_Cart?id=<%=rs.getInt(1)%>&name=<%=rs.getString(2)%>&price=<%=rs.getString(3)%>&category=<%=rs.getString(4)%>&path=<%=rs.getString(5)%>"  class="btn btn-primary">Add To Cart</a>
                        </div>
                 </div>
				
				<%
			}while(rs.next());
		}
		else{
			%><br><div>Sorry, No Smartphone Products Available Right Now.</div> <%
		}
		con.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
  	
  %>
                    
                </div>
                
              
               </div>
               <div class="tab-pane" id="home2">
                       <div class="d-flex flex-wrap m-2 justify-content-center">
                          <% 
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
		PreparedStatement ps=con.prepareStatement("select * from all_products where brand_category='smartphones'");
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			do
			{
				%> 
				<div class="card text-center m-3" style="width: 15rem;">
                        <img class="card-img-top" src="<%=rs.getString(5) %>" style="width:15rem;">
                        <div class="card-body">
                          <h5 class="card-title"><%=rs.getString(2)%></h5>
                          <p class="card-text">$<%=rs.getString(3)%></p>
                          <a href="Add_Cart?id=<%=rs.getInt(1)%>&name=<%=rs.getString(2)%>&price=<%=rs.getString(3)%>&category=<%=rs.getString(4)%>&path=<%=rs.getString(5)%>"  class="btn btn-primary">Add To Cart</a>
                        </div>
                 </div>
				
				<%
			}while(rs.next());
		}
		else{
			%><br><div>Sorry, No Smartphone Products Available Right Now.</div> <%
		}
		con.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
  	
  %>
                    
                </div>
            </div>
            <div class="tab-pane" id="home3">
                 <div class="d-flex flex-wrap m-2 justify-content-center">
                          <% 
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
		PreparedStatement ps=con.prepareStatement("select * from all_products where brand_category='clothes'");
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			do
			{
				%> 
				<div class="card text-center m-3" style="width: 15rem;">
                        <img class="card-img-top" src="<%=rs.getString(5) %>" style="width:15rem;">
                        <div class="card-body">
                          <h5 class="card-title"><%=rs.getString(2)%></h5>
                          <p class="card-text">$<%=rs.getString(3)%></p>
                          <a href="Add_Cart?id=<%=rs.getInt(1)%>&name=<%=rs.getString(2)%>&price=<%=rs.getString(3)%>&category=<%=rs.getString(4)%>&path=<%=rs.getString(5)%>"  class="btn btn-primary">Add To Cart</a>
                        </div>
                 </div>
				
				<%
			}while(rs.next());
		}
		else{
			%><br><div>Sorry, No Clothes Products Available Right Now.</div> <%
		}
		con.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
  	
  %>
                    
                </div>
            </div>
            <div class="tab-pane" id="home4">
                <div class="d-flex flex-wrap m-2 justify-content-center">
                          <% 
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/store","root","12345");
		PreparedStatement ps=con.prepareStatement("select * from all_products where brand_category='tv'");
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			do
			{
				%> 
				<div class="card text-center m-3" style="width: 15rem;">
                        <img class="card-img-top" src="<%=rs.getString(5) %>" style="width:15rem;">
                        <div class="card-body">
                          <h5 class="card-title"><%=rs.getString(2)%></h5>
                          <p class="card-text">$<%=rs.getString(3)%></p>
                          <a href="Add_Cart?id=<%=rs.getInt(1)%>&name=<%=rs.getString(2)%>&price=<%=rs.getString(3)%>&category=<%=rs.getString(4)%>&path=<%=rs.getString(5)%>"  class="btn btn-primary">Add To Cart</a>
                        </div>
                 </div>
				
				<%
			}while(rs.next());
		}
		else{
			%><br>
			<div>Sorry, No TV's Products Available Right Now.</div> <%
		}
		con.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
  	
  %>
                    
                </div>
            </div>
           </div>
    </section>
    </div>
   

     
      
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
      </body>
    </html> </body>
</html>