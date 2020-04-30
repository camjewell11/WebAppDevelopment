package output;

public class lineXML {
    private int depth;
    private String line;
    private String element;
    private String attribute;
    private String eValue;
    private String aValue;
    private boolean isDone = false;
    
    public lineXML(String element) {
        depth = 0;
        this.element = element;
    }
    public lineXML(String element, int depth) {
        this.element = element;
        this.depth = depth;
    }
    public lineXML(String element, int depth, String eValue) {
        this.element = element;
        this.depth = depth;
        this.eValue = eValue;
    }
    
    public void setElement(String element) {
        this.element = element;
    }
    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }
    public void seteValue(String ev) {
        this.eValue = ev;
    }
    public void setaValue(String av) {
        this.aValue = av;
    }
    
    public String getElement() {
        return element;
    }
    public int getDepth() {
        return depth;
    }
    
    public String getLine() {
        line = "";
        
        if (element != null) {
            line += "<" + element;
            if (eValue != null)
                line += ">" + eValue + "</" + element + ">";
            else
                line += ">";
        }
        addSpacing();
        
        return line;
    }
    
    // used to pad XML output before it goes in downloadable/displayable file
    public void addSpacing() {
        for(int i = 0; i < depth; i++)
            line = "    " + line;
    }
    
    public void makeCloser() {
        line = line.replaceAll("<", "</");
    }
}
