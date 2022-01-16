package advent2021.puzzle24;

@SuppressWarnings("all")
public abstract class BinaryInstruction extends Instruction {
  protected String left;
  
  protected String right;
  
  public BinaryInstruction(final String[] split) {
    this.left = split[1];
    this.right = split[2];
  }
  
  public abstract String header();
  
  public abstract String footer();
  
  public abstract String op();
  
  public String toString() {
    String _header = this.header();
    String _plus = (_header + this.left);
    String _plus_1 = (_plus + " ");
    String _op = this.op();
    String _plus_2 = (_plus_1 + _op);
    String _plus_3 = (_plus_2 + "= ");
    String _plus_4 = (_plus_3 + this.right);
    String _plus_5 = (_plus_4 + " ;");
    String _footer = this.footer();
    return (_plus_5 + _footer);
  }
}
