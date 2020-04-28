package output;

import java.io.*;

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
}
