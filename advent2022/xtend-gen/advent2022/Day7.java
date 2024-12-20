package advent2022;

import adventutils.input.InputLoader;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day7 {
  public static class Folder {
    public Day7.Folder parent;

    public int size;

    private Map<String, Day7.Folder> content;

    public Folder(final String _name, final Day7.Folder _parent) {
      this.parent = _parent;
      this.size = 0;
      this.content = CollectionLiterals.<String, Day7.Folder>newHashMap();
      if ((this.parent != null)) {
        this.parent.content.put(_name, this);
      }
    }

    public void addSize(final int toAdd) {
      int _size = this.size;
      this.size = (_size + toAdd);
      if ((this.parent != null)) {
        this.parent.addSize(toAdd);
      }
    }
  }

  private static final Day7.Folder root = new Day7.Folder("root", null);

  private static Day7.Folder current = Day7.root;

  private static final List<Day7.Folder> folders = CollectionLiterals.<Day7.Folder>newArrayList(Day7.root);

  public static void main(final String[] args) {
    final Consumer<String> _function = (String it) -> {
      String _xifexpression = null;
      boolean _startsWith = it.startsWith("$");
      if (_startsWith) {
        _xifexpression = it.substring(2);
      } else {
        _xifexpression = it;
      }
      final String toProcess = _xifexpression;
      final String[] parts = toProcess.split(" ");
      String _get = parts[0];
      final String x = _get;
      if (x != null) {
        switch (x) {
          case "cd":
            Day7.Folder _switchResult_1 = null;
            String _get_1 = parts[1];
            final String destination = _get_1;
            if (destination != null) {
              switch (destination) {
                case "/":
                  _switchResult_1 = Day7.root;
                  break;
                case "..":
                  _switchResult_1 = Day7.current.parent;
                  break;
                default:
                  _switchResult_1 = Day7.current.content.get(destination);
                  break;
              }
            } else {
              _switchResult_1 = Day7.current.content.get(destination);
            }
            Day7.current = _switchResult_1;
            break;
          case "ls":
            return;
          case "dir":
            String _get_2 = parts[1];
            Day7.Folder _folder = new Day7.Folder(_get_2, Day7.current);
            Day7.folders.add(_folder);
            break;
          default:
            Day7.current.addSize(Integer.parseInt(x));
            break;
        }
      } else {
        Day7.current.addSize(Integer.parseInt(x));
      }
    };
    new InputLoader(Integer.valueOf(2022), Integer.valueOf(7)).getInputs().forEach(_function);
    final Function1<Day7.Folder, Boolean> _function_1 = (Day7.Folder it) -> {
      return Boolean.valueOf((it.size <= 100000));
    };
    final Function2<Integer, Day7.Folder, Integer> _function_2 = (Integer acc, Day7.Folder e) -> {
      return Integer.valueOf(((acc).intValue() + e.size));
    };
    InputOutput.<Integer>println(IterableExtensions.<Day7.Folder, Integer>fold(IterableExtensions.<Day7.Folder>filter(Day7.folders, _function_1), Integer.valueOf(0), _function_2));
    final Function1<Day7.Folder, Boolean> _function_3 = (Day7.Folder it) -> {
      return Boolean.valueOf((it.size >= (Day7.root.size - 40000000)));
    };
    final Function1<Day7.Folder, Integer> _function_4 = (Day7.Folder it) -> {
      return Integer.valueOf(it.size);
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.<Day7.Folder, Integer>minBy(IterableExtensions.<Day7.Folder>filter(Day7.folders, _function_3), _function_4).size));
  }
}
