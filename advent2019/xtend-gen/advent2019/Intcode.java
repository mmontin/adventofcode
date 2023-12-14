package advent2019;

import java.util.List;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Intcode {
  private static final Map<Integer, Pair<String, Integer>> codes = CollectionLiterals.<Integer, Pair<String, Integer>>newHashMap(
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(99), Pair.<String, Integer>of("halt", Integer.valueOf(0))), 
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(1), Pair.<String, Integer>of("add", Integer.valueOf(3))), 
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(2), Pair.<String, Integer>of("mult", Integer.valueOf(3))));

  private List<Integer> opcodes;

  private int pos;

  public Intcode(final List<Integer> opcodes_) {
    this.opcodes = opcodes_;
    this.pos = 0;
  }

  public void process() {
    Integer current = this.opcodes.get(this.pos);
    while (((current).intValue() != 99)) {
      {
        InputOutput.<String>println("LOOOL");
        if (((current).intValue() == 1)) {
          this.executeAdd((this.pos + 1), true, (this.pos + 2), true, (this.pos + 3));
        } else {
          this.executeMult((this.pos + 1), true, (this.pos + 2), true, (this.pos + 3));
        }
        current = this.opcodes.get(this.pos);
      }
    }
  }

  private Integer getWithMod(final int i, final boolean mod_i) {
    Integer _xblockexpression = null;
    {
      Integer val_i = this.opcodes.get(i);
      if (mod_i) {
        val_i = this.opcodes.get((val_i).intValue());
      }
      _xblockexpression = val_i;
    }
    return _xblockexpression;
  }

  private int executeAdd(final int i, final boolean mod_i, final int j, final boolean mod_j, final int k) {
    int _xblockexpression = (int) 0;
    {
      final Integer val_i = this.getWithMod(i, mod_i);
      Integer val_j = this.getWithMod(j, mod_j);
      this.opcodes.set(k, Integer.valueOf(((val_i).intValue() + (val_j).intValue())));
      int _pos = this.pos;
      _xblockexpression = this.pos = (_pos + 4);
    }
    return _xblockexpression;
  }

  private int executeMult(final int i, final boolean mod_i, final int j, final boolean mod_j, final int k) {
    int _xblockexpression = (int) 0;
    {
      final Integer val_i = this.getWithMod(i, mod_i);
      Integer val_j = this.getWithMod(j, mod_j);
      this.opcodes.set(k, Integer.valueOf(((val_i).intValue() * (val_j).intValue())));
      int _pos = this.pos;
      _xblockexpression = this.pos = (_pos + 4);
    }
    return _xblockexpression;
  }

  public Integer result() {
    return this.opcodes.get(0);
  }
}
