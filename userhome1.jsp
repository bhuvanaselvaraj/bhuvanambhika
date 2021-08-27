<%@include file="userheader.jsp"%><%@page import="java.io.*,java.util.*,java.text.*" %><%!
PreparedStatement ps,ps1;
ServletInputStream ds;
FileOutputStream fs;
ResultSet rs;
String distid,contentType,fn,mt,sdf,dip;
File f;
byte[] b;
java.util.Date dt;
%>
<%
distid=(String)session.getAttribute("userid");
contentType = request.getContentType();
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
                byte dataBytes[] = new byte[formDataLength];
                int byteRead = 0;
                int totalBytesRead = 0;
                //this loop converting the uploaded file into byte code
                while (totalBytesRead < formDataLength) {
                        byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
                        totalBytesRead += byteRead;
                        }
                                        String file = new String(dataBytes);
                //for saving the file name
                String saveFile = file.substring(file.indexOf("filename=\"") + 10);
                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1,contentType.length());
                int pos;
                //extracting the index of file
                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                int startPos = ((file.substring(0, pos)).getBytes()).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                //fn=getServletContext().getRealPath("/Anomalay/").substring(0, 2)+getServletContext().getContextPath()+"/web/uploads/"+saveFile;  
                fn=getServletContext().getRealPath("JPharmacy").substring(0, getServletContext().getRealPath("JPharmacy").lastIndexOf("\\"))+"\\uploads\\"+saveFile;                
                mt=getServletContext().getMimeType(fn);
                sdf=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a").format(new java.util.Date());
                FileOutputStream fileOut = new FileOutputStream(fn);
                fileOut.write(dataBytes, startPos, (endPos - startPos));
                fileOut.flush();
                fileOut.close();
                ps=conn.prepareStatement("insert into pyuploads(userid,fname,ftype,ctime) values (?,?,?,?)");
                ps.setString(1, distid);
                ps.setString(2, fn);
                ps.setString(3 ,mt);
                ps.setString(4, sdf);
                ps.executeUpdate();
                ps.close();
                out.println("<font style='font-family:Arial;font-size:13px;font-weight:bold;color:#cc3333;'><center>File Uploaded Successfully...!<br>Pay Cash on Delivery of Medicines...!</center></font>");
                out.println("<br><center><a href='userhome.jsp'>Refresh</a></center>");                
                } else {
                out.println("<font style='font-family:Arial;font-size:13px;font-weight:bold;color:#cc3333;'><center>Error! Uploading File</center></font>");
                out.println("<br><center><a href='userhome.jsp'>Back</a></center>");
                }
conn.close();
%><%@include file="footer.jsp" %>