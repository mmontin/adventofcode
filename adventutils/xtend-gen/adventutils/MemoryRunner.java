package adventutils;

import java.util.Map;
import java.util.function.Function;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

@SuppressWarnings("all")
public class MemoryRunner<I extends Object, O extends Object> {
  public Map<I, O> results;

  private Function<I, O> fun;

  private int calls_saved;

  public MemoryRunner(final Function<I, O> fun_) {
    this();
    this.bind(fun_);
  }

  public MemoryRunner() {
    this.results = CollectionLiterals.<I, O>newHashMap();
    this.calls_saved = 0;
  }

  public MemoryRunner<I, O> bind(final Function<I, O> fun_) {
    MemoryRunner<I, O> _xblockexpression = null;
    {
      this.fun = fun_;
      _xblockexpression = this;
    }
    return _xblockexpression;
  }

  public O call(final I param) {
    O _xifexpression = null;
    boolean _containsKey = this.results.containsKey(param);
    if (_containsKey) {
      O _xblockexpression = null;
      {
        this.calls_saved++;
        _xblockexpression = this.obtain(param);
      }
      _xifexpression = _xblockexpression;
    } else {
      O _xblockexpression_1 = null;
      {
        final O res = this.fun.apply(param);
        this.results.put(param, res);
        _xblockexpression_1 = res;
      }
      _xifexpression = _xblockexpression_1;
    }
    return _xifexpression;
  }

  protected O obtain(final I param) {
    return this.results.get(param);
  }

  public int reset() {
    int _xblockexpression = (int) 0;
    {
      this.results.clear();
      _xblockexpression = this.calls_saved = 0;
    }
    return _xblockexpression;
  }

  public int saved() {
    return this.calls_saved;
  }
}
