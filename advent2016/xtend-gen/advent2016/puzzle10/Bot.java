package advent2016.puzzle10;

import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Bot extends Bin {
  private Bin low;
  
  private Bin high;
  
  public Bot(final int number_) {
    super(number_);
  }
  
  public Bin putLowHigh(final Bin low_, final Bin high_) {
    Bin _xblockexpression = null;
    {
      this.low = low_;
      _xblockexpression = this.high = high_;
    }
    return _xblockexpression;
  }
  
  public boolean isFull() {
    int _size = this.chips.size();
    return (_size >= 2);
  }
  
  public void giveAll() {
    final Integer lowest = IterableExtensions.<Integer>min(this.chips);
    final Integer highest = IterableExtensions.<Integer>max(this.chips);
    if ((((lowest).intValue() == 17) && ((highest).intValue() == 61))) {
      InputOutput.<Integer>println(Integer.valueOf(this.number));
    }
    this.low.addChips((lowest).intValue());
    this.high.addChips((highest).intValue());
    this.chips.clear();
  }
  
  public boolean equals(final Object o) {
    return (this.number == ((Bot) o).number);
  }
  
  public int hashCode() {
    return this.number;
  }
}
