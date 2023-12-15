package advent2019;

import adventutils.string.StringUtils;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Intcode {
  public static final Map<Integer, Pair<String, Integer>> codes = CollectionLiterals.<Integer, Pair<String, Integer>>newHashMap(
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(99), Pair.<String, Integer>of("halt", Integer.valueOf(0))), 
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(1), Pair.<String, Integer>of("add", Integer.valueOf(3))), 
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(2), Pair.<String, Integer>of("mult", Integer.valueOf(3))), 
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(3), Pair.<String, Integer>of("input", Integer.valueOf(1))), 
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(4), Pair.<String, Integer>of("output", Integer.valueOf(1))), 
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(5), Pair.<String, Integer>of("jump-if-true", Integer.valueOf(2))), 
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(6), Pair.<String, Integer>of("jump-if-false", Integer.valueOf(2))), 
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(7), Pair.<String, Integer>of("less-then", Integer.valueOf(3))), 
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(8), Pair.<String, Integer>of("equal", Integer.valueOf(3))));

  public static final int inst_size = ((IterableExtensions.<Integer>max(IterableExtensions.<Pair<String, Integer>, Integer>map(Intcode.codes.values(), ((Function1<Pair<String, Integer>, Integer>) (Pair<String, Integer> it) -> {
    return it.getValue();
  })))).intValue() + 2);

  private List<Integer> opcodes;

  private int pos;

  public Intcode(final List<Integer> opcodes_) {
    this.reset(opcodes_);
  }

  public int reset(final List<Integer> opcodes_) {
    int _xblockexpression = (int) 0;
    {
      this.opcodes = opcodes_;
      _xblockexpression = this.pos = 0;
    }
    return _xblockexpression;
  }

  public ArrayList<Integer> process() {
    return this.processWithInputs(CollectionLiterals.<Integer>newArrayList());
  }

  public ArrayList<Integer> processWithInputs(final List<Integer> inputs) {
    ArrayList<Integer> _xblockexpression = null;
    {
      boolean finished = false;
      ArrayList<Integer> outputs = CollectionLiterals.<Integer>newArrayList();
      int index = 0;
      while ((!finished)) {
        {
          String current = StringUtils.padWith(this.opcodes.get(this.pos).toString(), "0", Intcode.inst_size);
          int opcode = Integer.parseInt(current.substring((Intcode.inst_size - 2)));
          Integer nb_params = Intcode.codes.get(Integer.valueOf(opcode)).getValue();
          final String modes = StringUtils.reverse(current.substring(0, (Intcode.inst_size - 2)));
          final Function1<Integer, Pair<Integer, Boolean>> _function = (Integer it) -> {
            boolean _equals = modes.substring((it).intValue(), ((it).intValue() + 1)).equals("0");
            return Pair.<Integer, Boolean>of(Integer.valueOf(((this.pos + (it).intValue()) + 1)), Boolean.valueOf(_equals));
          };
          final List<Pair<Integer, Boolean>> params = IterableExtensions.<Pair<Integer, Boolean>>toList(IterableExtensions.<Integer, Pair<Integer, Boolean>>map(new ExclusiveRange(0, (nb_params).intValue(), true), _function));
          switch (opcode) {
            case 1:
              Integer _resolveI = this.resolveI(params.get(2));
              Integer _resolve = this.resolve(params.get(0));
              Integer _resolve_1 = this.resolve(params.get(1));
              int _plus = ((_resolve).intValue() + (_resolve_1).intValue());
              this.opcodes.set((_resolveI).intValue(), Integer.valueOf(_plus));
              break;
            case 2:
              Integer _resolveI_1 = this.resolveI(params.get(2));
              Integer _resolve_2 = this.resolve(params.get(0));
              Integer _resolve_3 = this.resolve(params.get(1));
              int _multiply = ((_resolve_2).intValue() * (_resolve_3).intValue());
              this.opcodes.set((_resolveI_1).intValue(), Integer.valueOf(_multiply));
              break;
            case 3:
              int _plusPlus = index++;
              this.opcodes.set((this.resolveI(params.get(0))).intValue(), inputs.get(_plusPlus));
              break;
            case 4:
              outputs.add(this.resolve(params.get(0)));
              break;
            case 5:
              Integer _resolve_4 = this.resolve(params.get(0));
              boolean _notEquals = ((_resolve_4).intValue() != 0);
              if (_notEquals) {
                Integer _resolve_5 = this.resolve(params.get(1));
                int _minus = ((_resolve_5).intValue() - ((nb_params).intValue() + 1));
                this.pos = _minus;
              }
              break;
            case 6:
              Integer _resolve_6 = this.resolve(params.get(0));
              boolean _equals = ((_resolve_6).intValue() == 0);
              if (_equals) {
                Integer _resolve_7 = this.resolve(params.get(1));
                int _minus_1 = ((_resolve_7).intValue() - ((nb_params).intValue() + 1));
                this.pos = _minus_1;
              }
              break;
            case 7:
              Integer _resolveI_2 = this.resolveI(params.get(2));
              int _xifexpression = (int) 0;
              Integer _resolve_8 = this.resolve(params.get(0));
              Integer _resolve_9 = this.resolve(params.get(1));
              boolean _lessThan = (_resolve_8.compareTo(_resolve_9) < 0);
              if (_lessThan) {
                _xifexpression = 1;
              } else {
                _xifexpression = 0;
              }
              this.opcodes.set((_resolveI_2).intValue(), Integer.valueOf(_xifexpression));
              break;
            case 8:
              Integer _resolveI_3 = this.resolveI(params.get(2));
              int _xifexpression_1 = (int) 0;
              Integer _resolve_10 = this.resolve(params.get(0));
              Integer _resolve_11 = this.resolve(params.get(1));
              boolean _equals_1 = Objects.equal(_resolve_10, _resolve_11);
              if (_equals_1) {
                _xifexpression_1 = 1;
              } else {
                _xifexpression_1 = 0;
              }
              this.opcodes.set((_resolveI_3).intValue(), Integer.valueOf(_xifexpression_1));
              break;
            case 99:
              finished = true;
              break;
          }
          int _pos = this.pos;
          this.pos = (_pos + ((nb_params).intValue() + 1));
        }
      }
      _xblockexpression = outputs;
    }
    return _xblockexpression;
  }

  private Integer resolveI(final Pair<Integer, Boolean> input) {
    Integer _key = input.getKey();
    Pair<Integer, Boolean> _mappedTo = Pair.<Integer, Boolean>of(_key, Boolean.valueOf(false));
    return this.resolve(_mappedTo);
  }

  private Integer resolve(final Pair<Integer, Boolean> input) {
    Integer _xblockexpression = null;
    {
      final Integer i = input.getKey();
      final Boolean mode = input.getValue();
      Integer res = this.opcodes.get((i).intValue());
      if ((mode).booleanValue()) {
        res = this.opcodes.get((res).intValue());
      }
      _xblockexpression = res;
    }
    return _xblockexpression;
  }

  public Integer result() {
    return this.opcodes.get(0);
  }
}
