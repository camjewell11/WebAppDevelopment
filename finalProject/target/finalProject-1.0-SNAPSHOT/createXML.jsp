<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
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
            session.setAttribute("fileName", fileName);
            out.print(fileName);
            
            ArrayList<lineXML> state = new ArrayList<lineXML>();
            if(null == session.getAttribute("state"))
                session.setAttribute("state", state);
            else
                state = (ArrayList<lineXML>)session.getAttribute("state");
            
            lineXML testXML = new lineXML("test", 2);
            state.add(testXML);
        %>
        <br><br>
        
        <form action="outputFile.jsp" method="POST">
            <input type="submit" value="Go to Download" />
        </form>
        <form action="index.html" method="POST">
            <input type="submit" value="Return Home" />
        </form>
        
        <style>
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
        </style>
    </body>
</html>
