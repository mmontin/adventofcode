package advent2024;

import java.util.Collections;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day21 {
  private static final List<List<String>> inputs = ListExtensions.<String, List<String>>map(Collections.<String>unmodifiableList(CollectionLiterals.<String>newArrayList("129A", "176A", "169A", "805A", "208A")), ((Function1<String, List<String>>) (String it) -> {
    final Function1<Character, String> _function = (Character it_1) -> {
      return (it_1 + "");
    };
    return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function);
  }));

  public static void main(final String[] args) {
  }
}
