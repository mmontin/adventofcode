package advent2021.puzzle24;

@SuppressWarnings("all")
public class Division extends BinaryInstruction {
  public Division(final String[] split) {
    super(split);
  }
  
  public String header() {
    return ((((((((("if (" + this.right) + " == 0) {") + "\n") + "\t") + "throw new ALUException() ;") + "\n") + "} else {") + "\n") + "\t");
  }
  
  public String footer() {
    return ("\n" + "}");
  }
  
  public String op() {
    return "/";
  }
}
