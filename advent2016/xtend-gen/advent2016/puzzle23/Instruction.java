package advent2016.puzzle23;

import com.google.common.base.Objects;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;

@SuppressWarnings("all")
public class Instruction {
  private enum InstructionType {
    CPY,

    INC,

    DEC,

    JNZ,

    TGL;
  }

  private Instruction.InstructionType type;

  private String arg1;

  private String arg2;

  public Instruction(final String s) {
    final String[] split = s.split(" ");
    Instruction.InstructionType _switchResult = null;
    String _get = split[0];
    boolean _matched = false;
    if (Objects.equal(_get, "cpy")) {
      _matched=true;
      _switchResult = Instruction.InstructionType.CPY;
    }
    if (!_matched) {
      if (Objects.equal(_get, "inc")) {
        _matched=true;
        _switchResult = Instruction.InstructionType.INC;
      }
    }
    if (!_matched) {
      if (Objects.equal(_get, "dec")) {
        _matched=true;
        _switchResult = Instruction.InstructionType.DEC;
      }
    }
    if (!_matched) {
      if (Objects.equal(_get, "jnz")) {
        _matched=true;
        _switchResult = Instruction.InstructionType.JNZ;
      }
    }
    if (!_matched) {
      _switchResult = Instruction.InstructionType.TGL;
    }
    this.type = _switchResult;
    this.arg1 = split[1];
    int _size = ((List<String>)Conversions.doWrapArray(split)).size();
    boolean _equals = (_size == 3);
    if (_equals) {
      this.arg2 = split[2];
    }
  }

  public String toString() {
    String _plus = (this.type + " ");
    String _plus_1 = (_plus + this.arg1);
    String _plus_2 = (_plus_1 + " ");
    return (_plus_2 + this.arg2);
  }

  public Instruction.InstructionType toggle() {
    Instruction.InstructionType _switchResult = null;
    final Instruction.InstructionType type = this.type;
    if (type != null) {
      switch (type) {
        case CPY:
          _switchResult = Instruction.InstructionType.JNZ;
          break;
        case INC:
          _switchResult = Instruction.InstructionType.DEC;
          break;
        case DEC:
          _switchResult = Instruction.InstructionType.INC;
          break;
        case JNZ:
          _switchResult = Instruction.InstructionType.CPY;
          break;
        default:
          _switchResult = Instruction.InstructionType.INC;
          break;
      }
    } else {
      _switchResult = Instruction.InstructionType.INC;
    }
    return this.type = _switchResult;
  }

  public int execute() {
    int _switchResult = (int) 0;
    final Instruction.InstructionType type = this.type;
    if (type != null) {
      switch (type) {
        case CPY:
          int _xblockexpression = (int) 0;
          {
            boolean _containsKey = Launcher.registers.containsKey(this.arg2);
            if (_containsKey) {
              int v = 0;
              try {
                v = Integer.parseInt(this.arg1);
              } catch (final Throwable _t) {
                if (_t instanceof NumberFormatException) {
                  v = (Launcher.registers.get(this.arg1)).intValue();
                } else {
                  throw Exceptions.sneakyThrow(_t);
                }
              }
              Launcher.registers.replace(this.arg2, Integer.valueOf(v));
            }
            _xblockexpression = Launcher.position++;
          }
          _switchResult = _xblockexpression;
          break;
        case INC:
        case DEC:
          int _xblockexpression_1 = (int) 0;
          {
            final Integer value = Launcher.registers.get(this.arg1);
            final boolean isInc = this.type.equals(Instruction.InstructionType.INC);
            if ((value != null)) {
              int _xifexpression = (int) 0;
              if (isInc) {
                _xifexpression = ((value).intValue() + 1);
              } else {
                _xifexpression = ((value).intValue() - 1);
              }
              Launcher.registers.replace(this.arg1, Integer.valueOf(_xifexpression));
            }
            _xblockexpression_1 = Launcher.position++;
          }
          _switchResult = _xblockexpression_1;
          break;
        case JNZ:
          int _xblockexpression_2 = (int) 0;
          {
            int x = 0;
            try {
              x = Integer.parseInt(this.arg1);
            } catch (final Throwable _t) {
              if (_t instanceof NumberFormatException) {
                x = (Launcher.registers.get(this.arg1)).intValue();
              } else {
                throw Exceptions.sneakyThrow(_t);
              }
            }
            int y = 0;
            try {
              y = Integer.parseInt(this.arg2);
            } catch (final Throwable _t) {
              if (_t instanceof NumberFormatException) {
                y = (Launcher.registers.get(this.arg2)).intValue();
              } else {
                throw Exceptions.sneakyThrow(_t);
              }
            }
            int _position = Launcher.position;
            int _xifexpression = (int) 0;
            if ((x == 0)) {
              _xifexpression = 1;
            } else {
              _xifexpression = y;
            }
            _xblockexpression_2 = Launcher.position = (_position + _xifexpression);
          }
          _switchResult = _xblockexpression_2;
          break;
        default:
          int _xblockexpression_3 = (int) 0;
          {
            int r = 0;
            try {
              r = Integer.parseInt(this.arg1);
            } catch (final Throwable _t) {
              if (_t instanceof NumberFormatException) {
                r = (Launcher.registers.get(this.arg1)).intValue();
              } else {
                throw Exceptions.sneakyThrow(_t);
              }
            }
            final int index = (Launcher.position + r);
            int _size = Launcher.instructions.size();
            boolean _lessThan = (index < _size);
            if (_lessThan) {
              Launcher.instructions.get(index).toggle();
            }
            _xblockexpression_3 = Launcher.position++;
          }
          _switchResult = _xblockexpression_3;
          break;
      }
    } else {
      int _xblockexpression_3 = (int) 0;
      {
        int r = 0;
        try {
          r = Integer.parseInt(this.arg1);
        } catch (final Throwable _t) {
          if (_t instanceof NumberFormatException) {
            r = (Launcher.registers.get(this.arg1)).intValue();
          } else {
            throw Exceptions.sneakyThrow(_t);
          }
        }
        final int index = (Launcher.position + r);
        int _size = Launcher.instructions.size();
        boolean _lessThan = (index < _size);
        if (_lessThan) {
          Launcher.instructions.get(index).toggle();
        }
        _xblockexpression_3 = Launcher.position++;
      }
      _switchResult = _xblockexpression_3;
    }
    return _switchResult;
  }
}
