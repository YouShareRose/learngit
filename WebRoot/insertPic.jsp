<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%
//首先检查请求中是否包含文件上载数据
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
//如果包含文件上载数据，就开始处理请求中的数据
if (isMultipart){
  //创建一个factory用于文件条目
  FileItemFactory factory = new DiskFileItemFactory();
  //创建一个ServletFileUpload实例用于处理请求数据
  ServletFileUpload upload = new ServletFileUpload(factory);
  //解析请求数据，将其包含在一个List内
  List<FileItem> items = upload.parseRequest(request);
  //下面使用枚举遍历请求中的表单控件，其中包含有文件上载控件
  Iterator<FileItem> iter = items.iterator();
  while (iter.hasNext()) {
    FileItem item = (FileItem) iter.next();
	//检查是否表单其它控件还是文件控件
	//如果不是其它控件就是文件控件
    if (!item.isFormField()) {
	  //获取文件数据，及数据大小
      InputStream uploadedStream = item.getInputStream();
	  long sizeInBytes = item.getSize();
      //创建一个新的连接，查询数据库
      Driver myDriver = (Driver)Class.forName("com.mysql.jdbc.Driver").newInstance();
      Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost/test","root","123");
      // Statement myStatement = myConn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
      Statement myStatement = myConn.createStatement();
      ResultSet myResultSet = myStatement.executeQuery("SELECT picture FROM employees WHERE firstName = 'Leverling'");
	  if (myResultSet.next()){
	    myResultSet.absolute(1); 
        myResultSet.updateBinaryStream("picture", uploadedStream, (int)sizeInBytes);
		myResultSet.updateRow();
  	    out.println("数据库更新成功！！！");
        //最后，显式的关闭对象
        myResultSet.close();
        myStatement.close();
        myConn.close();
        uploadedStream.close();
      }
    } else {
	  out.println("不是文件控件！！！");
    }
  }
} else {
  out.println("不存在上传文件！！！");
}
%>