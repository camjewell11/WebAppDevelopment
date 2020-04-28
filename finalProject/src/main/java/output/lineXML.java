package output;

public class lineXML {
    private int depth;
    private String line;
    
    public lineXML() {
        depth = 0;
        line = "";
    }
    public lineXML(String line, int depth) {
        this.line = line;
        this.depth = depth;
    }
    
    public void setLine(String line) {
        this.line = line;
    }
    public void setDepth(int depth) {
        this.depth = depth;
    }
    
    public String getLine() {
        return this.line;
    }
    public int getDepth() {
        return this.depth;
    }
}
