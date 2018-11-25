<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<title>Your Shopping Cart</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<style>
button {
	float: center;
	padding: 6px 10px;
	margin-top: 4px;
	margin-bottom: 5px;
	margin-right: 14px;
	background: #FFFACD;
	font-size: 17px;
	border: none;
	cursor: pointer;
}
</style>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" />
	</div>
<%
// Get the current list of products
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

if (productList == null)
{	out.println("<H1>Your shopping cart is empty!</H1>");
	productList = new HashMap<String, ArrayList<Object>>();
}
else
{
	NumberFormat currFormat = NumberFormat.getCurrencyInstance();

	out.println("<h1>Your Shopping Cart</h1>");
	out.print("<font face=\"Century Gothic\" size=\"2\"><table class=\"table\" border=\"1\"><tr><th class=\"col-md-1\"></th><th>Auction Id</th><th>Book Title</th><th>Quantity</th>");
	out.println("<th>Price</th><th>Tax</th><th>Subtotal</th></tr>");

	double total =0;
	double tax = 0;
	
	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
		
	while (iterator.hasNext()) 
	{	Map.Entry<String, ArrayList<Object>> entry = iterator.next();
		ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
		out.print("<tr><td>"+product.get(0)+"</td>");
		out.print("<td>"+product.get(1)+"</td>");

		out.print("<td align=\"center\">"+product.get(3)+"</td>");
		
		double pr = Double.parseDouble( (String) product.get(2));
		int qty = ( (Integer)product.get(3)).intValue();

		out.print("<td align=\"right\">"+currFormat.format(pr)+"</td>");
		out.print("<td align=\"right\">"+currFormat.format(pr*qty*tax)+"</td></tr>");
		out.print("<td align=\"right\">"+currFormat.format(pr*qty*(1+tax))+"</td></tr>");
		out.println("</tr>");
		total = total +pr*qty*(1+tax);
	}
	out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>"
			+"<td align=\"right\">"+currFormat.format(total)+"</td></tr>");
	out.println("</table>");
	out.println("<h2><a href=\"CheckoutUserID.jsp\">Check Out</a></h2>");
}
%>

<h2><a href="listAuctions.jsp">Continue Shopping</a></h2>

</body>
</html> 

