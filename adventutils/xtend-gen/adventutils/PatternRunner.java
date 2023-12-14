package adventutils;

import java.util.ArrayList;
import java.util.function.Function;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

@SuppressWarnings("all")
public class PatternRunner {
  public static <T extends Object> T executeAndFindState(final T initial, final int rank, final Function<T, T> fun) {
    T _xblockexpression = null;
    {
      final ArrayList<T> values = CollectionLiterals.<T>newArrayList();
      T current = initial;
      int i = 0;
      int pos = (-1);
      while ((pos == (-1))) {
        {
          values.add(current);
          current = fun.apply(current);
          i++;
          pos = values.indexOf(current);
        }
      }
      _xblockexpression = values.get((((rank - pos) % (i - pos)) + pos));
    }
    return _xblockexpression;
  }
}
