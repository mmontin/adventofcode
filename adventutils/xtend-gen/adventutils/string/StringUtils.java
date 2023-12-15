package adventutils.string;

import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class StringUtils {
  public static String reverse(final String s) {
    return IterableExtensions.join(ListExtensions.<Character>reverse(((List<Character>)Conversions.doWrapArray(s.toCharArray()))));
  }

  public static String padWith(final String input, final String padding, final int size) {
    return String.format((("%1$" + Integer.valueOf(size)) + "s"), input).replace(" ", padding);
  }
}
