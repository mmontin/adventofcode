package advent2019;

import adventutils.string.StringUtils;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Intcode implements Runnable {
  public static class ListWrapper extends LinkedList<Integer> {
    public Integer lastProduced;

    private boolean halt;

    public ListWrapper(final List<Integer> list_) {
      super(list_);
      this.lastProduced = IterableExtensions.<Integer>last(list_);
      this.halt = false;
    }

    @Override
    public boolean add(final Integer i) {
      boolean _xblockexpression = false;
      {
        this.lastProduced = i;
        _xblockexpression = super.add(i);
      }
      return _xblockexpression;
    }

    @Override
    public String toString() {
      String _plus = (Boolean.valueOf(this.halt) + " ; ");
      String _string = super.toString();
      return (_plus + _string);
    }
  }

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

  private List<Integer> first_opcodes;

  public Intcode.ListWrapper inputs;

  public Intcode.ListWrapper outputs;

  private List<Integer> opcodes;

  public String name;

  private int pos;

  public Intcode(final List<Integer> opcodes_, final Intcode.ListWrapper inputs_, final Intcode.ListWrapper outputs_, final String name_) {
    this.first_opcodes = opcodes_;
    this.inputs = inputs_;
    this.outputs = outputs_;
    this.name = name_;
    this.reset();
  }

  public Intcode(final List<Integer> opcodes_) {
    this(opcodes_, new Intcode.ListWrapper(CollectionLiterals.<Integer>newArrayList()), new Intcode.ListWrapper(CollectionLiterals.<Integer>newArrayList()), "");
  }

  public int reset() {
    int _xblockexpression = (int) 0;
    {
      ArrayList<Integer> _arrayList = new ArrayList<Integer>(this.first_opcodes);
      this.opcodes = _arrayList;
      _xblockexpression = this.pos = 0;
    }
    return _xblockexpression;
  }

  @Override
  public void run() {
    try {
      boolean finished = false;
      while ((!finished)) {
        {
          InputOutput.<String>println((this.name + " executing"));
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
              synchronized (this.inputs) {
                boolean _isEmpty = this.inputs.isEmpty();
                if (_isEmpty) {
                  InputOutput.<String>println((this.name + " waiting"));
                  this.inputs.wait();
                }
                if (this.inputs.halt) {
                  finished = true;
                } else {
                  this.opcodes.set((this.resolveI(params.get(0))).intValue(), this.inputs.poll());
                }
              }
              break;
            case 4:
              synchronized (this.outputs) {
                this.outputs.add(this.resolve(params.get(0)));
                InputOutput.<String>println((this.name + " notifying"));
                this.outputs.notify();
              }
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
      synchronized (this.outputs) {
        InputOutput.<String>println((this.name + " halting"));
        this.outputs.halt = true;
        this.outputs.notify();
      }
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
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
