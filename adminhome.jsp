<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String mtype,mname,mbrand,mprice;
%>
<h1 class="page-header"><small>New Medicine</small></h1>
<%
    if(request.getParameter("submit1")==null) {
%>
<form name="f" action="adminhome.jsp" method="post">
            <table class="center_tab">
                <thead>
                    <tr>
                        <th colspan="2">NEW MEDICINE</th>
                    </tr>
                </thead>
                <tbody>
                     <tr>
                        <th>Medicine Type</th>
                        <td>
                             <select name="mtype">
                                  <option value="tablet">Tablet</option>
                                  <option value="capsule">Capsule</option>
                                  <option value="syrup">Syrup</option>
                                  <option value="others">Others</option>
                             </select>
                        </td>   
                    </tr>
                    <tr>
                        <th>Medicine Name</th>
                        <td><input type="text" name="mname" required autofocus></td>   
                    </tr>
                    <tr>
                        <th>Medicine Brand</th>
                        <td><input type="text" name="mbrand" required></td>   
                    </tr>
                    <tr>
                        <th>Unit Price</th>
                        <td><input type="text" name="mprice" required pattern="\d+"></td>   
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2" class="center">
                            <input type="submit" name="submit1" value="Create">
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
<%
        
    } else {
    mtype = request.getParameter("mtype");
    mname = request.getParameter("mname");
    mbrand = request.getParameter("mbrand");
    mprice = request.getParameter("mprice");
    ps1 = conn.prepareStatement("insert into pymedicine(mtype,mname,mbrand,mprice) values (?,?,?,?)");
    ps1.setString(1, mtype);
    ps1.setString(2, mname);
    ps1.setString(3, mbrand);
    ps1.setString(4, mprice);
    ps1.executeUpdate();
    ps1.close();
    out.print("<div class='center'>Medicine Created Successfully...!<br><a href='adminhome.jsp'>Back</a></div>");
    }
    conn.close();
%><%@include file="footer.jsp" %>