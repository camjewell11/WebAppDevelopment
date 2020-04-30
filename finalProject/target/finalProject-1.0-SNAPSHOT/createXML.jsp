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
            session.setAttribute("relativePath", relativePath);
            
            XMLprinter printyBoi = new XMLprinter();
            
            ArrayList<lineXML> state = new ArrayList<>();
            if(null == session.getAttribute("state"))
                session.setAttribute("state", state);
            else
                state = (ArrayList<lineXML>)session.getAttribute("state");
            
            lineXML testy = new lineXML("things", 0);
            state.add(testy);
            lineXML tester = new lineXML("thingy", 1, "value");
            state.add(tester);
        %>
        <div class="top">
            <div class="left">
                <div class="inside">
                    <input id="rootName" type="textE" placeholder="root element" />
                    <input type="submit" value="Add" onclick="updateDisplay(document.getElementById('rootName').value);" />
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
            function updateDisplay(newText) {
                var strs = updateState();
                var display = "";
                
                for (i = 0; i < strs.length; i++) {
                    display += strs[i] + "\n";
                }
                
                document.getElementById("displayText").innerHTML = display;
            }
            
            function updateState() {
                var stateStrings = [];
                
                <% for (int i = 0; i < state.size(); i++) { %>
                    stateStrings[<%=i%>] = "<%=state.get(i).getLine()%>";
                <% } %>
                    
                return stateStrings;
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
