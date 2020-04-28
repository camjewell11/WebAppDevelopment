<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="output.XMLprinter" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>XML Downloader</title>
    </head>
    <body>
        <h1>Congratulations on finishing your new XML file!</h1>
        A preview of the file can be seen here:<br>
        <%
            String fileName = (String)session.getAttribute("fileName");
            XMLprinter temp = new XMLprinter();
            String output = temp.getXML(fileName);
        %>
        <textarea rows="50" cols="100" border="3px">
            <%=output%>
        </textarea><br><br>
        
        <style>
            .btn {
                background-color: DodgerBlue;
                border: none;
                color: white;
                padding: 12px 30px;
                cursor: pointer;
                font-size: 20px;
            }
            .btn:hover {
                background-color: RoyalBlue;
            }
        </style>
        
        Click the Download button below to download your file. Or select Home to return to the previous screen.<br><br>
        
        <!-- Button to download created file. -->
        <a download href="<%=fileName%>"<button class="btn" type="submit">Download <%=fileName%></button></a>
        <button class="btn" type="submit" onclick="openPage('createXML.jsp')">Return Home</button>
        
        <!-- redirection script; used for buttons -->
        <script type="text/javascript">
        function openPage(pageURL) {
            window.location.href = pageURL;
        }
       </script>
    </body>
</html>
