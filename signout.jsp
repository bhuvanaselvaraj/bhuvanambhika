<%
    if(session.getAttribute("adminuserid")!=null) {
        session.removeAttribute("adminuserid");
    }
    if(session.getAttribute("userid")!=null) {
        session.removeAttribute("userid");
    }
    response.sendRedirect("index.jsp");
    %>