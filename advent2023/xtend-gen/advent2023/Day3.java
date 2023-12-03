package advent2023;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day3 {
  private static final List<String> grid = new InputLoader(Integer.valueOf(2023), Integer.valueOf(3)).getInputs();

  private static final int maxX = Day3.grid.size();

  private static final int maxY = Day3.grid.get(0).length();

  private static final Pattern number = Pattern.compile("\\d+");

  public static void main(final String[] args) {
    final String emptyLine = ".".repeat(Day3.maxY);
    Day3.grid.add(emptyLine);
    Day3.grid.add(0, emptyLine);
    int sum = 0;
    IntegerRange _upTo = new IntegerRange(1, Day3.maxX);
    for (final Integer i : _upTo) {
      {
        final Matcher matcher = Day3.number.matcher(Day3.grid.get((i).intValue()));
        while (matcher.find()) {
          {
            final String matched = matcher.group();
            int _start = matcher.start();
            final int prev = (_start - 1);
            final int end = matcher.end();
            if ((((Day3.hasSymbol(prev, end, Day3.grid.get(((i).intValue() - 1))) || 
              Day3.hasSymbol(prev, end, Day3.grid.get(((i).intValue() + 1)))) || 
              Day3.isSymbol(prev, Day3.grid.get((i).intValue()))) || 
              Day3.isSymbol(end, Day3.grid.get((i).intValue())))) {
              int _sum = sum;
              int _parseInt = Integer.parseInt(matched);
              sum = (_sum + _parseInt);
            }
          }
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(sum));
  }

  public static boolean hasSymbol(final int i, final int j, final String s) {
    final Function2<Boolean, Integer, Boolean> _function = new Function2<Boolean, Integer, Boolean>() {
      public Boolean apply(final Boolean acc, final Integer e) {
        return Boolean.valueOf(((acc).booleanValue() || Day3.isSymbol((e).intValue(), s)));
      }
    };
    return (boolean) IterableExtensions.<Integer, Boolean>fold(new IntegerRange(i, j), Boolean.valueOf(false), _function);
  }

  public static boolean isSymbol(final int i, final String s) {
    boolean _switchResult = false;
    boolean _matched = false;
    if ((i < 0)) {
      _matched=true;
      _switchResult = false;
    }
    if (!_matched) {
      int _length = s.length();
      boolean _greaterEqualsThan = (i >= _length);
      if (_greaterEqualsThan) {
        _matched=true;
        _switchResult = false;
      }
    }
    if (!_matched) {
      _switchResult = Day3.isSymbol(Character.valueOf(s.charAt(i)));
    }
    return _switchResult;
  }

  public static boolean isSymbol(final Character c) {
    boolean _xblockexpression = false;
    {
      final int cAsInt = ((int) (c).charValue());
      boolean _switchResult = false;
      boolean _matched = false;
      if (((cAsInt >= 49) && (cAsInt <= 57))) {
        _matched=true;
        _switchResult = false;
      }
      if (!_matched) {
        if (Objects.equal(cAsInt, 46)) {
          _matched=true;
          _switchResult = false;
        }
      }
      if (!_matched) {
        _switchResult = true;
      }
      _xblockexpression = _switchResult;
    }
    return _xblockexpression;
  }
}
