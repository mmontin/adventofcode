package advent2019;

import adventutils.collection.ListUtils;
import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.State;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day6 {
  public static class Planet implements State {
    private String name;

    private Set<Day6.Planet> children;

    private Day6.Planet parent;

    public Planet(final String name_) {
      this.name = name_;
      this.children = CollectionLiterals.<Day6.Planet>newHashSet();
      this.parent = null;
    }

    public Day6.Planet addChild(final Day6.Planet child) {
      Day6.Planet _xblockexpression = null;
      {
        this.children.add(child);
        _xblockexpression = child.parent = this;
      }
      return _xblockexpression;
    }

    @Override
    public int hashCode() {
      return this.name.hashCode();
    }

    @Override
    public boolean equals(final Object other) {
      return ((Day6.Planet) other).name.equals(this.name);
    }

    @Override
    public boolean isGoal() {
      return this.name.equals("SAN");
    }

    @Override
    public int minToGoal() {
      return 0;
    }

    @Override
    public Iterable<Pair<? extends State, Integer>> neighbours() {
      Iterable<Pair<? extends State, Integer>> _xblockexpression = null;
      {
        final HashSet<Day6.Planet> output = new HashSet<Day6.Planet>(this.children);
        if ((this.parent != null)) {
          output.add(this.parent);
        }
        final Function1<Day6.Planet, Pair<? extends State, Integer>> _function = (Day6.Planet it) -> {
          return Pair.<Day6.Planet, Integer>of(it, Integer.valueOf(1));
        };
        _xblockexpression = IterableExtensions.<Day6.Planet, Pair<? extends State, Integer>>map(output, _function);
      }
      return _xblockexpression;
    }
  }

  public static void main(final String[] args) {
    final List<Day6.Planet> orbits = CollectionLiterals.<Day6.Planet>newArrayList();
    final Consumer<String> _function = (String it) -> {
      final String[] split = it.split("\\)");
      String _get = split[1];
      Day6.Planet _planet = new Day6.Planet(_get);
      final Day6.Planet child = ListUtils.<Day6.Planet, List<Day6.Planet>, Day6.Planet>getOrDefault(orbits, _planet);
      String _get_1 = split[0];
      Day6.Planet _planet_1 = new Day6.Planet(_get_1);
      final Day6.Planet parent = ListUtils.<Day6.Planet, List<Day6.Planet>, Day6.Planet>getOrDefault(orbits, _planet_1);
      parent.addChild(child);
    };
    new InputLoader(Integer.valueOf(2019), Integer.valueOf(6)).getInputs().forEach(_function);
    final Function1<Day6.Planet, Boolean> _function_1 = (Day6.Planet it) -> {
      return Boolean.valueOf(it.name.equals("COM"));
    };
    final Day6.Planet init = IterableExtensions.<Day6.Planet>findFirst(orbits, _function_1);
    InputOutput.<Integer>println(Integer.valueOf(Day6.compute(init, 0)));
    final Function1<Day6.Planet, Boolean> _function_2 = (Day6.Planet it) -> {
      return Boolean.valueOf(it.name.equals("YOU"));
    };
    final Day6.Planet you = IterableExtensions.<Day6.Planet>findFirst(orbits, _function_2);
    Integer _minDistance = new AStar(you).run().getMinDistance();
    int _minus = ((_minDistance).intValue() - 2);
    InputOutput.<Integer>println(Integer.valueOf(_minus));
  }

  public static int compute(final Day6.Planet p, final int seed) {
    final Function2<Integer, Day6.Planet, Integer> _function = (Integer acc, Day6.Planet el) -> {
      int _compute = Day6.compute(el, (seed + 1));
      return Integer.valueOf(((acc).intValue() + _compute));
    };
    return (int) IterableExtensions.<Day6.Planet, Integer>fold(p.children, Integer.valueOf(seed), _function);
  }
}
