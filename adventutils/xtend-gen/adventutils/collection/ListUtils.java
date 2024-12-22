package adventutils.collection;

import com.google.common.collect.Iterables;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

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

  public static <T extends Object> Set<List<T>> intertwine(final List<T> l1, final List<T> l2) {
    HashSet<List<T>> _xifexpression = null;
    boolean _isEmpty = l1.isEmpty();
    if (_isEmpty) {
      _xifexpression = CollectionLiterals.<List<T>>newHashSet(l2);
    } else {
      HashSet<List<T>> _xifexpression_1 = null;
      boolean _isEmpty_1 = l2.isEmpty();
      if (_isEmpty_1) {
        _xifexpression_1 = CollectionLiterals.<List<T>>newHashSet(l1);
      } else {
        HashSet<List<T>> _xblockexpression = null;
        {
          final T head1 = IterableExtensions.<T>head(l1);
          final List<T> tail1 = IterableExtensions.<T>toList(IterableExtensions.<T>tail(l1));
          final T head2 = IterableExtensions.<T>head(l2);
          final List<T> tail2 = IterableExtensions.<T>toList(IterableExtensions.<T>tail(l2));
          final HashSet<List<T>> res = CollectionLiterals.<List<T>>newHashSet();
          final Function1<List<T>, List<T>> _function = (List<T> it) -> {
            List<T> _xblockexpression_1 = null;
            {
              it.add(0, head1);
              _xblockexpression_1 = it;
            }
            return _xblockexpression_1;
          };
          Iterables.<List<T>>addAll(res, IterableExtensions.<List<T>, List<T>>map(ListUtils.<T>intertwine(tail1, l2), _function));
          final Function1<List<T>, List<T>> _function_1 = (List<T> it) -> {
            List<T> _xblockexpression_1 = null;
            {
              it.add(0, head2);
              _xblockexpression_1 = it;
            }
            return _xblockexpression_1;
          };
          Iterables.<List<T>>addAll(res, IterableExtensions.<List<T>, List<T>>map(ListUtils.<T>intertwine(l1, tail2), _function_1));
          _xblockexpression = res;
        }
        _xifexpression_1 = _xblockexpression;
      }
      _xifexpression = _xifexpression_1;
    }
    return _xifexpression;
  }
}
