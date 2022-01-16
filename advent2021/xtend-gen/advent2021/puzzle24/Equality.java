package advent2021.puzzle24;

@SuppressWarnings("all")
public class Equality extends Instruction {
  private String left;
  
  private String right;
  
  public Equality(final String[] split) {
    this.left = split[1];
    this.right = split[2];
  }
  
  public String toString() {
    return (((((this.left + " = ( ") + this.left) + " == ") + this.right) + ") ? 1 : 0 ;");
  }
}
