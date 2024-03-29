package advent2015.puzzle23;

import adventutils.input.InputLoader;
import com.google.common.primitives.UnsignedLong;
import java.util.List;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  private static final UnsignedLong ZERO = UnsignedLong.ZERO;

  private static final UnsignedLong ONE = UnsignedLong.ONE;

  private static final UnsignedLong TWO = UnsignedLong.valueOf(2);

  private static final UnsignedLong THREE = UnsignedLong.valueOf(3);

  private static int current_instruction = 0;

  private static UnsignedLong a = UnsignedLong.ONE;

  private static UnsignedLong b = UnsignedLong.ZERO;

  private static List<String> instructions = new InputLoader(Integer.valueOf(2015), Integer.valueOf(23)).getInputs();

  public static void main(final String[] args) {
    while (((Launcher.current_instruction >= 0) && (Launcher.current_instruction < Launcher.instructions.size()))) {
      Launcher.execute(Launcher.instructions.get(Launcher.current_instruction));
    }
    InputOutput.<UnsignedLong>println(Launcher.b);
  }

  public static int execute(final String s) {
    int _xblockexpression = (int) 0;
    {
      final String[] split = s.split(" ");
      int _switchResult = (int) 0;
      String _get = split[0];
      if (_get != null) {
        switch (_get) {
          case "hlf":
            int _xblockexpression_1 = (int) 0;
            {
              boolean _equals = (split[1]).equals("a");
              if (_equals) {
                Launcher.a = Launcher.a.dividedBy(Launcher.TWO);
              } else {
                Launcher.b = Launcher.b.dividedBy(Launcher.TWO);
              }
              _xblockexpression_1 = Launcher.current_instruction++;
            }
            _switchResult = _xblockexpression_1;
            break;
          case "tpl":
            int _xblockexpression_2 = (int) 0;
            {
              boolean _equals = (split[1]).equals("a");
              if (_equals) {
                Launcher.a = Launcher.a.times(Launcher.THREE);
              } else {
                Launcher.b = Launcher.b.times(Launcher.THREE);
              }
              _xblockexpression_2 = Launcher.current_instruction++;
            }
            _switchResult = _xblockexpression_2;
            break;
          case "inc":
            int _xblockexpression_3 = (int) 0;
            {
              boolean _equals = (split[1]).equals("a");
              if (_equals) {
                Launcher.a = Launcher.a.plus(Launcher.ONE);
              } else {
                Launcher.b = Launcher.b.plus(Launcher.ONE);
              }
              _xblockexpression_3 = Launcher.current_instruction++;
            }
            _switchResult = _xblockexpression_3;
            break;
          case "jmp":
            int _current_instruction = Launcher.current_instruction;
            int _parseInt = Integer.parseInt(split[1]);
            _switchResult = Launcher.current_instruction = (_current_instruction + _parseInt);
            break;
          case "jie":
            int _xifexpression = (int) 0;
            boolean _isEven = Launcher.isEven(split[1]);
            if (_isEven) {
              int _current_instruction_1 = Launcher.current_instruction;
              int _parseInt_1 = Integer.parseInt(split[2]);
              _xifexpression = Launcher.current_instruction = (_current_instruction_1 + _parseInt_1);
            } else {
              _xifexpression = Launcher.current_instruction++;
            }
            _switchResult = _xifexpression;
            break;
          default:
            int _xifexpression_1 = (int) 0;
            boolean _isOne = Launcher.isOne(split[1]);
            if (_isOne) {
              int _current_instruction_2 = Launcher.current_instruction;
              int _parseInt_2 = Integer.parseInt(split[2]);
              _xifexpression_1 = Launcher.current_instruction = (_current_instruction_2 + _parseInt_2);
            } else {
              _xifexpression_1 = Launcher.current_instruction++;
            }
            _switchResult = _xifexpression_1;
            break;
        }
      } else {
        int _xifexpression_1 = (int) 0;
        boolean _isOne = Launcher.isOne(split[1]);
        if (_isOne) {
          int _current_instruction_2 = Launcher.current_instruction;
          int _parseInt_2 = Integer.parseInt(split[2]);
          _xifexpression_1 = Launcher.current_instruction = (_current_instruction_2 + _parseInt_2);
        } else {
          _xifexpression_1 = Launcher.current_instruction++;
        }
        _switchResult = _xifexpression_1;
      }
      _xblockexpression = _switchResult;
    }
    return _xblockexpression;
  }

  public static boolean isEven(final String s) {
    boolean _xifexpression = false;
    boolean _equals = s.substring(0, 1).equals("a");
    if (_equals) {
      _xifexpression = Launcher.a.mod(Launcher.TWO).equals(Launcher.ZERO);
    } else {
      _xifexpression = Launcher.b.mod(Launcher.TWO).equals(Launcher.ZERO);
    }
    return _xifexpression;
  }

  public static boolean isOne(final String s) {
    boolean _xifexpression = false;
    boolean _equals = s.substring(0, 1).equals("a");
    if (_equals) {
      _xifexpression = Launcher.a.equals(Launcher.ONE);
    } else {
      _xifexpression = Launcher.b.equals(Launcher.ONE);
    }
    return _xifexpression;
  }
}
