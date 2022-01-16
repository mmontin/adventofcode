package advent2021.puzzle24;

@SuppressWarnings("all")
public class Input extends Instruction {
  private static int current_number = 0;
  
  private String variable;
  
  private int myNumber;
  
  public Input(final String s) {
    this.variable = s;
    this.myNumber = Input.current_number;
    Input.current_number++;
  }
  
  public String toString() {
    return (((this.variable + " = input[") + Integer.valueOf(this.myNumber)) + "] ;");
  }
}
