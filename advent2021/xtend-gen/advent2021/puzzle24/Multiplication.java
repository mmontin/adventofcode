package advent2021.puzzle24;

@SuppressWarnings("all")
public class Multiplication extends BinaryInstruction {
  public Multiplication(final String[] split) {
    super(split);
  }
  
  public String header() {
    return "";
  }
  
  public String footer() {
    return "";
  }
  
  public String op() {
    return "*";
  }
}
