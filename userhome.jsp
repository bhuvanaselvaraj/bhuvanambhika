<%@include file="userheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String stock,mname;
%>
<h1 class="page-header"><small>Place Order</small></h1>
<%
    if(request.getParameter("submit1")==null) {         
%>
<form name="f" action="userhome1.jsp" method="post" enctype="multipart/form-data">
            <table class="center_tab">
                <thead>
                    <tr>
                        <th colspan="2">UPLOAD ORDER</th>
                    </tr>
                </thead>
                <tbody>
                     <tr>
                        <th>Select Image</th>
                        <td><input type="file" name="t2" required accept="image/*"></td>   
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2" class="center">
                            <input type="submit" name="submit1" value="Upload Prescription">
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
<%
        
    } else {    
    
    
    }
%><%@include file="footer.jsp" %>