package advent2016.puzzle21;

import advent2016.Utils;
import com.google.common.base.Objects;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final StringBuffer sb = new StringBuffer("abcdefgh");
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String it) {
        final String[] split = it.split(" ");
        String _get = split[0];
        boolean _matched = false;
        if (Objects.equal(_get, "swap")) {
          _matched=true;
          boolean _equals = (split[1]).equals("position");
          if (_equals) {
            final int i = Integer.parseInt(split[2]);
            final int j = Integer.parseInt(split[5]);
            final char ch = sb.charAt(i);
            sb.setCharAt(i, sb.charAt(j));
            sb.setCharAt(j, ch);
          } else {
            final char ch1 = (split[2]).charAt(0);
            final char ch2 = (split[5]).charAt(0);
            int _length = sb.length();
            ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _length, true);
            for (final Integer i_1 : _doubleDotLessThan) {
              boolean _equals_1 = Character.valueOf(sb.charAt((i_1).intValue())).equals(Character.valueOf(ch1));
              if (_equals_1) {
                sb.setCharAt((i_1).intValue(), ch2);
              } else {
                boolean _equals_2 = Character.valueOf(sb.charAt((i_1).intValue())).equals(Character.valueOf(ch2));
                if (_equals_2) {
                  sb.setCharAt((i_1).intValue(), ch1);
                }
              }
            }
          }
        }
        if (!_matched) {
          if (Objects.equal(_get, "rotate")) {
            _matched=true;
            boolean _equals_3 = (split[1]).equals("based");
            if (_equals_3) {
              final String ch_1 = split[6];
              int offset = sb.indexOf(ch_1);
              if ((offset >= 4)) {
                offset++;
              }
              offset++;
              final Consumer<Integer> _function = new Consumer<Integer>() {
                public void accept(final Integer it) {
                  int _length = sb.length();
                  int _minus = (_length - 1);
                  final char ch2 = sb.charAt(_minus);
                  int _length_1 = sb.length();
                  int _minus_1 = (_length_1 - 1);
                  sb.deleteCharAt(_minus_1);
                  sb.insert(0, ch2);
                }
              };
              new ExclusiveRange(0, offset, true).forEach(_function);
            } else {
              final boolean right = (split[1]).equals("right");
              final int offset_1 = Integer.parseInt(split[2]);
              final Consumer<Integer> _function_1 = new Consumer<Integer>() {
                public void accept(final Integer it) {
                  if (right) {
                    int _length = sb.length();
                    int _minus = (_length - 1);
                    final char ch = sb.charAt(_minus);
                    int _length_1 = sb.length();
                    int _minus_1 = (_length_1 - 1);
                    sb.deleteCharAt(_minus_1);
                    sb.insert(0, ch);
                  } else {
                    final char ch_1 = sb.charAt(0);
                    sb.deleteCharAt(0);
                    sb.append(ch_1);
                  }
                }
              };
              new ExclusiveRange(0, offset_1, true).forEach(_function_1);
            }
          }
        }
        if (!_matched) {
          if (Objects.equal(_get, "reverse")) {
            _matched=true;
            final int i_2 = Integer.parseInt(split[2]);
            final int j_1 = Integer.parseInt(split[4]);
            sb.replace(i_2, (j_1 + 1), IterableExtensions.join(ListExtensions.<Character>reverse(IterableExtensions.<Character>toList(((Iterable<Character>)Conversions.doWrapArray(sb.substring(i_2, (j_1 + 1)).toCharArray()))))));
          }
        }
        if (!_matched) {
          {
            final int i_3 = Integer.parseInt(split[2]);
            final int j_2 = Integer.parseInt(split[5]);
            final char ch_2 = sb.charAt(i_3);
            sb.deleteCharAt(i_3).insert(j_2, ch_2);
          }
        }
      }
    };
    Utils.getInputs(21).forEach(_function);
    InputOutput.<String>println(sb.toString());
  }
}
