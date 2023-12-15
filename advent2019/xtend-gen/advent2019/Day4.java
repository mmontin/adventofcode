package advent2019;

import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;

import com.google.common.base.Objects;

@SuppressWarnings("all")
public class Day4 {
  private static final int MIN = 197487;

  private static final int MAX = 673251;

  public static void main(final String[] args) {
    int nb1 = 0;
    int nb2 = 0;
    IntegerRange _upTo = new IntegerRange(1, 9);
    for (final Integer i : _upTo) {
      IntegerRange _upTo_1 = new IntegerRange((i).intValue(), 9);
      for (final Integer j : _upTo_1) {
        IntegerRange _upTo_2 = new IntegerRange((j).intValue(), 9);
        for (final Integer k : _upTo_2) {
          IntegerRange _upTo_3 = new IntegerRange((k).intValue(), 9);
          for (final Integer l : _upTo_3) {
            IntegerRange _upTo_4 = new IntegerRange((l).intValue(), 9);
            for (final Integer m : _upTo_4) {
              IntegerRange _upTo_5 = new IntegerRange((m).intValue(), 9);
              for (final Integer n : _upTo_5) {
                {
                  final int x = ((((((n).intValue() + ((m).intValue() * 10)) + ((l).intValue() * 100)) + ((k).intValue() * 1000)) + ((j).intValue() * 10000)) + ((i).intValue() * 100000));
                  if (((x >= Day4.MIN) && (x <= Day4.MAX))) {
                    if (((((Objects.equal(i, j) || Objects.equal(j, k)) || Objects.equal(k, l)) || Objects.equal(l, m)) || Objects.equal(m, n))) {
                      nb1++;
                    }
                    if ((((((Objects.equal(i, j) && (!Objects.equal(j, k))) || ((Objects.equal(j, k) && (!Objects.equal(i, j))) && (!Objects.equal(k, l)))) || ((Objects.equal(k, l) && (!Objects.equal(j, k))) && (!Objects.equal(l, m)))) || ((Objects.equal(l, m) && (!Objects.equal(k, l))) && (!Objects.equal(m, n)))) || (Objects.equal(m, n) && (!Objects.equal(l, m))))) {
                      nb2++;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(nb1));
    InputOutput.<Integer>println(Integer.valueOf(nb2));
  }
}
