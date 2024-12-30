package advent2024;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day24 {
  public static class Link {
    private int id;

    private String left;

    private String right;

    private String operator;

    private String result;

    public Link(final String s, final int id_) {
      final String[] split = s.split(" ");
      this.left = split[0];
      this.right = split[2];
      this.operator = split[1];
      this.result = split[4];
      this.id = id_;
    }

    public boolean computable(final Map<String, Integer> valuations) {
      return (valuations.containsKey(this.left) && valuations.containsKey(this.right));
    }

    public Integer compute(final Map<String, Integer> valuations) {
      int _switchResult = (int) 0;
      final String operator = this.operator;
      if (operator != null) {
        switch (operator) {
          case "AND":
            _switchResult = ((valuations.get(this.left)).intValue() & (valuations.get(this.right)).intValue());
            break;
          case "OR":
            _switchResult = ((valuations.get(this.left)).intValue() | (valuations.get(this.right)).intValue());
            break;
          default:
            _switchResult = ((valuations.get(this.left)).intValue() ^ (valuations.get(this.right)).intValue());
            break;
        }
      } else {
        _switchResult = ((valuations.get(this.left)).intValue() ^ (valuations.get(this.right)).intValue());
      }
      return valuations.put(this.result, Integer.valueOf(_switchResult));
    }

    @Override
    public String toString() {
      return (((((((("[ " + this.left) + " ") + this.operator) + " ") + this.right) + " = ") + this.result) + " ]");
    }
  }

  public static void main(final String[] args) {
    try {
      final List<String> input = new InputLoader(Integer.valueOf(2024), Integer.valueOf(24)).getInputs();
      final int split_index = input.indexOf("");
      final Function2<HashMap<String, Integer>, String, HashMap<String, Integer>> _function = (HashMap<String, Integer> acc, String el) -> {
        HashMap<String, Integer> _xblockexpression = null;
        {
          final String[] split = el.split(": ");
          acc.put(split[0], Integer.valueOf(Integer.parseInt(split[1])));
          _xblockexpression = acc;
        }
        return _xblockexpression;
      };
      final HashMap<String, Integer> valuations = IterableExtensions.<String, HashMap<String, Integer>>fold(input.subList(0, split_index), CollectionLiterals.<String, Integer>newHashMap(), _function);
      List<String> _subList = input.subList((split_index + 1), input.size());
      HashSet<Day24.Link> _newHashSet = CollectionLiterals.<Day24.Link>newHashSet();
      Pair<HashSet<Day24.Link>, Integer> _mappedTo = Pair.<HashSet<Day24.Link>, Integer>of(_newHashSet, Integer.valueOf(0));
      final Function2<Pair<HashSet<Day24.Link>, Integer>, String, Pair<HashSet<Day24.Link>, Integer>> _function_1 = (Pair<HashSet<Day24.Link>, Integer> acc, String el) -> {
        Pair<HashSet<Day24.Link>, Integer> _xblockexpression = null;
        {
          Integer _value = acc.getValue();
          Day24.Link _link = new Day24.Link(el, (_value).intValue());
          acc.getKey().add(_link);
          HashSet<Day24.Link> _key = acc.getKey();
          Integer _value_1 = acc.getValue();
          int _plus = ((_value_1).intValue() + 1);
          _xblockexpression = Pair.<HashSet<Day24.Link>, Integer>of(_key, Integer.valueOf(_plus));
        }
        return _xblockexpression;
      };
      final HashSet<Day24.Link> rules = IterableExtensions.<String, Pair<HashSet<Day24.Link>, Integer>>fold(_subList, _mappedTo, _function_1).getKey();
      final HashMap<String, Day24.Link> treated_rules = CollectionLiterals.<String, Day24.Link>newHashMap();
      while ((!rules.isEmpty())) {
        {
          final Function1<Day24.Link, Boolean> _function_2 = (Day24.Link it) -> {
            return Boolean.valueOf(it.computable(valuations));
          };
          final Day24.Link rule = IterableExtensions.<Day24.Link>findFirst(rules, _function_2);
          rule.compute(valuations);
          rules.remove(rule);
          treated_rules.put(rule.result, rule);
        }
      }
      final Function1<Map.Entry<String, Integer>, Boolean> _function_2 = (Map.Entry<String, Integer> it) -> {
        return Boolean.valueOf(it.getKey().startsWith("z"));
      };
      final Function1<Map.Entry<String, Integer>, Integer> _function_3 = (Map.Entry<String, Integer> it) -> {
        int _parseInt = Integer.parseInt(it.getKey().substring(1));
        return Integer.valueOf((-_parseInt));
      };
      final Function1<Map.Entry<String, Integer>, String> _function_4 = (Map.Entry<String, Integer> it) -> {
        return it.getValue().toString();
      };
      InputOutput.<Long>println(Long.valueOf(Long.parseLong(IterableExtensions.join(ListExtensions.<Map.Entry<String, Integer>, String>map(IterableExtensions.<Map.Entry<String, Integer>, Integer>sortBy(IterableExtensions.<Map.Entry<String, Integer>>filter(valuations.entrySet(), _function_2), _function_3), _function_4)), 2)));
      final Function2<ArrayList<String>, String, ArrayList<String>> _function_5 = (ArrayList<String> acc, String el) -> {
        ArrayList<String> _xblockexpression = null;
        {
          final Function1<Day24.Link, Boolean> _function_6 = (Day24.Link it) -> {
            return Boolean.valueOf(Objects.equals(it.result, el));
          };
          final Day24.Link left_node = IterableExtensions.<Day24.Link>findFirst(treated_rules.values(), _function_6);
          String _xifexpression = null;
          if ((left_node == null)) {
            _xifexpression = el;
          } else {
            _xifexpression = ((left_node.operator + "_") + Integer.valueOf(left_node.id));
          }
          final String left_node_name = _xifexpression;
          final Function1<Day24.Link, Boolean> _function_7 = (Day24.Link it) -> {
            return Boolean.valueOf((Objects.equals(it.left, el) || Objects.equals(it.right, el)));
          };
          final Function1<Day24.Link, String> _function_8 = (Day24.Link it) -> {
            return (((it.operator + "_") + Integer.valueOf(it.id)) + "");
          };
          final Iterable<String> right_nodes = IterableExtensions.<Day24.Link, String>map(IterableExtensions.<Day24.Link>filter(treated_rules.values(), _function_7), _function_8);
          Iterable<String> _xifexpression_1 = null;
          int _size = IterableExtensions.size(right_nodes);
          boolean _equals = (_size == 0);
          if (_equals) {
            _xifexpression_1 = Collections.<String>unmodifiableList(CollectionLiterals.<String>newArrayList(el));
          } else {
            _xifexpression_1 = right_nodes;
          }
          final Iterable<String> right_nodes_names = _xifexpression_1;
          final Consumer<String> _function_9 = (String it) -> {
            acc.add((((((left_node_name + " -> ") + it) + " [label=\"") + el) + "\"]"));
          };
          right_nodes_names.forEach(_function_9);
          _xblockexpression = acc;
        }
        return _xblockexpression;
      };
      final ArrayList<String> edges = IterableExtensions.<String, ArrayList<String>>fold(valuations.keySet(), CollectionLiterals.<String>newArrayList(), _function_5);
      final Function2<String, String, String> _function_6 = (String acc, String el) -> {
        return (((acc + "\t") + el) + ";\n");
      };
      String _fold = IterableExtensions.<String, String>fold(edges, "digraph {\n", _function_6);
      final String graph = (_fold + "}");
      new ProcessBuilder("/bin/sh", "-c", (("echo \"" + graph) + "\"> ./xtend-src/advent2024/graph.svg")).start();
      InputOutput.<String>println(IterableExtensions.join(IterableExtensions.<String>sort(Collections.<String>unmodifiableList(CollectionLiterals.<String>newArrayList("z08", "thm", "wss", "wrm", "hwq", "z22", "gbs", "z29"))), ","));
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}
