package advent2018;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day3 {
  public static class Rectangle {
    private int name;

    private Set<Coordinate> coordinates;

    public Rectangle(final String s) {
      final String[] split1 = s.split(" @ ");
      this.name = Integer.parseInt((split1[0]).replace("#", ""));
      final String[] split2 = (split1[1]).split(": ");
      String _get = split2[0];
      final Coordinate origin = new Coordinate(_get);
      String _replace = (split2[1]).replace("x", ",");
      final Coordinate size = new Coordinate(_replace);
      this.coordinates = CollectionLiterals.<Coordinate>newHashSet();
      int _x = size.getX();
      final Consumer<Integer> _function = (Integer i) -> {
        int _y = size.getY();
        final Consumer<Integer> _function_1 = (Integer j) -> {
          int _x_1 = origin.getX();
          int _plus = (_x_1 + (i).intValue());
          int _y_1 = origin.getY();
          int _plus_1 = (_y_1 + (j).intValue());
          Coordinate _coordinate = new Coordinate(_plus, _plus_1);
          this.coordinates.add(_coordinate);
        };
        new ExclusiveRange(0, _y, true).forEach(_function_1);
      };
      new ExclusiveRange(0, _x, true).forEach(_function);
    }
  }

  public static void main(final String[] args) {
    final Function1<String, Day3.Rectangle> _function = (String it) -> {
      return new Day3.Rectangle(it);
    };
    final List<Day3.Rectangle> rectangles = ListExtensions.<String, Day3.Rectangle>map(new InputLoader(Integer.valueOf(2018), Integer.valueOf(3)).getInputs(), _function);
    final Function2<ArrayList<Coordinate>, Day3.Rectangle, ArrayList<Coordinate>> _function_1 = (ArrayList<Coordinate> acc, Day3.Rectangle v) -> {
      ArrayList<Coordinate> _xblockexpression = null;
      {
        acc.addAll(v.coordinates);
        _xblockexpression = acc;
      }
      return _xblockexpression;
    };
    final ArrayList<Coordinate> coordinates = IterableExtensions.<Day3.Rectangle, ArrayList<Coordinate>>fold(rectangles, CollectionLiterals.<Coordinate>newArrayList(), _function_1);
    final Function1<Coordinate, Coordinate> _function_2 = (Coordinate it) -> {
      return it;
    };
    final Collection<List<Coordinate>> groups = IterableExtensions.<Coordinate, Coordinate>groupBy(coordinates, _function_2).values();
    final Function1<List<Coordinate>, Boolean> _function_3 = (List<Coordinate> it) -> {
      int _size = it.size();
      return Boolean.valueOf((_size >= 2));
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.size(IterableExtensions.<List<Coordinate>>filter(groups, _function_3))));
    final Function1<List<Coordinate>, Boolean> _function_4 = (List<Coordinate> it) -> {
      int _size = it.size();
      return Boolean.valueOf((_size == 1));
    };
    final Function1<List<Coordinate>, Set<Coordinate>> _function_5 = (List<Coordinate> it) -> {
      return IterableExtensions.<Coordinate>toSet(it);
    };
    final Function2<Set<Coordinate>, Set<Coordinate>, Set<Coordinate>> _function_6 = (Set<Coordinate> u, Set<Coordinate> v) -> {
      Set<Coordinate> _xblockexpression = null;
      {
        u.addAll(v);
        _xblockexpression = u;
      }
      return _xblockexpression;
    };
    final Set<Coordinate> untouched = IterableExtensions.<Set<Coordinate>>reduce(IterableExtensions.<List<Coordinate>, Set<Coordinate>>map(IterableExtensions.<List<Coordinate>>filter(groups, _function_4), _function_5), _function_6);
    int i = 0;
    boolean changed = true;
    while (((i < rectangles.size()) && changed)) {
      {
        changed = rectangles.get(i).coordinates.retainAll(untouched);
        i++;
      }
    }
    i--;
    InputOutput.<Integer>println(Integer.valueOf(rectangles.get(i).name));
  }
}
