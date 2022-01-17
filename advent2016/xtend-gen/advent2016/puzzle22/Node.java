package advent2016.puzzle22;

@SuppressWarnings("all")
public class Node {
  private int size;
  
  private int used;
  
  public Node(final int size_, final int used_) {
    this.size = size_;
    this.used = used_;
  }
  
  public Node(final String size_, final String used_) {
    this(
      Integer.parseInt(size_.substring(0, (size_.length() - 1))), 
      Integer.parseInt(used_.substring(0, (used_.length() - 1))));
  }
  
  public int avail() {
    return (this.size - this.used);
  }
  
  public int percent() {
    return ((int) ((((double) this.used) / this.size) * 100));
  }
  
  public boolean isEmpty() {
    return (this.used == 0);
  }
  
  public boolean wouldFitIn(final Node other) {
    int _avail = other.avail();
    return (this.used <= _avail);
  }
  
  public String toString() {
    int _avail = this.avail();
    String _plus = ((((("Size: " + Integer.valueOf(this.size)) + "T ; Used: ") + Integer.valueOf(this.used)) + "T ; Avail: ") + Integer.valueOf(_avail));
    String _plus_1 = (_plus + "T ; Use%: ");
    int _percent = this.percent();
    String _plus_2 = (_plus_1 + Integer.valueOf(_percent));
    return (_plus_2 + "%");
  }
}
