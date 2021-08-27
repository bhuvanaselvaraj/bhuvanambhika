<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String mtype,mname,mbrand,mprice;
%>
<h1 class="page-header"><small>Sales</small></h1>
<%
if(request.getParameter("rn")!=null) {
            ps1 = conn.prepareStatement("delete from pyuploads where ctime=?");
            ps1.setString(1, request.getParameter("rn"));
            ps1.executeUpdate();
        }
    ps1 = conn.prepareStatement("select * from pysales");
    rs1 = ps1.executeQuery();    
    out.print("<table class='report_tab' style='min-width:600px;'><thead><tr><th colspan='4'>MEDICINE SALES</th><tr><th>Date<th>UserId<th>Medicine Name<th>Qty</tr></thead><tbody>");
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