package advent2018;

import adventutils.geometry.Interval;
import adventutils.geometry.Triplet;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day23 {
  public static class Sphere {
    private Triplet center;

    private int radius;

    public Sphere(final String s) {
      final String[] split = s.split("pos=<|>, r=");
      String _get = split[1];
      Triplet _triplet = new Triplet(_get);
      this.center = _triplet;
      this.radius = Integer.parseInt(split[2]);
    }

    public int distanceBetweenCenters(final Day23.Sphere other) {
      return this.center.manhattanDistanceTo(other.center);
    }

    public boolean intersectsWith(final Day23.Sphere other) {
      int _distanceBetweenCenters = this.distanceBetweenCenters(other);
      return (_distanceBetweenCenters <= (this.radius + other.radius));
    }

    @Override
    public int hashCode() {
      int _hashCode = this.center.hashCode();
      int _hashCode_1 = Integer.valueOf(this.radius).hashCode();
      return (_hashCode * _hashCode_1);
    }

    @Override
    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day23.Sphere) {
        _matched=true;
        _switchResult = (((Day23.Sphere)other).center.equals(this.center) && (((Day23.Sphere)other).radius == this.radius));
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }
  }

  public static class Equivalence {
    private Set<Day23.Sphere> elements;

    public Equivalence(final Pair<Day23.Sphere, Day23.Sphere> pair) {
      this.elements = CollectionLiterals.<Day23.Sphere>newHashSet(pair.getKey(), pair.getValue());
    }

    public boolean add(final Day23.Sphere sphere) {
      boolean _or = false;
      boolean _contains = this.elements.contains(sphere);
      if (_contains) {
        _or = true;
      } else {
        boolean _xblockexpression = false;
        {
          final Function1<Day23.Sphere, Boolean> _function = (Day23.Sphere it) -> {
            return Boolean.valueOf(sphere.intersectsWith(it));
          };
          final boolean belongs = IterableExtensions.<Day23.Sphere>forall(this.elements, _function);
          if (belongs) {
            this.elements.add(sphere);
          }
          _xblockexpression = belongs;
        }
        _or = _xblockexpression;
      }
      return _or;
    }

    public boolean add(final Pair<Day23.Sphere, Day23.Sphere> pair) {
      return (this.add(pair.getKey()) && this.add(pair.getValue()));
    }

    public List<Interval> approx() {
      List<Interval> _xblockexpression = null;
      {
        final Function1<Day23.Sphere, Interval> _function = (Day23.Sphere it) -> {
          return new Interval((it.center.x - it.radius), (it.center.x + it.radius));
        };
        final Function2<Interval, Interval, Interval> _function_1 = (Interval it1, Interval it2) -> {
          return it1.intersection(it2);
        };
        final Interval itv_x = IterableExtensions.<Interval>reduce(IterableExtensions.<Day23.Sphere, Interval>map(this.elements, _function), _function_1);
        final Function1<Day23.Sphere, Interval> _function_2 = (Day23.Sphere it) -> {
          return new Interval((it.center.y - it.radius), (it.center.y + it.radius));
        };
        final Function2<Interval, Interval, Interval> _function_3 = (Interval it1, Interval it2) -> {
          return it1.intersection(it2);
        };
        final Interval itv_y = IterableExtensions.<Interval>reduce(IterableExtensions.<Day23.Sphere, Interval>map(this.elements, _function_2), _function_3);
        final Function1<Day23.Sphere, Interval> _function_4 = (Day23.Sphere it) -> {
          return new Interval((it.center.z - it.radius), (it.center.z + it.radius));
        };
        final Function2<Interval, Interval, Interval> _function_5 = (Interval it1, Interval it2) -> {
          return it1.intersection(it2);
        };
        final Interval itv_z = IterableExtensions.<Interval>reduce(IterableExtensions.<Day23.Sphere, Interval>map(this.elements, _function_4), _function_5);
        _xblockexpression = Collections.<Interval>unmodifiableList(CollectionLiterals.<Interval>newArrayList(itv_x, itv_y, itv_z));
      }
      return _xblockexpression;
    }
  }

  public static void main(final String[] args) {
    final Function1<String, Day23.Sphere> _function = (String it) -> {
      return new Day23.Sphere(it);
    };
    final List<Day23.Sphere> spheres = ListExtensions.<String, Day23.Sphere>map(new InputLoader(Integer.valueOf(2018), Integer.valueOf(23)).getInputs(), _function);
    final Function1<Day23.Sphere, Integer> _function_1 = (Day23.Sphere it) -> {
      return Integer.valueOf(it.radius);
    };
    final Day23.Sphere max_radius = IterableExtensions.<Day23.Sphere, Integer>maxBy(spheres, _function_1);
    final Function1<Day23.Sphere, Boolean> _function_2 = (Day23.Sphere it) -> {
      int _distanceBetweenCenters = it.distanceBetweenCenters(max_radius);
      return Boolean.valueOf((_distanceBetweenCenters <= max_radius.radius));
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.size(IterableExtensions.<Day23.Sphere>filter(spheres, _function_2))));
    final HashSet<Pair<Day23.Sphere, Day23.Sphere>> intersections = CollectionLiterals.<Pair<Day23.Sphere, Day23.Sphere>>newHashSet();
    int _size = spheres.size();
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
    for (final Integer i : _doubleDotLessThan) {
      {
        final Day23.Sphere sphere_i = spheres.get((i).intValue());
        int _size_1 = spheres.size();
        ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((i).intValue() + 1), _size_1, true);
        for (final Integer j : _doubleDotLessThan_1) {
          {
            final Day23.Sphere sphere_j = spheres.get((j).intValue());
            boolean _intersectsWith = sphere_i.intersectsWith(sphere_j);
            if (_intersectsWith) {
              Pair<Day23.Sphere, Day23.Sphere> _mappedTo = Pair.<Day23.Sphere, Day23.Sphere>of(sphere_i, sphere_j);
              intersections.add(_mappedTo);
            }
          }
        }
      }
    }
    final Function2<ArrayList<Day23.Equivalence>, Pair<Day23.Sphere, Day23.Sphere>, ArrayList<Day23.Equivalence>> _function_3 = (ArrayList<Day23.Equivalence> acc, Pair<Day23.Sphere, Day23.Sphere> intersection) -> {
      ArrayList<Day23.Equivalence> _xblockexpression = null;
      {
        final Function1<Day23.Equivalence, Boolean> _function_4 = (Day23.Equivalence eq) -> {
          return Boolean.valueOf(eq.add(intersection));
        };
        boolean _exists = IterableExtensions.<Day23.Equivalence>exists(acc, _function_4);
        boolean _not = (!_exists);
        if (_not) {
          Day23.Equivalence _equivalence = new Day23.Equivalence(intersection);
          acc.add(_equivalence);
        }
        _xblockexpression = acc;
      }
      return _xblockexpression;
    };
    final List<Day23.Equivalence> equivalence_classes = IterableExtensions.<Pair<Day23.Sphere, Day23.Sphere>, ArrayList<Day23.Equivalence>>fold(intersections, CollectionLiterals.<Day23.Equivalence>newArrayList(), _function_3);
    final Function1<Day23.Equivalence, Integer> _function_4 = (Day23.Equivalence it) -> {
      return Integer.valueOf(it.elements.size());
    };
    final Day23.Equivalence right_class = IterableExtensions.<Day23.Equivalence, Integer>maxBy(equivalence_classes, _function_4);
    final Function1<Day23.Sphere, Integer> _function_5 = (Day23.Sphere it) -> {
      return Integer.valueOf(it.radius);
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.<Day23.Sphere, Integer>minBy(right_class.elements, _function_5).radius));
    InputOutput.<List<Interval>>println(right_class.approx());
    final Function1<Day23.Equivalence, Integer> _function_6 = (Day23.Equivalence it) -> {
      return Integer.valueOf(it.elements.size());
    };
    InputOutput.<List<Integer>>println(ListExtensions.<Day23.Equivalence, Integer>map(equivalence_classes, _function_6));
  }
}
