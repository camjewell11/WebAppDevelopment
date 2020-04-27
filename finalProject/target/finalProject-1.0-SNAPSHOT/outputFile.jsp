<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="output.XMLprinter" %>
<%@page import="java.util.Scanner" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>XML Downloader</title>
    </head>
    <body>
        <h1>Congratulations on finishing your new XML file!</h1>
        Click the button below to download your file.<br><br>
        
        <%
            String fileName = "test.xml";
            XMLprinter temp = new XMLprinter();
            String output = temp.getXML(fileName);
        %>
        <textarea rows="20" cols="40" border="3px">
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
        
        <%-- Button to download created file. --%>
        <a download href="<%=fileName%>"<button class="btn" type="submit">Download <%=fileName%></button></a>
    </body>
</html>
