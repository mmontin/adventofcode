package advent2015.puzzle19;

import advent2015.Utils;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  private static final Map<String, Set<String>> transformations = new HashMap<String, Set<String>>();
  
  public static void main(final String[] args) {
    try {
      final List<String> inputs = Utils.getInputs(19);
      Set<String> inputSet = new HashSet<String>();
      inputSet.add(inputs.get(0));
      inputs.remove(0);
      final Consumer<String> _function = new Consumer<String>() {
        public void accept(final String l) {
          final String[] split = l.split(" => ");
          final String left = split[0];
          final String right = split[1];
          boolean _containsKey = Launcher.transformations.containsKey(right);
          boolean _not = (!_containsKey);
          if (_not) {
            HashSet<String> _hashSet = new HashSet<String>();
            Launcher.transformations.put(right, _hashSet);
          }
          Launcher.transformations.get(right).add(left);
        }
      };
      inputs.forEach(_function);
      inputSet = Launcher.performSet(inputSet);
      inputSet = Launcher.performSet(inputSet);
      inputSet = Launcher.performSet(inputSet);
      InputOutput.<Integer>println(Integer.valueOf(inputSet.size()));
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public static Set<String> performSet(final Set<String> samples) {
    Set<String> _xblockexpression = null;
    {
      final Set<String> output = new HashSet<String>();
      final Consumer<Map.Entry<String, Set<String>>> _function = new Consumer<Map.Entry<String, Set<String>>>() {
        public void accept(final Map.Entry<String, Set<String>> e) {
          final String left = e.getKey();
          final Consumer<String> _function = new Consumer<String>() {
            public void accept(final String right) {
              final Consumer<String> _function = new Consumer<String>() {
                public void accept(final String s) {
                  output.addAll(Launcher.perform(s, left, right));
                }
              };
              samples.forEach(_function);
            }
          };
          e.getValue().forEach(_function);
        }
      };
      Launcher.transformations.entrySet().forEach(_function);
      _xblockexpression = output;
    }
    return _xblockexpression;
  }
  
  public static Set<String> perform(final String sample, final String left, final String right) {
    Set<String> _xblockexpression = null;
    {
      final Set<String> outputs = new HashSet<String>();
      int startingIndex = 0;
      while ((startingIndex < sample.length())) {
        {
          int pos = sample.indexOf(left, startingIndex);
          if ((pos == (-1))) {
            startingIndex = sample.length();
          } else {
            String _substring = sample.substring(0, pos);
            String _plus = (_substring + right);
            int _length = left.length();
            int _plus_1 = (pos + _length);
            String _substring_1 = sample.substring(_plus_1);
            String _plus_2 = (_plus + _substring_1);
            outputs.add(_plus_2);
            int _startingIndex = startingIndex;
            int _length_1 = left.length();
            startingIndex = (_startingIndex + _length_1);
          }
        }
      }
      _xblockexpression = outputs;
    }
    return _xblockexpression;
  }
}
