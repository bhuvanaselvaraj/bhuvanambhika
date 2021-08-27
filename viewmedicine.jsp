<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String mtype,mname,mbrand,mprice;
%>
<h1 class="page-header"><small>Medicine List</small></h1>
<%
if(request.getParameter("rn")!=null) {
            ps1 = conn.prepareStatement("delete from pymedicine where mname=?");
            ps1.setString(1, request.getParameter("rn"));
            ps1.executeUpdate();
        }
    ps1 = conn.prepareStatement("select * from pymedicine order by mtype");
    rs1 = ps1.executeQuery();    
    out.print("<table class='report_tab' style='min-width:600px;'><thead><tr><th colspan='5'>MEDICINES</th><tr><th>Type<th>Name<th>Brand<th>Price<th>Task</tr></thead><tbody>");
        while(rs1.next()) {
            out.print("<tr>");
            out.print("<td>"+rs1.getString(1));
            out.print("<td>"+rs1.getString(2));
            out.print("<td>"+rs1.getString(3));
            out.print("<td>"+rs1.getString(4));
            out.print("<td><a href='viewmedicine.jsp?rn="+rs1.getString(2)+"' onclick=\"javascript:return confirm('Are You Sure to Delete ?')\">Delete</a>");
        }
    ps1.close();
    out.print("</tbody></table>");
    conn.close();
%><%@include file="footer.jsp" %>