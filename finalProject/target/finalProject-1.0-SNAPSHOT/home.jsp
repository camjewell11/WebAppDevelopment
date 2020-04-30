<%-- 
    Document   : home
    Created on : Apr 30, 2020, 12:20:05 PM
    Author     : cameron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>XML Generator</title>
    </head>
    <body>
        <%
            session.removeAttribute("state");
        %>
        
        <h1>Enter your desired file name.</h1>
        
        <form action="createXML.jsp" method="POST">
            <input type="text" name="fileName" onkeypress="javascript:return  (event.keyCode != 13)" id="fileName" placeholder="someFile.xml (.xml filetype required)" pattern="^[\w,\s-]+\.xml$" /><br>
            <input type="submit" value="Get Started" />
        </form>
        
        <style>
            input[type=text], select {
                width: 30%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type=submit] {
                background-color: DodgerBlue;
                border: none;
                color: white;
                padding: 12px 30px;
                cursor: pointer;
                font-size: 20px;
            }
            input[type=submit]:hover {
                background-color: RoyalBlue;
            }
        </style>
    </body>
</html>
