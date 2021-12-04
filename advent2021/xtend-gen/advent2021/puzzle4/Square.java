package advent2021.puzzle4;

@SuppressWarnings("all")
public class Square {
  private int number;
  
  protected boolean called;
  
  public Square(final int number_) {
    this.number = number_;
    this.called = false;
  }
  
  public boolean call(final int number_) {
    return this.called = (this.called || (this.number == number_));
  }
  
  public int value() {
    int _xifexpression = (int) 0;
    if (this.called) {
      _xifexpression = 0;
    } else {
      _xifexpression = this.number;
    }
    return _xifexpression;
  }
  
  public String toString() {
    return (((("(" + Integer.valueOf(this.number)) + " , ") + Boolean.valueOf(this.called)) + ")");
  }
}
