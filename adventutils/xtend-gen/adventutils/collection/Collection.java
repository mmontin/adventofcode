package adventutils.collection;

import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function2;

@SuppressWarnings("all")
public class Collection {
  public static <O extends Object, E extends Object, D extends Object> O aggregate(final Iterable<E> input, final Function2<E, O, D> fun, final O init) {
    O _xblockexpression = null;
    {
      final Consumer<E> _function = new Consumer<E>() {
        public void accept(final E it) {
          fun.apply(it, init);
        }
      };
      input.forEach(_function);
      _xblockexpression = init;
    }
    return _xblockexpression;
  }

  public static <K extends Object, V extends Object, E extends Object, D extends Object> Map<K, V> aggregateToMap(final Iterable<E> input, final Function2<E, Map<K, V>, D> fun) {
    return Collection.<Map<K, V>, E, D>aggregate(input, fun, CollectionLiterals.<K, V>newHashMap());
  }

  public static <K extends Object, E extends Object, D extends Object> List<K> aggregateToList(final Iterable<E> input, final Function2<E, List<K>, D> fun) {
    return Collection.<List<K>, E, D>aggregate(input, fun, CollectionLiterals.<K>newArrayList());
  }
}
