package adventutils;

import java.util.function.Function;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class MemoryRunner2<I extends Object, I2 extends Object, O extends Object> extends MemoryRunner<Pair<I, I2>, O> {
  public MemoryRunner2(final Function2<I, I2, O> fun) {
    super(
      new Function<Pair<I, I2>, O>() {
        public O apply(final Pair<I, I2> it) {
          return fun.apply(it.getKey(), it.getValue());
        }
      });
  }

  public O call(final I par1, final I2 par2) {
    Pair<I, I2> _mappedTo = Pair.<I, I2>of(par1, par2);
    return super.call(_mappedTo);
  }
}
