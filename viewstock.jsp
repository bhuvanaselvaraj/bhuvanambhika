<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String mtype,mname,mbrand,mprice;
%>
<h1 class="page-header"><small>Medicine Stock</small></h1>
<%
    ps1 = conn.prepareStatement("select mtype,mname,mbrand,stock from pymedicine order by mtype");
    rs1 = ps1.executeQuery();    
    out.print("<table class='report_tab' style='min-width:600px;'><thead><tr><th colspan='4'>MEDICINE STOCK</th><tr><th>Type<th>Name<th>Brand<th>Stock</tr></thead><tbody>");
        while(rs1.next()) {
            out.print("<tr>");
            out.print("<td>"+rs1.getString(1));
            out.print("<td>"+rs1.getString(2));
            out.print("<td>"+rs1.getString(3));
            out.print("<td>"+rs1.getString(4));            
        }
    ps1.close();
    out.print("</tbody></table>");
    conn.close();
%><%@include file="footer.jsp" %>