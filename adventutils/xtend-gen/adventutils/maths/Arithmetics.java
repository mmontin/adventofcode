package adventutils.maths;

import java.math.BigInteger;
import java.util.Optional;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Arithmetics {
  public static long lcm(final long x1, final long x2) {
    long _xblockexpression = (long) 0;
    {
      long nb1 = x1;
      long nb2 = x2;
      long remainder = (nb1 % nb2);
      while ((remainder != 0)) {
        {
          nb1 = nb2;
          nb2 = remainder;
          remainder = (nb1 % nb2);
        }
      }
      _xblockexpression = ((x1 * x2) / nb2);
    }
    return _xblockexpression;
  }

  public static Optional<Pair<Pair<Integer, Integer>, Pair<Integer, Integer>>> diophantienne(final int a, final int b, final int c) {
    final Pair<Pair<Integer, Integer>, Integer> res = Arithmetics.euclidean(a, b);
    final Integer pgcd = res.getKey().getKey();
    final Integer u = res.getKey().getValue();
    final Integer v = res.getValue();
    if (((c % (pgcd).intValue()) != 0)) {
      return Optional.<Pair<Pair<Integer, Integer>, Pair<Integer, Integer>>>empty();
    } else {
      final int red = (c / (pgcd).intValue());
      Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(((u).intValue() * red)), Integer.valueOf((b / (pgcd).intValue())));
      Pair<Integer, Integer> _mappedTo_1 = Pair.<Integer, Integer>of(Integer.valueOf(((v).intValue() * red)), Integer.valueOf(((-a) / (pgcd).intValue())));
      Pair<Pair<Integer, Integer>, Pair<Integer, Integer>> _mappedTo_2 = Pair.<Pair<Integer, Integer>, Pair<Integer, Integer>>of(_mappedTo, _mappedTo_1);
      return Optional.<Pair<Pair<Integer, Integer>, Pair<Integer, Integer>>>of(_mappedTo_2);
    }
  }

  public static Pair<Pair<Integer, Integer>, Integer> euclidean(final int a, final int b) {
    Pair<Pair<Integer, Integer>, Integer> _xifexpression = null;
    if ((b == 0)) {
      Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(a), Integer.valueOf(1));
      _xifexpression = Pair.<Pair<Integer, Integer>, Integer>of(_mappedTo, Integer.valueOf(0));
    } else {
      Pair<Pair<Integer, Integer>, Integer> _xblockexpression = null;
      {
        final Pair<Pair<Integer, Integer>, Integer> rec = Arithmetics.euclidean(b, (a % b));
        final Integer d1 = rec.getKey().getKey();
        final Integer u1 = rec.getKey().getValue();
        final Integer v1 = rec.getValue();
        Pair<Integer, Integer> _mappedTo_1 = Pair.<Integer, Integer>of(d1, v1);
        _xblockexpression = Pair.<Pair<Integer, Integer>, Integer>of(_mappedTo_1, Integer.valueOf(((u1).intValue() - ((a / b) * (v1).intValue()))));
      }
      _xifexpression = _xblockexpression;
    }
    return _xifexpression;
  }

  public static BigInteger gcd(final BigInteger nb1, final BigInteger nb2) {
    BigInteger _xblockexpression = null;
    {
      BigInteger a = nb1.abs().max(nb2.abs());
      BigInteger b = nb1.abs().min(nb2.abs());
      BigInteger r = BigInteger.ZERO;
      do {
        {
          BigInteger _modulo = a.mod(b);
          r = _modulo;
          a = b;
          b = r;
        }
      } while((r.signum() != 0));
      _xblockexpression = a;
    }
    return _xblockexpression;
  }

  public static int gcd(final int nb1, final int nb2) {
    int _xblockexpression = (int) 0;
    {
      int a = Math.max(nb1, nb2);
      int b = Math.min(nb1, nb2);
      int r = 0;
      do {
        {
          r = (a % b);
          a = b;
          b = r;
        }
      } while((r != 0));
      _xblockexpression = a;
    }
    return _xblockexpression;
  }
}
