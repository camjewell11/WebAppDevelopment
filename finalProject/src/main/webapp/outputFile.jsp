<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="output.XMLprinter" %>
<%@page import="java.util.ArrayList"%>
<%@page import="output.lineXML"%>
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
            String relativePath = (String)session.getAttribute("relativePath");
            
            XMLprinter temp = new XMLprinter();
            ArrayList<lineXML> state = (ArrayList<lineXML>)session.getAttribute("state");
            String toFile = temp.convertStateToString(state);
            
            PrintWriter writer = new PrintWriter(relativePath, "UTF-8");
            writer.println(toFile);
            writer.close();
            
            Thread.sleep(1000); 
        %>
        <textarea rows="50" cols="100" border="3px"><%=toFile%></textarea><br><br>
        
        Click the Download button below to download your file. Select Edit to make additional changes. Or select Home to return to the first screen.<br><br>
        
        <!-- Button to download created file. -->
        <a download href="<%=fileName%>"<button class="btn" type="submit">Download <%=fileName%></button></a>
        <button class="btn" type="submit" onclick="openPage('createXML.jsp')">Edit File</button>
        <button class="btn" type="submit" onclick="openPage('home.jsp')">Return Home</button>
        
        <!-- redirection script; used for buttons -->
        <script type="text/javascript">
        function openPage(pageURL) {
            window.location.href = pageURL;
        }
        </script>
       
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
    </body>
</html>
