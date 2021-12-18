package advent2021.puzzle2;

import advent2021.Utils;
import com.google.common.base.Objects;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    int depth = 0;
    int length = 0;
    int aim = 0;
    final Function1<String, String[]> _function = new Function1<String, String[]>() {
      public String[] apply(final String x) {
        return x.split(" ");
      }
    };
    List<String[]> _map = ListExtensions.<String, String[]>map(Utils.getInputs(2), _function);
    for (final String[] split : _map) {
      {
        final int v = Integer.parseInt(split[1]);
        String _get = split[0];
        boolean _matched = false;
        if (Objects.equal(_get, "forward")) {
          _matched=true;
          int _length = length;
          length = (_length + v);
          int _depth = depth;
          depth = (_depth + (v * aim));
        }
        if (!_matched) {
          if (Objects.equal(_get, "down")) {
            _matched=true;
            int _aim = aim;
            aim = (_aim + v);
          }
        }
        if (!_matched) {
          int _aim_1 = aim;
          aim = (_aim_1 - v);
        }
      }
    }
    InputOutput.<Integer>print(Integer.valueOf((depth * length)));
  }
}
