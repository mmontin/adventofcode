package advent2021.puzzle24;

@SuppressWarnings("all")
public class Modulo extends BinaryInstruction {
  public Modulo(final String[] split) {
    super(split);
  }
  
  public String header() {
    return ((((((((((("if (" + this.left) + " < 0 || ") + this.right) + " <= 0) {") + "\n") + "\t") + "throw new ALUException() ;") + "\n") + "} else {") + "\n") + "\t");
  }
  
  public String footer() {
    return ("\n" + "}");
  }
  
  public String op() {
    return "%";
  }
}
