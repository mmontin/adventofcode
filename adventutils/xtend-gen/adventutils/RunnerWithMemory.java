package adventutils;

import java.util.Map;
import java.util.function.Function;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

@SuppressWarnings("all")
public class RunnerWithMemory<T extends Object, V extends Object> {
  private Map<T, V> results;

  private Function<T, V> fun;

  public RunnerWithMemory(final Function<T, V> fun_) {
    this.results = CollectionLiterals.<T, V>newHashMap();
    this.fun = fun_;
  }

  public V call(final T param) {
    V _xblockexpression = null;
    {
      final V prev_result = this.results.get(param);
      V _xifexpression = null;
      if ((prev_result != null)) {
        _xifexpression = prev_result;
      } else {
        V _xblockexpression_1 = null;
        {
          final V res = this.fun.apply(param);
          this.results.put(param, res);
          _xblockexpression_1 = res;
        }
        _xifexpression = _xblockexpression_1;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
