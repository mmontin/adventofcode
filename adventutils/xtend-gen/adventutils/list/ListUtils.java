package adventutils.list;

import java.util.List;

@SuppressWarnings("all")
public class ListUtils {
  public static <T extends Object, L extends List<T>> L cons(final T e, final L l) {
    L _xblockexpression = null;
    {
      l.add(e);
      _xblockexpression = l;
    }
    return _xblockexpression;
  }

  public static <T extends Object, U extends List<T>, V extends T> T getOrDefault(final U input, final V value) {
    T _xblockexpression = null;
    {
      final int index = input.indexOf(value);
      T _xifexpression = null;
      if ((index >= 0)) {
        _xifexpression = input.get(index);
      } else {
        V _xblockexpression_1 = null;
        {
          input.add(value);
          _xblockexpression_1 = value;
        }
        _xifexpression = _xblockexpression_1;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
