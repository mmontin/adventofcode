package advent2019;

import java.util.Objects;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;

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
                    if (((((Objects.equals(i, j) || Objects.equals(j, k)) || Objects.equals(k, l)) || Objects.equals(l, m)) || Objects.equals(m, n))) {
                      nb1++;
                    }
                    if ((((((Objects.equals(i, j) && (!Objects.equals(j, k))) || ((Objects.equals(j, k) && (!Objects.equals(i, j))) && (!Objects.equals(k, l)))) || ((Objects.equals(k, l) && (!Objects.equals(j, k))) && (!Objects.equals(l, m)))) || ((Objects.equals(l, m) && (!Objects.equals(k, l))) && (!Objects.equals(m, n)))) || (Objects.equals(m, n) && (!Objects.equals(l, m))))) {
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
