<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="output.lineXML" %>
<%@page import="output.XMLprinter" %>

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
            
            XMLprinter printyBoi = new XMLprinter();
            
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
                    <input id="rootName" type="textE" placeholder="root element" />
                    <input type="submit" value="Add" onclick="update(document.getElementById('rootName').value);" />
                </div>
            </div>
            <div class="right">
                <div class="inside">
                    <div id="displayText" >filler</div>
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
        <script language="javascript" >
            function update(newText) {
                document.getElementById("displayText").innerHTML = newText;
            }
        </script>
        <style>
            input[type=textE], select {
                width: 50%;
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
            input[type=submitE] {
                width: 10%;
                background-color: DodgerBlue;
                border: none;
                color: white;
                padding: 10px 30px;
                cursor: pointer;
                font-size: 15px;
            }
            input[type=submit]:hover {
                background-color: RoyalBlue;
            }
            input[type=submitE]:hover {
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
