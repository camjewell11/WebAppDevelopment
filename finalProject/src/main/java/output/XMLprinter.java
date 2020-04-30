package output;

import java.io.*;
import java.util.ArrayList;

public class XMLprinter {
    public XMLprinter() {}
    
    public String getXML(String fileName) {
        String absPath = "/Users/cameron/Downloads/finalProject/finalProject/src/main/webapp/" + fileName;
        
        try {
            FileReader fr = new FileReader(absPath);
            BufferedReader br=new BufferedReader(fr);
            StringBuffer sb=new StringBuffer();
            String line;

            while((line=br.readLine()) != null) {
                sb.append(line);
                sb.append("\n");
            }
            fr.close();

            return sb.toString();
        }
        catch(IOException e) {
            e.printStackTrace();
        }
        return "No file data found.";
    }
    
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
}
