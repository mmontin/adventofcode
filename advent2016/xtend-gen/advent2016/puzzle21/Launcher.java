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
    InputOutput.<StringBuffer>println(sb);
    InputOutput.<String>println("--------------");
    final StringBuffer sb2 = new StringBuffer("fbgdceah");
    final Consumer<String> _function_1 = new Consumer<String>() {
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
            final char ch = sb2.charAt(i);
            sb2.setCharAt(i, sb2.charAt(j));
            sb2.setCharAt(j, ch);
          } else {
            final char ch1 = (split[2]).charAt(0);
            final char ch2 = (split[5]).charAt(0);
            int _length = sb2.length();
            ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _length, true);
            for (final Integer i_1 : _doubleDotLessThan) {
              boolean _equals_1 = Character.valueOf(sb2.charAt((i_1).intValue())).equals(Character.valueOf(ch1));
              if (_equals_1) {
                sb2.setCharAt((i_1).intValue(), ch2);
              } else {
                boolean _equals_2 = Character.valueOf(sb2.charAt((i_1).intValue())).equals(Character.valueOf(ch2));
                if (_equals_2) {
                  sb2.setCharAt((i_1).intValue(), ch1);
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
              int _switchResult_1 = (int) 0;
              int _indexOf = sb2.indexOf(split[6]);
              switch (_indexOf) {
                case 1:
                  _switchResult_1 = 1;
                  break;
                case 3:
                  _switchResult_1 = 2;
                  break;
                case 5:
                  _switchResult_1 = 3;
                  break;
                case 7:
                  _switchResult_1 = 4;
                  break;
                case 2:
                  _switchResult_1 = 6;
                  break;
                case 4:
                  _switchResult_1 = 7;
                  break;
                case 6:
                  _switchResult_1 = 0;
                  break;
                default:
                  _switchResult_1 = 1;
                  break;
              }
              int offset = _switchResult_1;
              final Consumer<Integer> _function = new Consumer<Integer>() {
                public void accept(final Integer it) {
                  final char ch = sb2.charAt(0);
                  sb2.deleteCharAt(0);
                  sb2.append(ch);
                }
              };
              new ExclusiveRange(0, offset, true).forEach(_function);
            } else {
              boolean _equals_4 = (split[1]).equals("right");
              final boolean right = (!_equals_4);
              final int offset_1 = Integer.parseInt(split[2]);
              final Consumer<Integer> _function_1 = new Consumer<Integer>() {
                public void accept(final Integer it) {
                  if (right) {
                    int _length = sb2.length();
                    int _minus = (_length - 1);
                    final char ch = sb2.charAt(_minus);
                    int _length_1 = sb2.length();
                    int _minus_1 = (_length_1 - 1);
                    sb2.deleteCharAt(_minus_1);
                    sb2.insert(0, ch);
                  } else {
                    final char ch_1 = sb2.charAt(0);
                    sb2.deleteCharAt(0);
                    sb2.append(ch_1);
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
            sb2.replace(i_2, (j_1 + 1), IterableExtensions.join(ListExtensions.<Character>reverse(IterableExtensions.<Character>toList(((Iterable<Character>)Conversions.doWrapArray(sb2.substring(i_2, (j_1 + 1)).toCharArray()))))));
          }
        }
        if (!_matched) {
          {
            final int i_3 = Integer.parseInt(split[5]);
            final int j_2 = Integer.parseInt(split[2]);
            final char ch_1 = sb2.charAt(i_3);
            sb2.deleteCharAt(i_3).insert(j_2, ch_1);
          }
        }
      }
    };
    ListExtensions.<String>reverse(Utils.getInputs(21)).forEach(_function_1);
    InputOutput.<StringBuffer>println(sb2);
  }
}
