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
}
