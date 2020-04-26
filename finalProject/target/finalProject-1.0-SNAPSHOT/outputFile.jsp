<%-- 
    Document   : outputFile
    Created on : Apr 26, 2020, 3:46:40 PM
    Author     : cameron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>XML Downloader</title>
    </head>
    <body>
        <h1>Congratulations on finishing your new XML file!</h1>
        Click the button below to download your file.<br><br>
        
        <%String fileName = "test.txt";%>
        
        <style>
            .btn {
              background-color: DodgerBlue;
              border: none;
              color: white;
              padding: 12px 30px;
              cursor: pointer;
              font-size: 20px;
            }

            /* Darker background on mouse-over */
            .btn:hover {
              background-color: RoyalBlue;
            }
        </style>
        
        <a href="" download="<%=fileName%>"<button class="btn" type="submit">Download <%=fileName%></button></a>
    </body>
</html>
