package advent2021.puzzle4;

@SuppressWarnings("all")
public class Square {
  protected int number;

  protected boolean called;

  public Square(final int number_) {
    this.number = number_;
    this.called = false;
  }

  public boolean call(final int number_) {
    return this.called = (this.called || (this.number == number_));
  }
}
