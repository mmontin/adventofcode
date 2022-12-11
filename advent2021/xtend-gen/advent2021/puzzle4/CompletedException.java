package advent2021.puzzle4;

@SuppressWarnings("all")
public class CompletedException extends Exception {
  protected Integer result;

  public CompletedException(final int value, final int lastCalled) {
    this.result = Integer.valueOf((value * lastCalled));
  }
}
