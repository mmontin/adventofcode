package adventutils;

import java.util.Map;
import java.util.function.Function;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

@SuppressWarnings("all")
public class MemoryRunner<I extends Object, O extends Object> {
  private Map<I, O> results;

  private Function<I, O> fun;

  public MemoryRunner(final Function<I, O> fun_) {
    this.results = CollectionLiterals.<I, O>newHashMap();
    this.fun = fun_;
  }

  public O call(final I param) {
    O _xblockexpression = null;
    {
      final O prev_result = this.results.get(param);
      O _xifexpression = null;
      if ((prev_result != null)) {
        _xifexpression = prev_result;
      } else {
        O _xblockexpression_1 = null;
        {
          final O res = this.fun.apply(param);
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
