<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String mtype,mname,mbrand,mprice;
%>
<h1 class="page-header"><small>Customer Orders</small></h1>
<%
if(request.getParameter("rn")!=null) {
            ps1 = conn.prepareStatement("delete from pyuploads where ctime=?");
            ps1.setString(1, request.getParameter("rn"));
            ps1.executeUpdate();
        }
    ps1 = conn.prepareStatement("select u.userid,uname,addr,city,mobile,ctime,fname from pyuploads u,pycustomer c where u.userid=c.userid");
    rs1 = ps1.executeQuery();    
    out.print("<table class='report_tab' style='min-width:600px;'><thead><tr><th colspan='7'>MEDICINE ORDERS</th><tr><th>Userid<th>Name<th>Address<th>City<th>Mobile<th>Order Date<th>Task</tr></thead><tbody>");
        while(rs1.next()) {
            out.print("<tr>");
            out.print("<td>"+rs1.getString(1));
            out.print("<td>"+rs1.getString(2));
            out.print("<td>"+rs1.getString(3));
            out.print("<td>"+rs1.getString(4));
            out.print("<td>"+rs1.getString(5));
            out.print("<td>"+rs1.getString(6));
            String nm = "uploads/"+rs1.getString(7).substring(rs1.getString(7).lastIndexOf("\\")+1);           
            out.print("<td><a href='"+nm+"' target='_blank'>View</a> | <a href='vieworders.jsp?rn="+rs1.getString(6)+"' onclick=\"javascript:return confirm('Are You Sure to Finish Order ?')\">Finished</a>");
        }
    ps1.close();
    out.print("</tbody></table>");
    conn.close();
%><%@include file="footer.jsp" %>