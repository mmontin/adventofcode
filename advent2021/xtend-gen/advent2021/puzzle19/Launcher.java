package advent2021.puzzle19;

import advent2021.Utils;
import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  public static final Matrix RxPi2 = new Matrix(new int[][] { new int[] { 1, 0, 0 }, new int[] { 0, 0, (-1) }, new int[] { 0, 1, 0 } });
  
  public static final Matrix RxPi = new Matrix(new int[][] { new int[] { 1, 0, 0 }, new int[] { 0, (-1), 0 }, new int[] { 0, 0, (-1) } });
  
  public static final Matrix RxmPi2 = new Matrix(new int[][] { new int[] { 1, 0, 0 }, new int[] { 0, 0, 1 }, new int[] { 0, (-1), 0 } });
  
  public static final Matrix RyPi2 = new Matrix(new int[][] { new int[] { 0, 0, 1 }, new int[] { 0, 1, 0 }, new int[] { (-1), 0, 0 } });
  
  public static final Matrix RyPi = new Matrix(new int[][] { new int[] { (-1), 0, 0 }, new int[] { 0, 1, 0 }, new int[] { 0, 0, (-1) } });
  
  public static final Matrix RymPi2 = new Matrix(new int[][] { new int[] { 0, 0, (-1) }, new int[] { 0, 1, 0 }, new int[] { 1, 0, 0 } });
  
  public static final Matrix RzPi2 = new Matrix(new int[][] { new int[] { 0, (-1), 0 }, new int[] { 1, 0, 0 }, new int[] { 0, 0, 1 } });
  
  public static final Matrix RzPi = new Matrix(new int[][] { new int[] { (-1), 0, 0 }, new int[] { 0, (-1), 0 }, new int[] { 0, 0, 1 } });
  
  public static final Matrix RzmPi2 = new Matrix(new int[][] { new int[] { 0, 1, 0 }, new int[] { (-1), 0, 0 }, new int[] { 0, 0, 1 } });
  
  public static void main(final String[] args) {
    try {
      final ArrayList<List<Vector>> data = CollectionLiterals.<List<Vector>>newArrayList();
      final BufferedReader inputReader = Utils.getInputReader(19);
      String tmp_string = null;
      List<Vector> tmp = null;
      while (((tmp_string = inputReader.readLine()) != null)) {
        boolean _contains = tmp_string.contains("scanner");
        if (_contains) {
          tmp = CollectionLiterals.<Vector>newArrayList();
        } else {
          boolean _isEmpty = tmp_string.isEmpty();
          if (_isEmpty) {
            data.add(tmp);
          } else {
            Vector _vector = new Vector(tmp_string);
            tmp.add(_vector);
          }
        }
      }
      final ArrayList<HashSet<Integer>> distances = CollectionLiterals.<HashSet<Integer>>newArrayList();
      final Consumer<List<Vector>> _function = new Consumer<List<Vector>>() {
        public void accept(final List<Vector> it) {
          final HashSet<Integer> dists = CollectionLiterals.<Integer>newHashSet();
          int _size = it.size();
          ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
          for (final Integer i : _doubleDotLessThan) {
            int _size_1 = it.size();
            ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((i).intValue() + 1), _size_1, true);
            for (final Integer j : _doubleDotLessThan_1) {
              dists.add(Integer.valueOf(it.get((i).intValue()).to(it.get((j).intValue())).size2()));
            }
          }
          distances.add(dists);
        }
      };
      data.forEach(_function);
      int _size = distances.size();
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
      for (final Integer i : _doubleDotLessThan) {
        int _size_1 = distances.size();
        ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((i).intValue() + 1), _size_1, true);
        for (final Integer j : _doubleDotLessThan_1) {
          {
            HashSet<Integer> _get = distances.get((i).intValue());
            HashSet<Integer> intersection = new HashSet<Integer>(_get);
            intersection.retainAll(distances.get((j).intValue()));
            int _size_2 = intersection.size();
            boolean _greaterThan = (_size_2 > 0);
            if (_greaterThan) {
              InputOutput.<String>println((((("(" + i) + ",") + j) + ")"));
              InputOutput.<Integer>println(Integer.valueOf(intersection.size()));
              InputOutput.<String>println("------------------");
            }
          }
        }
      }
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}
