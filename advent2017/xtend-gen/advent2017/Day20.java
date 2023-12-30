package advent2017;

import adventutils.geometry.Triplet;
import adventutils.input.InputLoader;
import java.util.HashSet;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day20 {
  public static class Particle {
    private Triplet position;

    private Triplet velocity;

    private Triplet acceleration;

    public Particle(final String line) {
      final String[] split1 = line.split("<");
      String _get = (split1[1]).split(">")[0];
      Triplet _triplet = new Triplet(_get);
      this.position = _triplet;
      String _get_1 = (split1[2]).split(">")[0];
      Triplet _triplet_1 = new Triplet(_get_1);
      this.velocity = _triplet_1;
      String _get_2 = (split1[3]).split(">")[0];
      Triplet _triplet_2 = new Triplet(_get_2);
      this.acceleration = _triplet_2;
    }

    public Triplet update() {
      Triplet _xblockexpression = null;
      {
        this.velocity = this.velocity.add(this.acceleration);
        _xblockexpression = this.position = this.position.add(this.velocity);
      }
      return _xblockexpression;
    }

    public int hashCode() {
      return this.position.hashCode();
    }

    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day20.Particle) {
        _matched=true;
        _switchResult = ((Day20.Particle)other).position.equals(this.position);
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }
  }

  private static final List<String> input = new InputLoader(Integer.valueOf(2017), Integer.valueOf(20)).getInputs();

  public static void main(final String[] args) {
    final Function1<String, Integer> _function = new Function1<String, Integer>() {
      public Integer apply(final String it) {
        int _xblockexpression = (int) 0;
        {
          String last_part = it.split("a=<")[1];
          int _length = last_part.length();
          int _minus = (_length - 1);
          last_part = last_part.substring(0, _minus);
          final String[] splitty = last_part.split(",");
          final int a = Math.abs(Integer.parseInt(splitty[0]));
          final int b = Math.abs(Integer.parseInt(splitty[1]));
          final int c = Math.abs(Integer.parseInt(splitty[2]));
          _xblockexpression = ((a + b) + c);
        }
        return Integer.valueOf(_xblockexpression);
      }
    };
    final List<Integer> accs = ListExtensions.<String, Integer>map(Day20.input, _function);
    InputOutput.<Integer>println(Integer.valueOf(accs.lastIndexOf(IterableExtensions.<Integer>min(accs))));
    HashSet<Day20.Particle> particles = CollectionLiterals.<Day20.Particle>newHashSet();
    final Function1<String, Day20.Particle> _function_1 = new Function1<String, Day20.Particle>() {
      public Day20.Particle apply(final String it) {
        return new Day20.Particle(it);
      }
    };
    particles.addAll(ListExtensions.<String, Day20.Particle>map(Day20.input, _function_1));
    IntegerRange _upTo = new IntegerRange(0, 38);
    for (final Integer i : _upTo) {
      {
        final Consumer<Day20.Particle> _function_2 = new Consumer<Day20.Particle>() {
          public void accept(final Day20.Particle it) {
            it.update();
          }
        };
        particles.forEach(_function_2);
        final Function1<Day20.Particle, Triplet> _function_3 = new Function1<Day20.Particle, Triplet>() {
          public Triplet apply(final Day20.Particle it) {
            return it.position;
          }
        };
        final Function1<List<Day20.Particle>, Boolean> _function_4 = new Function1<List<Day20.Particle>, Boolean>() {
          public Boolean apply(final List<Day20.Particle> it) {
            int _size = it.size();
            return Boolean.valueOf((_size == 1));
          }
        };
        final Function2<List<Day20.Particle>, List<Day20.Particle>, List<Day20.Particle>> _function_5 = new Function2<List<Day20.Particle>, List<Day20.Particle>, List<Day20.Particle>>() {
          public List<Day20.Particle> apply(final List<Day20.Particle> p, final List<Day20.Particle> q) {
            List<Day20.Particle> _xblockexpression = null;
            {
              p.addAll(q);
              _xblockexpression = p;
            }
            return _xblockexpression;
          }
        };
        List<Day20.Particle> _reduce = IterableExtensions.<List<Day20.Particle>>reduce(IterableExtensions.<List<Day20.Particle>>filter(IterableExtensions.<Triplet, Day20.Particle>groupBy(particles, _function_3).values(), _function_4), _function_5);
        HashSet<Day20.Particle> _hashSet = new HashSet<Day20.Particle>(_reduce);
        particles = _hashSet;
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(particles.size()));
  }
}
