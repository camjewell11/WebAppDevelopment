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
        for (int i = 0; i < state.size(); i++) {
            state.get(i).addSpacing();
            output += state.get(i).getLine() + "\n";
        }
        
        return output;
    }
}
