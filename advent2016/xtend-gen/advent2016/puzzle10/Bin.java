package advent2016.puzzle10;

import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Bin {
  protected int number;
  
  protected Set<Integer> chips;
  
  public Bin(final int number_) {
    this.number = number_;
    this.chips = CollectionLiterals.<Integer>newHashSet();
  }
  
  public boolean addChips(final int chip_) {
    return this.chips.add(Integer.valueOf(chip_));
  }
  
  public Integer firstChip() {
    return IterableExtensions.<Integer>toList(this.chips).get(0);
  }
  
  public boolean contains(final int chip_) {
    return this.chips.contains(Integer.valueOf(chip_));
  }
}
