package output;

import java.io.*;
import java.util.ArrayList;

public class XMLprinter {
    public XMLprinter() {}
    
    public String updateDisplay(ArrayList<lineXML> state) {
        String display = "";
        for(int i = 0; i < state.size(); i++) {
            state.get(i).addSpacing();
            display += state.get(i).getLine();
        }
        return display;
    }
    public void addRoot(ArrayList<lineXML> state, String textBox) {
        lineXML startRoot = new lineXML(textBox, 0);
        lineXML endRoot = new lineXML(textBox, 0);
        endRoot.makeCloser();

        state.add(0, startRoot);
        state.add(state.size()-1, endRoot);
    }
    
    public String convertStateToString(ArrayList<lineXML> state) {
        String output = "";
        ArrayList<String> lines = new ArrayList<>();
        ArrayList<String> outputLines = new ArrayList<>();
        
        for (int i = 0; i < state.size(); i++) {
            String temp = state.get(i).getLine() + "\n";
            lines.add(temp);
            outputLines.add(temp);
        }
        
        for (int i = 0; i < lines.size(); i++) {
            if (!lines.get(i).contains("/")) {
                String footer = "</" + lines.get(i).substring(1,lines.get(i).length());
                if (state.get(i).getDepth() == 0)
                    outputLines.add(footer);
                else
                    outputLines.add(state.size()-state.get(i).getDepth(), footer);
            }
        }
        
        for (int i = 0; i < outputLines.size(); i++)
            output += outputLines.get(i);
        
        return output;
    }
}
