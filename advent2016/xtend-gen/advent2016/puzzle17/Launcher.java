package advent2016.puzzle17;

import com.google.common.base.Objects;
import java.security.MessageDigest;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.apache.commons.codec.binary.Hex;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static final String input = "rrrbmfta";
  
  private static final MessageDigest md = new Function0<MessageDigest>() {
    public MessageDigest apply() {
      try {
        MessageDigest _instance = MessageDigest.getInstance("MD5");
        return _instance;
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    }
  }.apply();
  
  private static int min_length = Integer.MAX_VALUE;
  
  private static int max_length = 0;
  
  private static String min_path = "";
  
  public static void main(final String[] args) {
    Coordinates _coordinates = new Coordinates(0, 0);
    Launcher.step(_coordinates, "");
    InputOutput.<String>println(("PART 1: " + Launcher.min_path));
    InputOutput.<String>println(("PART 2: " + Integer.valueOf(Launcher.max_length)));
  }
  
  public static void step(final Coordinates current, final String path) {
    boolean _isFinal = current.isFinal();
    if (_isFinal) {
      int _length = path.length();
      boolean _lessThan = (_length < Launcher.min_length);
      if (_lessThan) {
        Launcher.min_length = path.length();
        Launcher.min_path = path;
      }
      Launcher.max_length = Math.max(Launcher.max_length, path.length());
    } else {
      final Consumer<Map.Entry<String, Coordinates>> _function = new Consumer<Map.Entry<String, Coordinates>>() {
        public void accept(final Map.Entry<String, Coordinates> it) {
          Coordinates _value = it.getValue();
          String _key = it.getKey();
          String _plus = (path + _key);
          Launcher.step(_value, _plus);
        }
      };
      current.neighbours(Launcher.hashAndCollect((Launcher.input + path))).entrySet().forEach(_function);
    }
  }
  
  public static List<Boolean> hashAndCollect(final String s) {
    List<Boolean> _xblockexpression = null;
    {
      Launcher.md.update(s.getBytes());
      final Function1<Character, String> _function = new Function1<Character, String>() {
        public String apply(final Character it) {
          return (it + "");
        }
      };
      final Function1<String, Boolean> _function_1 = new Function1<String, Boolean>() {
        public Boolean apply(final String it) {
          boolean _switchResult = false;
          boolean _matched = false;
          if (Objects.equal(it, "b")) {
            _matched=true;
          }
          if (!_matched) {
            if (Objects.equal(it, "c")) {
              _matched=true;
            }
          }
          if (!_matched) {
            if (Objects.equal(it, "d")) {
              _matched=true;
            }
          }
          if (!_matched) {
            if (Objects.equal(it, "e")) {
              _matched=true;
            }
          }
          if (!_matched) {
            if (Objects.equal(it, "f")) {
              _matched=true;
            }
          }
          if (_matched) {
            _switchResult = true;
          }
          if (!_matched) {
            _switchResult = false;
          }
          return Boolean.valueOf(_switchResult);
        }
      };
      _xblockexpression = ListExtensions.<String, Boolean>map(ListExtensions.<Character, String>map(IterableExtensions.<Character>toList(((Iterable<Character>)Conversions.doWrapArray(Hex.encodeHexString(Launcher.md.digest()).substring(0, 4).toCharArray()))), _function), _function_1);
    }
    return _xblockexpression;
  }
}
