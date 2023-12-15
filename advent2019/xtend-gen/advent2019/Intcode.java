package advent2019;

import adventutils.string.StringUtils;
import java.util.List;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Intcode {
  public static final Map<Integer, Pair<String, Integer>> codes = CollectionLiterals.<Integer, Pair<String, Integer>>newHashMap(
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(99), Pair.<String, Integer>of("halt", Integer.valueOf(0))), 
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(1), Pair.<String, Integer>of("add", Integer.valueOf(3))), 
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(2), Pair.<String, Integer>of("mult", Integer.valueOf(3))), 
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(3), Pair.<String, Integer>of("input", Integer.valueOf(1))), 
    Pair.<Integer, Pair<String, Integer>>of(Integer.valueOf(4), Pair.<String, Integer>of("output", Integer.valueOf(1))));

  public static final int inst_size = ((IterableExtensions.<Integer>max(IterableExtensions.<Pair<String, Integer>, Integer>map(Intcode.codes.values(), ((Function1<Pair<String, Integer>, Integer>) (Pair<String, Integer> it) -> {
    return it.getValue();
  })))).intValue() + 2);

  private List<Integer> opcodes;

  private int pos;

  public Intcode(final List<Integer> opcodes_) {
    this.opcodes = opcodes_;
    this.pos = 0;
  }

  public void process() {
    while ((!this.processCommand())) {
    }
  }

  public boolean processCommand() {
    boolean _xblockexpression = false;
    {
      String current = StringUtils.padWith(this.opcodes.get(this.pos).toString(), "0", Intcode.inst_size);
      int opcode = Integer.parseInt(current.substring((Intcode.inst_size - 2)));
      Integer nb_params = Intcode.codes.get(Integer.valueOf(opcode)).getValue();
      final String modes = StringUtils.reverse(current.substring(0, (Intcode.inst_size - 2)));
      final Function1<Integer, Integer> _function = (Integer it) -> {
        return this.resolveParameter(((this.pos + (it).intValue()) + 1), modes.substring((it).intValue(), ((it).intValue() + 1)).equals("0"));
      };
      final List<Integer> params = IterableExtensions.<Integer>toList(IterableExtensions.<Integer, Integer>map(new ExclusiveRange(0, (nb_params).intValue(), true), _function));
      InputOutput.<List<Integer>>println(params);
      boolean finished = false;
      switch (opcode) {
        case 1:
          Integer _get = params.get(2);
          Integer _get_1 = params.get(0);
          Integer _get_2 = params.get(1);
          int _plus = ((_get_1).intValue() + (_get_2).intValue());
          this.opcodes.set((_get).intValue(), Integer.valueOf(_plus));
          break;
        case 2:
          Integer _get_3 = params.get(2);
          Integer _get_4 = params.get(0);
          Integer _get_5 = params.get(1);
          int _multiply = ((_get_4).intValue() * (_get_5).intValue());
          this.opcodes.set((_get_3).intValue(), Integer.valueOf(_multiply));
          break;
        case 99:
          finished = true;
          break;
      }
      int _pos = this.pos;
      this.pos = (_pos + ((nb_params).intValue() + 1));
      InputOutput.<List<Integer>>println(this.opcodes);
      _xblockexpression = finished;
    }
    return _xblockexpression;
  }

  private Integer resolveParameter(final int i, final boolean mode) {
    Integer _xblockexpression = null;
    {
      InputOutput.<String>println("------------------------------");
      InputOutput.<String>println(((("RESOLVING " + Integer.valueOf(i)) + " ") + Boolean.valueOf(mode)));
      Integer res = this.opcodes.get(i);
      if (mode) {
        res = this.opcodes.get((res).intValue());
      }
      InputOutput.<Integer>println(res);
      _xblockexpression = res;
    }
    return _xblockexpression;
  }

  public Integer result() {
    return this.opcodes.get(0);
  }
}
