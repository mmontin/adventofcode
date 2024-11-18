package adventutils.collection;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

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

  public static <E extends Object> List<ArrayList<E>> permute(final List<E> inputs) {
    final ArrayList<ArrayList<E>> result = CollectionLiterals.<ArrayList<E>>newArrayList();
    if ((inputs != null)) {
      final int s1 = inputs.size();
      if ((s1 > 0)) {
        final Iterator<E> iter = inputs.iterator();
        while (iter.hasNext()) {
          {
            final E elt = iter.next();
            final int index = inputs.indexOf(elt);
            List<E> _subList = inputs.subList(0, index);
            final ArrayList<E> list2 = new ArrayList<E>(_subList);
            list2.addAll(inputs.subList((index + 1), s1));
            final Consumer<ArrayList<E>> _function = (ArrayList<E> it) -> {
              it.add(0, elt);
              result.add(it);
            };
            ListUtils.<E>permute(list2).forEach(_function);
          }
        }
      } else {
        ArrayList<E> _arrayList = new ArrayList<E>();
        result.add(_arrayList);
      }
    }
    return result;
  }
}
