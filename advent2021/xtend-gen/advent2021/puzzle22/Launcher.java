package advent2021.puzzle22;

import adventutils.input.InputLoader;
import java.math.BigInteger;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    Set<Cuboid> cuboids = CollectionLiterals.<Cuboid>newHashSet();
    List<String> _inputs = new InputLoader(Integer.valueOf(2021), Integer.valueOf(22)).getInputs();
    for (final String s : _inputs) {
      {
        final String[] split = s.split(" ");
        final boolean on = (split[0]).equals("on");
        String _get = split[1];
        final Cuboid cuboid = new Cuboid(_get);
        final Function2<HashSet<Cuboid>, Cuboid, HashSet<Cuboid>> _function = new Function2<HashSet<Cuboid>, Cuboid, HashSet<Cuboid>>() {
          public HashSet<Cuboid> apply(final HashSet<Cuboid> set, final Cuboid c) {
            HashSet<Cuboid> _xblockexpression = null;
            {
              set.addAll(c.subtract(cuboid));
              _xblockexpression = set;
            }
            return _xblockexpression;
          }
        };
        cuboids = IterableExtensions.<Cuboid, HashSet<Cuboid>>fold(cuboids, CollectionLiterals.<Cuboid>newHashSet(), _function);
        if (on) {
          cuboids.add(cuboid);
        }
      }
    }
    final Function2<BigInteger, Cuboid, BigInteger> _function = new Function2<BigInteger, Cuboid, BigInteger>() {
      public BigInteger apply(final BigInteger v, final Cuboid c) {
        return v.add(c.size());
      }
    };
    InputOutput.<BigInteger>println(IterableExtensions.<Cuboid, BigInteger>fold(cuboids, BigInteger.ZERO, _function));
  }
}
