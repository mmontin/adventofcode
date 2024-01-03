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
    final Consumer<Map.Entry<K, HashSet<V>>> _function = new Consumer<Map.Entry<K, HashSet<V>>>() {
      public void accept(final Map.Entry<K, HashSet<V>> it) {
        K _key = it.getKey();
        HashSet<V> _value = it.getValue();
        HashSet<V> _hashSet = new HashSet<V>(_value);
        BiMap.this.left_right.put(_key, _hashSet);
      }
    };
    other.left_right.entrySet().forEach(_function);
    this.right_left = CollectionLiterals.<V, HashSet<K>>newHashMap();
    final Consumer<Map.Entry<V, HashSet<K>>> _function_1 = new Consumer<Map.Entry<V, HashSet<K>>>() {
      public void accept(final Map.Entry<V, HashSet<K>> it) {
        V _key = it.getKey();
        HashSet<K> _value = it.getValue();
        HashSet<K> _hashSet = new HashSet<K>(_value);
        BiMap.this.right_left.put(_key, _hashSet);
      }
    };
    other.right_left.entrySet().forEach(_function_1);
  }

  public HashSet<K> put(final K key, final V value) {
    HashSet<K> _xblockexpression = null;
    {
      final BiFunction<HashSet<V>, HashSet<V>, HashSet<V>> _function = new BiFunction<HashSet<V>, HashSet<V>, HashSet<V>>() {
        public HashSet<V> apply(final HashSet<V> x, final HashSet<V> y) {
          HashSet<V> _xblockexpression = null;
          {
            x.addAll(y);
            _xblockexpression = x;
          }
          return _xblockexpression;
        }
      };
      this.left_right.merge(key, CollectionLiterals.<V>newHashSet(value), _function);
      final BiFunction<HashSet<K>, HashSet<K>, HashSet<K>> _function_1 = new BiFunction<HashSet<K>, HashSet<K>, HashSet<K>>() {
        public HashSet<K> apply(final HashSet<K> x, final HashSet<K> y) {
          HashSet<K> _xblockexpression = null;
          {
            x.addAll(y);
            _xblockexpression = x;
          }
          return _xblockexpression;
        }
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
      final Consumer<V> _function = new Consumer<V>() {
        public void accept(final V it) {
          BiMap.this.right_left.get(it).remove(key);
        }
      };
      value.forEach(_function);
      _xblockexpression = value;
    }
    return _xblockexpression;
  }
}
