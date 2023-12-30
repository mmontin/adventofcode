package advent2022;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day2 {
  public enum RPC {
    ROCK,

    PAPER,

    SCISSOR;
  }

  public static void main(final String[] args) {
    List<String> _inputs = new InputLoader(Integer.valueOf(2022), Integer.valueOf(2)).getInputs();
    Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(0), Integer.valueOf(0));
    final Function2<Pair<Integer, Integer>, String, Pair<Integer, Integer>> _function = new Function2<Pair<Integer, Integer>, String, Pair<Integer, Integer>>() {
      public Pair<Integer, Integer> apply(final Pair<Integer, Integer> acc, final String el) {
        Pair<Integer, Integer> _xblockexpression = null;
        {
          final String[] s = el.split(" ");
          final Day2.RPC me = Day2.toRPC(s[1]);
          final Day2.RPC you = Day2.toRPC(s[0]);
          Integer _key = acc.getKey();
          int _score = Day2.score(you, me);
          int _plus = ((_key).intValue() + _score);
          Integer _value = acc.getValue();
          int _scare = Day2.scare(you, s[1]);
          int _plus_1 = ((_value).intValue() + _scare);
          _xblockexpression = Pair.<Integer, Integer>of(Integer.valueOf(_plus), Integer.valueOf(_plus_1));
        }
        return _xblockexpression;
      }
    };
    InputOutput.<Pair<Integer, Integer>>print(IterableExtensions.<String, Pair<Integer, Integer>>fold(_inputs, _mappedTo, _function));
  }

  public static Day2.RPC toRPC(final String s) {
    Day2.RPC _switchResult = null;
    boolean _matched = false;
    if (Objects.equal(s, "A")) {
      _matched=true;
    }
    if (!_matched) {
      if (Objects.equal(s, "X")) {
        _matched=true;
      }
    }
    if (_matched) {
      _switchResult = Day2.RPC.ROCK;
    }
    if (!_matched) {
      if (Objects.equal(s, "B")) {
        _matched=true;
      }
      if (!_matched) {
        if (Objects.equal(s, "Y")) {
          _matched=true;
        }
      }
      if (_matched) {
        _switchResult = Day2.RPC.PAPER;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "C")) {
        _matched=true;
      }
      if (!_matched) {
        if (Objects.equal(s, "Z")) {
          _matched=true;
        }
      }
      if (_matched) {
        _switchResult = Day2.RPC.SCISSOR;
      }
    }
    return _switchResult;
  }

  public static int value(final Day2.RPC input) {
    int _switchResult = (int) 0;
    if (input != null) {
      switch (input) {
        case ROCK:
          _switchResult = 1;
          break;
        case PAPER:
          _switchResult = 2;
          break;
        case SCISSOR:
          _switchResult = 3;
          break;
        default:
          break;
      }
    }
    return _switchResult;
  }

  public static int score(final Day2.RPC you, final Day2.RPC me) {
    int _switchResult = (int) 0;
    Pair<Day2.RPC, Day2.RPC> _mappedTo = Pair.<Day2.RPC, Day2.RPC>of(me, you);
    boolean _matched = false;
    Pair<Day2.RPC, Day2.RPC> _mappedTo_1 = Pair.<Day2.RPC, Day2.RPC>of(Day2.RPC.ROCK, Day2.RPC.SCISSOR);
    if (Objects.equal(_mappedTo, _mappedTo_1)) {
      _matched=true;
      _switchResult = 6;
    }
    if (!_matched) {
      Pair<Day2.RPC, Day2.RPC> _mappedTo_2 = Pair.<Day2.RPC, Day2.RPC>of(Day2.RPC.PAPER, Day2.RPC.ROCK);
      if (Objects.equal(_mappedTo, _mappedTo_2)) {
        _matched=true;
        _switchResult = 6;
      }
    }
    if (!_matched) {
      Pair<Day2.RPC, Day2.RPC> _mappedTo_3 = Pair.<Day2.RPC, Day2.RPC>of(Day2.RPC.SCISSOR, Day2.RPC.PAPER);
      if (Objects.equal(_mappedTo, _mappedTo_3)) {
        _matched=true;
        _switchResult = 6;
      }
    }
    if (!_matched) {
      boolean _equals = Objects.equal(me, you);
      if (_equals) {
        _matched=true;
        _switchResult = 3;
      }
    }
    if (!_matched) {
      _switchResult = 0;
    }
    int _value = Day2.value(me);
    return (_switchResult + _value);
  }

  public static int scare(final Day2.RPC you, final String me) {
    int _switchResult = (int) 0;
    boolean _matched = false;
    if (Objects.equal(me, "Y")) {
      _matched=true;
      int _value = Day2.value(you);
      _switchResult = (3 + _value);
    }
    if (!_matched) {
      if (Objects.equal(me, "X")) {
        _matched=true;
        Day2.RPC _switchResult_1 = null;
        if (you != null) {
          switch (you) {
            case ROCK:
              _switchResult_1 = Day2.RPC.SCISSOR;
              break;
            case SCISSOR:
              _switchResult_1 = Day2.RPC.PAPER;
              break;
            case PAPER:
              _switchResult_1 = Day2.RPC.ROCK;
              break;
            default:
              break;
          }
        }
        _switchResult = Day2.value(_switchResult_1);
      }
    }
    if (!_matched) {
      if (Objects.equal(me, "Z")) {
        _matched=true;
        Day2.RPC _switchResult_2 = null;
        if (you != null) {
          switch (you) {
            case ROCK:
              _switchResult_2 = Day2.RPC.PAPER;
              break;
            case SCISSOR:
              _switchResult_2 = Day2.RPC.ROCK;
              break;
            case PAPER:
              _switchResult_2 = Day2.RPC.SCISSOR;
              break;
            default:
              break;
          }
        }
        int _value_1 = Day2.value(_switchResult_2);
        _switchResult = (6 + _value_1);
      }
    }
    return _switchResult;
  }
}
