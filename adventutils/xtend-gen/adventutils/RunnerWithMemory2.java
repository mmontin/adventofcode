package adventutils;

import java.util.function.Function;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class RunnerWithMemory2<T extends Object, T2 extends Object, V extends Object> extends MemoryRunner<Pair<T, T2>, V> {
  public RunnerWithMemory2(final Function2<T, T2, V> fun) {
    super(
      new Function<Pair<T, T2>, V>() {
        public V apply(final Pair<T, T2> it) {
          return fun.apply(it.getKey(), it.getValue());
        }
      });
  }

  public V call(final T par1, final T2 par2) {
    Pair<T, T2> _mappedTo = Pair.<T, T2>of(par1, par2);
    return super.call(_mappedTo);
  }
}
