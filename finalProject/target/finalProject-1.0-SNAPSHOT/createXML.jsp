<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="output.lineXML" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>XML Generator</title>
    </head>
    <body>
        <h1>Begin creating your XML file!</h1>
        <%
            String fileName = request.getParameter("fileName");
            String relativePath = "/Users/cameron/Downloads/" + "finalProject/finalProject/src/main/webapp/" + fileName;
            session.setAttribute("fileName", fileName);
            
            ArrayList<lineXML> state = new ArrayList<>();
            if(null == session.getAttribute("state"))
                session.setAttribute("state", state);
            else
                state = (ArrayList<lineXML>)session.getAttribute("state");
            
            PrintWriter writer = new PrintWriter(relativePath, "UTF-8");
            writer.println("test");
            writer.close();
        %>
        <div class="top">
            <div class="left">
                <div class="inside">
                    <input type="text" placeholder="root element" />
                    <input type="submit" value="Add" onclick="updateDisplay();" />
                </div>
            </div>
            <div class="right">
                <div class="inside">
                    test
                </div>
            </div>
        </div>
        <div class="bottom" >
            <form action="outputFile.jsp" method="POST">
                <input type="submit" value="Go to Download" />
            </form>
            <form action="index.html" method="POST">
                <input type="submit" value="Return Home" />
            </form>
        </div>
        <style>
            input[type=text], select {
                width: 30%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
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
            form {
                display: inline-block;
            }
            .top {
                position: absolute;
                width: 98%;
                height: 80%;
            }
            .bottom {
                position: absolute;
                left: 2%;
                bottom: 2%;
            }
            .left {
                width: 48%;
                height: 100%;
                position: absolute;
                left: 0;
                border: 2px solid black;
                margin-left: 1%
            }
            .right {
                width: 48%;
                height: 100%;
                position: absolute;
                right: 0;
                border: 2px solid black;
                margin-right: 1%
            }
            .inside {
                margin-left: 2%;
                margin-top: 2%;
            }
        </style>
    </body>
</html>
