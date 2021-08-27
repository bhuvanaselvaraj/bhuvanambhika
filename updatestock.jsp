<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String stock,mname;
%>
<h1 class="page-header"><small>Update Stock</small></h1>
<%
    if(request.getParameter("submit1")==null) {
         ps1 = conn.prepareStatement("select mname from pymedicine");
         rs1 = ps1.executeQuery();
%>
<form name="f" action="updatestock.jsp" method="post">
            <table class="center_tab">
                <thead>
                    <tr>
                        <th colspan="2">UPDATE STOCK</th>
                    </tr>
                </thead>
                <tbody>
                     <tr>
                        <th>Select Medicine</th>
                        <td>
                             <select name="mname">
                                  <%
                                   while(rs1.next()) {
                                        out.print("<option value='"+rs1.getString(1)+"'>"+rs1.getString(1)+"</option>");
                                   }
                                   ps1.close();
                                  %>  
                             </select>
                        </td>   
                    </tr>
                    <tr>
                        <th>Medicine Qty</th>
                        <td><input type="text" name="stock" required pattern="\d+"></td>   
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2" class="center">
                            <input type="submit" name="submit1" value="Add to Stock">
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
<%
        
    } else {    
    mname = request.getParameter("mname");
    stock = request.getParameter("stock");
    try {
    ps1 = conn.prepareStatement("update pymedicine set stock=stock+? where mname=?");
    ps1.setString(1, stock);
    ps1.setString(2, mname);
    ps1.executeUpdate();
    ps1.close();
    out.print("<div class='center'>Medicine Stock Updated Successfully...!<br><a href='updatestock.jsp'>Back</a></div>");
    } catch(Exception e) {
         out.print("<div class='center'>"+e.getMessage()+"<br><a href='updatestock.jsp'>Back</a></div>");
    }
    
    }
    conn.close();
%><%@include file="footer.jsp" %>