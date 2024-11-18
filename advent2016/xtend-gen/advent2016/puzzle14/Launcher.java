package advent2016.puzzle14;

import java.security.MessageDigest;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.apache.commons.codec.binary.Hex;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static final String salt = "cuanljph";

  private static final MessageDigest md = new Function0<MessageDigest>() {
    @Override
    public MessageDigest apply() {
      try {
        MessageDigest _instance = MessageDigest.getInstance("MD5");
        return _instance;
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    }
  }.apply();

  public static void main(final String[] args) {
    final HashSet<Integer> keys = CollectionLiterals.<Integer>newHashSet();
    final Map<Integer, String> data = CollectionLiterals.<Integer, String>newHashMap();
    int indice = 0;
    while ((keys.size() < 64)) {
      {
        Launcher.md.reset();
        String myString = (Launcher.salt + Integer.valueOf(indice));
        IntegerRange _upTo = new IntegerRange(0, 2016);
        for (final Integer i : _upTo) {
          {
            Launcher.md.update(myString.getBytes());
            myString = Hex.encodeHexString(Launcher.md.digest());
          }
        }
        final String myHash = myString;
        final String repeat3 = Launcher.inARow(myHash, 3);
        boolean _equals = repeat3.equals("");
        boolean _not = (!_equals);
        if (_not) {
          Set<Map.Entry<Integer, String>> _entrySet = data.entrySet();
          final Function1<Map.Entry<Integer, String>, Boolean> _function = (Map.Entry<Integer, String> it) -> {
            return Boolean.valueOf(myHash.contains(it.getValue()));
          };
          final Consumer<Map.Entry<Integer, String>> _function_1 = (Map.Entry<Integer, String> it) -> {
            keys.add(it.getKey());
            data.remove(it.getKey());
          };
          IterableExtensions.<Map.Entry<Integer, String>>filter(new HashSet<Map.Entry<Integer, String>>(_entrySet), _function).forEach(_function_1);
          data.put(Integer.valueOf(indice), repeat3.repeat(5));
        }
        data.remove(Integer.valueOf((indice - 1000)));
        indice++;
      }
    }
    InputOutput.<Integer>println(IterableExtensions.<Integer>sort(keys).get(63));
  }

  public static String inARow(final String s, final int range) {
    String _xblockexpression = null;
    {
      String output = "";
      int i = 0;
      while ((output.equals("") && (i <= (s.length() - range)))) {
        {
          int _size = IterableExtensions.<Character>toSet(((Iterable<Character>)Conversions.doWrapArray(s.substring(i, (i + range)).toCharArray()))).size();
          boolean _equals = (_size == 1);
          if (_equals) {
            char _charAt = s.charAt(i);
            String _plus = (Character.valueOf(_charAt) + "");
            output = _plus;
          }
          i++;
        }
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }
}
