<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps1=null,ps2=null;
    ResultSet rs1=null,rs2=null;
    String qty,mname,userid;
%>
<h1 class="page-header"><small>Medicine Sales</small></h1>
<%
    if(request.getParameter("submit1")==null) {
         ps1 = conn.prepareStatement("select mname from pymedicine");
         rs1 = ps1.executeQuery();
         ps2 = conn.prepareStatement("select userid,uname from pycustomer");
         rs2 = ps2.executeQuery();
         
%>
<form name="f" action="sales.jsp" method="post">
            <table class="center_tab">
                <thead>
                    <tr>
                        <th colspan="2">MEDICINE SALES</th>
                    </tr>
                </thead>
                <tbody>
                     <tr>
                        <th>Select User</th>
                        <td>
                             <select name="userid">
                                  <%
                                   while(rs2.next()) {
                                        out.print("<option value='"+rs2.getString(1)+"'>"+rs2.getString(2)+" ["+rs2.getString(1)+"]</option>");
                                   }
                                   ps2.close();
                                  %>  
                             </select>
                        </td>   
                    </tr>
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
                        <td><input type="text" name="qty" required pattern="\d+"></td>   
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2" class="center">
                            <input type="submit" name="submit1" value="Deliver">
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
<%
        
    } else {    
    mname = request.getParameter("mname");
    qty = request.getParameter("qty");
    userid = request.getParameter("userid");
    String dt = new java.text.SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
    try {
         ps1 = conn.prepareStatement("select stock from pymedicine where mname=?");
         ps1.setString(1, mname);
         rs1 = ps1.executeQuery();
         rs1.next();
         int av = rs1.getInt(1);
         ps1.close();
         if(av>=Integer.parseInt(qty)) {
               ps1 = conn.prepareStatement("insert into pysales(dt,userid,mname,qty) values(?,?,?,?)");
               ps1.setString(1, dt);
               ps1.setString(2, userid);
               ps1.setString(3, mname);
               ps1.setString(4, qty);
               ps1.executeUpdate();
               ps1.close();
               
               ps1 = conn.prepareStatement("update pymedicine set stock=stock-? where mname=?");
               ps1.setString(1, qty);
               ps1.setString(2, mname);
               ps1.executeUpdate();
               ps1.close();
               out.print("<div class='center'>Medicine Sold...!<br><a href='sales.jsp'>Back</a></div>");
         } else {
              out.print("<div class='center'>Insufficient Stock...!<br>Cannot Deliver Medicine...!<br><a href='sales.jsp'>Back</a></div>");
         }    
    } catch(Exception e) {
         out.print("<div class='center'>"+e.getMessage()+"<br><a href='updatestock.jsp'>Back</a></div>");
    }
    
    }
    conn.close();
%><%@include file="footer.jsp" %>