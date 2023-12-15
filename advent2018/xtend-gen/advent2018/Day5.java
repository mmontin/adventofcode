package advent2018;

import java.util.ArrayList;
import java.util.Collection;

import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day5 {
  public static void main(final String[] args) {
    final String line = IterableExtensions.<String>head(new InputLoader(Integer.valueOf(2018), Integer.valueOf(5)).getInputs());
    char[] _charArray = line.toCharArray();
    ArrayList<Character> _arrayList = new ArrayList<Character>((Collection<? extends Character>)Conversions.doWrapArray(_charArray));
    InputOutput.<Integer>println(Integer.valueOf(Day5.react(_arrayList)));
    final Function1<Integer, Integer> _function = (Integer i) -> {
      char[] _charArray_1 = line.replaceAll(Character.valueOf(((char) ((int) (i).intValue()))).toString(), "").replaceAll(Character.valueOf(((char) ((int) ((i).intValue() - 32)))).toString(), "").toCharArray();
      ArrayList<Character> _arrayList_1 = new ArrayList<Character>((Collection<? extends Character>)Conversions.doWrapArray(_charArray_1));
      return Integer.valueOf(Day5.react(_arrayList_1));
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer>min(IterableExtensions.<Integer, Integer>map(new IntegerRange(97, 122), _function)));
  }

  public static int react(final ArrayList<Character> line) {
    int _xblockexpression = (int) 0;
    {
      Integer index = null;
      do {
        {
          int _size = line.size();
          int _minus = (_size - 2);
          final Function1<Integer, Boolean> _function = (Integer it) -> {
            Character _get = line.get((it).intValue());
            Character _get_1 = line.get(((it).intValue() + 1));
            int _minus_1 = (((int) (_get).charValue()) - ((int) (_get_1).charValue()));
            int _abs = Math.abs(_minus_1);
            return Boolean.valueOf((_abs == 32));
          };
          index = IterableExtensions.<Integer>findFirst(new IntegerRange(0, _minus), _function);
          if ((index != null)) {
            line.remove(((int) (index).intValue()));
            line.remove(((int) (index).intValue()));
          }
        }
      } while((index != null));
      _xblockexpression = line.size();
    }
    return _xblockexpression;
  }
}
