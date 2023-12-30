package advent2018;

import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

@SuppressWarnings("all")
public class MiniLang {
  public static final Set<String> instructions = CollectionLiterals.<String>newHashSet(
    "addr", 
    "addi", 
    "mulr", 
    "muli", 
    "borr", 
    "bori", 
    "banr", 
    "bani", 
    "setr", 
    "seti", 
    "gtir", 
    "gtri", 
    "gtrr", 
    "eqir", 
    "eqri", 
    "eqrr");

  protected List<Integer> registry;

  public MiniLang(final List<Integer> _registry) {
    ArrayList<Integer> _arrayList = new ArrayList<Integer>(_registry);
    this.registry = _arrayList;
  }

  public Integer execute(final String instr) {
    Integer _xblockexpression = null;
    {
      final String[] split = instr.split(" ");
      _xblockexpression = this.execute(split[0], Integer.parseInt(split[1]), Integer.parseInt(split[2]), 
        Integer.parseInt(split[3]));
    }
    return _xblockexpression;
  }

  public Integer execute(final String instr, final int a, final int b, final int c) {
    Integer _switchResult = null;
    if (instr != null) {
      switch (instr) {
        case "addr":
          Integer _get = this.registry.get(a);
          Integer _get_1 = this.registry.get(b);
          _switchResult = Integer.valueOf(((_get).intValue() + (_get_1).intValue()));
          break;
        case "addi":
          Integer _get_2 = this.registry.get(a);
          _switchResult = Integer.valueOf(((_get_2).intValue() + b));
          break;
        case "mulr":
          Integer _get_3 = this.registry.get(a);
          Integer _get_4 = this.registry.get(b);
          _switchResult = Integer.valueOf(((_get_3).intValue() * (_get_4).intValue()));
          break;
        case "muli":
          Integer _get_5 = this.registry.get(a);
          _switchResult = Integer.valueOf(((_get_5).intValue() * b));
          break;
        case "borr":
          _switchResult = Integer.valueOf(((this.registry.get(a)).intValue() | (this.registry.get(b)).intValue()));
          break;
        case "bori":
          _switchResult = Integer.valueOf(((this.registry.get(a)).intValue() | b));
          break;
        case "banr":
          _switchResult = Integer.valueOf(((this.registry.get(a)).intValue() & (this.registry.get(b)).intValue()));
          break;
        case "bani":
          _switchResult = Integer.valueOf(((this.registry.get(a)).intValue() & b));
          break;
        case "setr":
          _switchResult = this.registry.get(a);
          break;
        case "seti":
          _switchResult = Integer.valueOf(a);
          break;
        case "gtir":
          int _xifexpression = (int) 0;
          Integer _get_6 = this.registry.get(b);
          boolean _greaterThan = (a > (_get_6).intValue());
          if (_greaterThan) {
            _xifexpression = 1;
          } else {
            _xifexpression = 0;
          }
          _switchResult = Integer.valueOf(_xifexpression);
          break;
        case "gtri":
          int _xifexpression_1 = (int) 0;
          Integer _get_7 = this.registry.get(a);
          boolean _greaterThan_1 = ((_get_7).intValue() > b);
          if (_greaterThan_1) {
            _xifexpression_1 = 1;
          } else {
            _xifexpression_1 = 0;
          }
          _switchResult = Integer.valueOf(_xifexpression_1);
          break;
        case "gtrr":
          int _xifexpression_2 = (int) 0;
          Integer _get_8 = this.registry.get(a);
          Integer _get_9 = this.registry.get(b);
          boolean _greaterThan_2 = (_get_8.compareTo(_get_9) > 0);
          if (_greaterThan_2) {
            _xifexpression_2 = 1;
          } else {
            _xifexpression_2 = 0;
          }
          _switchResult = Integer.valueOf(_xifexpression_2);
          break;
        case "eqir":
          int _xifexpression_3 = (int) 0;
          Integer _get_10 = this.registry.get(b);
          boolean _equals = (a == (_get_10).intValue());
          if (_equals) {
            _xifexpression_3 = 1;
          } else {
            _xifexpression_3 = 0;
          }
          _switchResult = Integer.valueOf(_xifexpression_3);
          break;
        case "eqri":
          int _xifexpression_4 = (int) 0;
          Integer _get_11 = this.registry.get(a);
          boolean _equals_1 = ((_get_11).intValue() == b);
          if (_equals_1) {
            _xifexpression_4 = 1;
          } else {
            _xifexpression_4 = 0;
          }
          _switchResult = Integer.valueOf(_xifexpression_4);
          break;
        case "eqrr":
          int _xifexpression_5 = (int) 0;
          Integer _get_12 = this.registry.get(a);
          Integer _get_13 = this.registry.get(b);
          boolean _equals_2 = Objects.equal(_get_12, _get_13);
          if (_equals_2) {
            _xifexpression_5 = 1;
          } else {
            _xifexpression_5 = 0;
          }
          _switchResult = Integer.valueOf(_xifexpression_5);
          break;
      }
    }
    return this.registry.set(c, _switchResult);
  }
}
