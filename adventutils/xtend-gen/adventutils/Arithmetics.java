package adventutils;

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
}
