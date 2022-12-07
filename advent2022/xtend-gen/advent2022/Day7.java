package advent2022;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

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
    final Function1<String, String> _function = new Function1<String, String>() {
      public String apply(final String it) {
        String _xifexpression = null;
        boolean _startsWith = it.startsWith("$");
        if (_startsWith) {
          _xifexpression = it.substring(2);
        } else {
          _xifexpression = it;
        }
        return _xifexpression;
      }
    };
    final Function1<String, String[]> _function_1 = new Function1<String, String[]>() {
      public String[] apply(final String it) {
        return it.split(" ");
      }
    };
    final Consumer<String[]> _function_2 = new Consumer<String[]>() {
      public void accept(final String[] it) {
        String _get = it[0];
        boolean _matched = false;
        if (Objects.equal(_get, "cd")) {
          _matched=true;
          Day7.Folder _switchResult_1 = null;
          String _get_1 = it[1];
          boolean _matched_1 = false;
          if (Objects.equal(_get_1, "/")) {
            _matched_1=true;
            _switchResult_1 = Day7.root;
          }
          if (!_matched_1) {
            if (Objects.equal(_get_1, "..")) {
              _matched_1=true;
              _switchResult_1 = Day7.current.parent;
            }
          }
          if (!_matched_1) {
            _switchResult_1 = Day7.current.content.get(it[1]);
          }
          Day7.current = _switchResult_1;
        }
        if (!_matched) {
          if (Objects.equal(_get, "ls")) {
            _matched=true;
            return;
          }
        }
        if (!_matched) {
          if (Objects.equal(_get, "dir")) {
            _matched=true;
            String _get_2 = it[1];
            Day7.Folder _folder = new Day7.Folder(_get_2, Day7.current);
            Day7.folders.add(_folder);
          }
        }
        if (!_matched) {
          Day7.current.addSize(Integer.parseInt(it[0]));
        }
      }
    };
    ListExtensions.<String, String[]>map(ListExtensions.<String, String>map(new InputLoader(Integer.valueOf(2022), Integer.valueOf(7)).getInputs(), _function), _function_1).forEach(_function_2);
    final Function1<Day7.Folder, Boolean> _function_3 = new Function1<Day7.Folder, Boolean>() {
      public Boolean apply(final Day7.Folder it) {
        return Boolean.valueOf((it.size <= 100000));
      }
    };
    final Function2<Integer, Day7.Folder, Integer> _function_4 = new Function2<Integer, Day7.Folder, Integer>() {
      public Integer apply(final Integer acc, final Day7.Folder e) {
        return Integer.valueOf(((acc).intValue() + e.size));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Day7.Folder, Integer>fold(IterableExtensions.<Day7.Folder>filter(Day7.folders, _function_3), Integer.valueOf(0), _function_4));
    final Function1<Day7.Folder, Boolean> _function_5 = new Function1<Day7.Folder, Boolean>() {
      public Boolean apply(final Day7.Folder it) {
        return Boolean.valueOf((it.size >= (Day7.root.size - 40000000)));
      }
    };
    final Function1<Day7.Folder, Integer> _function_6 = new Function1<Day7.Folder, Integer>() {
      public Integer apply(final Day7.Folder it) {
        return Integer.valueOf(it.size);
      }
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.<Day7.Folder, Integer>minBy(IterableExtensions.<Day7.Folder>filter(Day7.folders, _function_5), _function_6).size));
  }
}
