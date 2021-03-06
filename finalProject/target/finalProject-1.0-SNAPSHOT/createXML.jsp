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
            
            
            // hard coded example
            lineXML testr = new lineXML("things", 0);
            state.add(testr);
            lineXML test1 = new lineXML("thing1", 1, "value 1");
            state.add(test1);
            lineXML test2 = new lineXML("thing2", 1, "value 2");
            state.add(test2);
            lineXML test3 = new lineXML("thing3", 1, "value 3");
            state.add(test3);
            lineXML test4 = new lineXML("thing4", 1, "value 4");
            state.add(test4);
            lineXML test5 = new lineXML("thing5", 1, "value 5");
            state.add(test5);
        %>
        <div class="top">
            <div class="left">
                <div class="insideL">
                    <%-- root --%>
                    <input id="rootName" type="textR" placeholder="root element" />
                    <input type="submit" value="Add" onclick="updateDisplay(document.getElementById('rootName').value, 2);" /><br>
                    
                    <%-- element --%>
                    <img src="http://localhost:8080/finalProject/img/tab_symbol_smaller.png" >
                    <input id="element" type="textE" placeholder="element" />
                    <input type="submit" value="Add" onclick="updateDisplay(document.getElementById('element').value, 1);" /><br>
                    <img class="tab" src="http://localhost:8080/finalProject/img/tab_symbol_smaller.png" >
                    <input id="eValue" type="textV" placeholder="element value" />
                    <input type="submit" value="Add" onclick="updateDisplay(document.getElementById('eValue').value, 1);" /><br>
                    <img src="http://localhost:8080/finalProject/img/tab_symbol_smaller.png" >
                    <input id="attribute" type="textE" placeholder="attribute" />
                    <input type="submit" value="Add" onclick="updateDisplay(document.getElementById('attribute').value, 1);" /><br>
                    <img class="tab" src="http://localhost:8080/finalProject/img/tab_symbol_smaller.png" >
                    <input id="aValue" type="textV" placeholder="attribute value" />
                    <input type="submit" value="Add" onclick="updateDisplay(document.getElementById('aValue').value, 1);" /><br>
                    
                    <%-- nested element --%>
                    Nested Element<br>
                    <div class="tab">
                        <img src="http://localhost:8080/finalProject/img/tab_symbol_smaller.png" >
                        <input id="element" type="textE" placeholder="nested element" />
                        <input type="submit" value="Add" onclick="updateDisplay(document.getElementById('element').value, 1);" /><br>
                        <img class="tab" src="http://localhost:8080/finalProject/img/tab_symbol_smaller.png" >
                        <input id="eValue" type="textV" placeholder="nested element value" />
                        <input type="submit" value="Add" onclick="updateDisplay(document.getElementById('eValue').value, 1);" /><br>
                        <img src="http://localhost:8080/finalProject/img/tab_symbol_smaller.png" >
                        <input id="attribute" type="textE" placeholder="nested attribute" />
                        <input type="submit" value="Add" onclick="updateDisplay(document.getElementById('attribute').value, 1);" /><br>
                        <img class="tab" src="http://localhost:8080/finalProject/img/tab_symbol_smaller.png" >
                        <input id="aValue" type="textV" placeholder="nested attribute value" />
                        <input type="submit" value="Add" onclick="updateDisplay(document.getElementById('aValue').value, 1);" /><br>
                    </div>
                </div>
            </div>
            <div class="right">
                <div class="insideR">
                    <div id="displayText" >Your unformed XML will appear here.</div>
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
            function updateDisplay(newText, depth) {
                var strs = updateState();
                var display = "";
                
                for (i = 0; i < strs.length; i++) {
                    display += strs[i] + "<br>";
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
            .tab {
                margin-left: 5%;
            }
            input[type=textR], select {
                width: 50%;
                padding: 14px 18px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            input[type=textE], select {
                width: 45%;
                padding: 14px 18px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            input[type=textV], select {
                width: 40%;
                padding: 14px 18px;
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
                display: inline-block;
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
            .insideL {
                margin-left: 2%;
                margin-top: 2%;
            }
            .insideR {
                margin-left: 2%;
                margin-top: 2%;
            }
        </style>
    </body>
</html>
