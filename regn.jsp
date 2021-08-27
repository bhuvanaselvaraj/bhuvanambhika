<%@include file="header.jsp" %><%!
     String uname,addr,city,mobile,userid,pwd;
     PreparedStatement ps1=null;
%><%
if(request.getParameter("submit1")==null) {    
%>
        <form name="f" action="regn.jsp" method="post" onsubmit="return check()" style="float:none;">
            <table class="center_tab" style="min-width: 400px;">
                <thead>
                    <tr>
                        <th colspan="2">CUSTOMER REGISTRATION</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>Name</th>
                        <td><input type="text" name="uname" required autofocus></td>                      
                    </tr>
                    
                    <tr>
                        <th>Address</th>
                        <td><textarea name="addr" required></textarea></td>
                        
                    </tr>
                    <tr>
                        <th>City</th>
                        <td><input type="text" name="city" required></td>                        
                    </tr>
                    <tr>
                        <th>Mobile</th>
                        <td><input type="text" name="mobile" required maxlength="10"></td>
                        
                    </tr>
                    <tr>
                        <th>EMail</th>
                        <td><input type="text" name="email" required></td>
                        
                    </tr>
                    <tr>
                        <th>Password</th>
                        <td><input type="password" name="pwd" required></td>
                        
                    </tr>                    
                    <tr>
                        <th>Confirm Pwd</th>
                        <td><input type="password" name="cpwd" required></td>
                        
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2" class="center">
                            <input type="submit" name="submit1" value="Register">
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
<!--img src="img/img1.jpg" width="400px" style="float:left;width:400px;"-->
<%
} else {
     uname = request.getParameter("uname");
     addr = request.getParameter("addr");
     city = request.getParameter("city");
     mobile = request.getParameter("mobile");
     userid = request.getParameter("email");
     pwd = request.getParameter("pwd");
     try {
     ps1 = conn.prepareStatement("insert into pycustomer(uname,addr,city,mobile,userid,pwd) values(?,?,?,?,?,?)");
     ps1.setString(1, uname);
     ps1.setString(2, addr);
     ps1.setString(3, city);
     ps1.setString(4, mobile);
     ps1.setString(5, userid);
     ps1.setString(6, pwd);
     ps1.executeUpdate();
     out.print("<div class='center'>Registered Successfully...!<br><a href='login.jsp?utype=customer'>Login</a></div>");
     } catch(Exception e) {
          out.print("<div class='center'>User Id already Exists...!<br><a href='regn.jsp'>Try Again</a></div>");
     }
     conn.close();
}
%>
<script>
    function check() {
        var m = f.mobile.value
        var e = f.email.value
        var pw = f.pwd.value
        var cp = f.cpwd.value
        
        var mp = /^[987]\d{9}$/
        var ep = /^\w+\.{0,1}\w+\@\w+\.([a-z]{3}|[a-z]{2}\.[a-z]{2}){1}$/
        
        if(!m.match(mp)) {
            alert("Invalid Mobile Number")
            f.mobile.focus()
            return false
        }
        if(!e.match(ep)) {
            alert("Invalid EMail Id")
            f.email.focus()
            return false
        }
        if(pw!=cp) {
             alert("Confirm Password not Match...!")
             f.cpwd.focus()
             return false
        }
        return true
    }
</script>
<%@include file="footer.jsp"%>