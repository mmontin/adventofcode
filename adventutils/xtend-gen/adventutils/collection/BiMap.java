package adventutils.collection;

import java.util.HashSet;
import java.util.Map;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

@SuppressWarnings("all")
public class BiMap<K extends Object, V extends Object> {
  public final Map<K, HashSet<V>> left_right;

  public final Map<V, HashSet<K>> right_left;

  public BiMap() {
    this.left_right = CollectionLiterals.<K, HashSet<V>>newHashMap();
    this.right_left = CollectionLiterals.<V, HashSet<K>>newHashMap();
  }

  public BiMap(final BiMap<K, V> other) {
    this.left_right = CollectionLiterals.<K, HashSet<V>>newHashMap();
    final Consumer<Map.Entry<K, HashSet<V>>> _function = (Map.Entry<K, HashSet<V>> it) -> {
      K _key = it.getKey();
      HashSet<V> _value = it.getValue();
      HashSet<V> _hashSet = new HashSet<V>(_value);
      this.left_right.put(_key, _hashSet);
    };
    other.left_right.entrySet().forEach(_function);
    this.right_left = CollectionLiterals.<V, HashSet<K>>newHashMap();
    final Consumer<Map.Entry<V, HashSet<K>>> _function_1 = (Map.Entry<V, HashSet<K>> it) -> {
      V _key = it.getKey();
      HashSet<K> _value = it.getValue();
      HashSet<K> _hashSet = new HashSet<K>(_value);
      this.right_left.put(_key, _hashSet);
    };
    other.right_left.entrySet().forEach(_function_1);
  }

  public HashSet<K> put(final K key, final V value) {
    HashSet<K> _xblockexpression = null;
    {
      final BiFunction<HashSet<V>, HashSet<V>, HashSet<V>> _function = (HashSet<V> x, HashSet<V> y) -> {
        HashSet<V> _xblockexpression_1 = null;
        {
          x.addAll(y);
          _xblockexpression_1 = x;
        }
        return _xblockexpression_1;
      };
      this.left_right.merge(key, CollectionLiterals.<V>newHashSet(value), _function);
      final BiFunction<HashSet<K>, HashSet<K>, HashSet<K>> _function_1 = (HashSet<K> x, HashSet<K> y) -> {
        HashSet<K> _xblockexpression_1 = null;
        {
          x.addAll(y);
          _xblockexpression_1 = x;
        }
        return _xblockexpression_1;
      };
      _xblockexpression = this.right_left.merge(value, CollectionLiterals.<K>newHashSet(key), _function_1);
    }
    return _xblockexpression;
  }

  public HashSet<V> rm(final K key) {
    HashSet<V> _xblockexpression = null;
    {
      final HashSet<V> value = this.left_right.getOrDefault(key, CollectionLiterals.<V>newHashSet());
      this.left_right.remove(key);
      final Consumer<V> _function = (V it) -> {
        this.right_left.get(it).remove(key);
      };
      value.forEach(_function);
      _xblockexpression = value;
    }
    return _xblockexpression;
  }
}
