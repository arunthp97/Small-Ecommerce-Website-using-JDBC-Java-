<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"> 
   
<title>Ecommerce Website</title>
</head>
<style>
    .cust_bord{
        border-radius: 30px;
        border: 1px solid darkgray;
        padding: 10px;
        width: 500px;
        max-width: 100%;
        box-shadow: 10px 10px 5px darkgrey;
    }
    @media(max-width: 768px)
    {
      .cust_bord{
        width: 100%;
      }
    }
</style>
<body>
<div class="container">

<%
String id=request.getParameter("id");
String product_name=request.getParameter("name");
String product_price=request.getParameter("price");
String product_category=request.getParameter("category");
String file_path=request.getParameter("path");
%>
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
        <br>
        <form action="update_product" method="post" class="d-block bg-dark text-white cust_bord m-auto"> 
         <input type="hidden" name="id" value="<%=id%>">
		<input type="hidden" name="product_category" value="<%=product_category%>">
		<input type="hidden" name="file_path" value="<%=file_path %>">
          <div class="bg-dark text-white">
            <h2 class="text-center text-decoration-underline">Edit Product Details</h2>
          </div>
            <div class="form-group col-ml-12">
              <label>Product Name</label>
              <input type="text" name="product_name" value="<%=product_name %>" class="form-control" required>
            </div>
            <div class="form-group col-ml-12">
                <label>Product Price</label>
                <input type="text" name="product_price" value="<%=product_price %>" class="form-control" required>
              </div>
            <div class="form-group text-center mt-2">
              <input type="submit" value="Update Product" class="btn btn-primary">
            </div>
        </form>
        <br>
     
        
    </div>
    
    
    
     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    
</body>
</html>