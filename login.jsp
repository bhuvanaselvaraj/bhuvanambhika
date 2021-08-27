<%@include file="header.jsp" %><%!
     String utype,userid,pwd;
     PreparedStatement ps1=null;
     ResultSet rs1=null;
%><%
/*if(strcasecmp($_GET['utype'], "admin")==0) {
    echo "<div style='text-align:center;'><img src='img/im1.gif' width='300px'></div>";
}*/
if(request.getParameter("submit")==null) {
    utype = request.getParameter("utype");
%>
<form name="f" action="login.jsp" method="post">
    <table class="center_tab">
	<thead>
	    <tr>
                <th colspan="2"><%=utype.toUpperCase()%> LOGIN</th>
	    </tr>
	</thead>
	<tbody>
	    <tr>
		<th>User Id</th>
		<td><input type="text" name="userid" required autofocus></td>
	    </tr>
	    <tr>
		<th>Password</th>
		<td>
                    <input type="password" name="pwd" required>
                    <input type="hidden" name="utype" value="<%=utype%>">
                </td>
	    </tr>
	</tbody>
	<tfoot>
	    <tr>
		<td colspan="2" class="center">
		    <input type="submit" name="submit" value="Login">
		</td>
	    </tr>
	</tfoot>
    </table>
</form>
<%
} else {
     utype = request.getParameter("utype");
     userid = request.getParameter("userid");
     pwd = request.getParameter("pwd");
     if(utype.equalsIgnoreCase("employee")) {
          ps1 = conn.prepareStatement("select * from pyadmin where userid=? and pwd=?");
          ps1.setString(1, userid);
          ps1.setString(2, pwd);
          rs1 = ps1.executeQuery();
          if(rs1.next()) {
               session.setAttribute("adminuserid", userid);
               response.sendRedirect("adminhome.jsp");
          } else {
               out.print("<div class='center'>Invalid Userid/Password...!<br><a href='login.jsp?utype=employee'>Login</a></div>");
          }
          ps1.close();
     } else if(utype.equalsIgnoreCase("customer")) {
          ps1 = conn.prepareStatement("select * from pycustomer where userid=? and pwd=?");
          ps1.setString(1, userid);
          ps1.setString(2, pwd);
          rs1 = ps1.executeQuery();
          if(rs1.next()) {
               session.setAttribute("userid", userid);
               response.sendRedirect("userhome.jsp");
          } else {
               out.print("<div class='center'>Invalid Userid/Password...!<br><a href='login.jsp?utype=customer'>Login</a></div>");
          }
          ps1.close();
     }
    /*extract($_POST);
    if(strcasecmp($utype, "admin")==0) {
	$result = mysqli_query($link, "select * from admin where userid='$userid' and pwd='$pwd'") or die(mysqli_error($link));
	if(mysqli_num_rows($result)>0) {
	    $_SESSION['adminuserid'] = $userid;
	    header("Location:adminhome.php");
	} else {
	    echo "<div class='center'>Invalid Userid/Password</div>";
	}
	mysqli_free_result($result);
    } else if(strcasecmp($utype, "patient")==0) {        
            $result = mysqli_query($link, "select * from newpatient where userid='$userid' and pwd='$pwd'");
            if(mysqli_num_rows($result)>0) {
                $_SESSION['userid'] = $userid;
                header("Location:patienthome.php");
            } else {
                echo "<div class='center'>Invalid Userid/Password</div>";
            }
            mysqli_free_result($result);        
    }   else if(strcasecmp($utype, "doctor")==0) {
	$result = mysqli_query($link, "select * from newdoctor where userid='$userid' and pwd='$pwd'") or die(mysqli_error($link));
	if(mysqli_num_rows($result)>0) {
	    $_SESSION['doctorid'] = $userid;
	    header("Location:doctorhome.php");
	} else {
	    echo "<div class='center'>Invalid Userid/Password</div>";
	}
	mysqli_free_result($result);
    }
    echo "<div class='center'><a href='index.php'>Back</a></div>";*/
     conn.close();
}
%><%@include file="footer.jsp" %>