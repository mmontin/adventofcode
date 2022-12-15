package advent2016.puzzle5;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static final String input = "abbhdwsy";

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

  private static final List<String> ans = CollectionLiterals.<String>newArrayList("", "", "", "", "", "", "", "");

  public static void main(final String[] args) {
    long i = 1L;
    while (Launcher.ans.contains("")) {
      long _plusPlus = i++;
      String _plus = (Launcher.input + Long.valueOf(_plusPlus));
      Launcher.md5(_plus);
    }
    InputOutput.<String>println(IterableExtensions.join(Launcher.ans));
  }

  public static void md5(final String input) {
    Launcher.md.reset();
    byte[] _digest = Launcher.md.digest(input.getBytes());
    String s = new BigInteger(1, _digest).toString(16);
    int _length = s.length();
    boolean _lessEqualsThan = (_length <= 27);
    if (_lessEqualsThan) {
      int _length_1 = s.length();
      int _minus = (27 - _length_1);
      s = "0".repeat(_minus).concat(s);
      char _charAt = s.charAt(0);
      String _plus = (Character.valueOf(_charAt) + "");
      int pos = Integer.parseInt(_plus, 16);
      if ((((pos >= 0) && (pos < Launcher.ans.size())) && Launcher.ans.get(pos).isEmpty())) {
        Launcher.ans.remove(pos);
        char _charAt_1 = s.charAt(1);
        String _plus_1 = (Character.valueOf(_charAt_1) + "");
        Launcher.ans.add(pos, _plus_1);
      }
    }
  }
}
