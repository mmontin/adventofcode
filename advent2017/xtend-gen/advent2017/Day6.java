package advent2017;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day6 {
  public static void main(final String[] args) {
    final Function1<String, Integer> _function = (String it) -> {
      return Integer.valueOf(Integer.parseInt(it));
    };
    final List<Integer> initial_banks = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(IterableExtensions.<String>head(new InputLoader(Integer.valueOf(2017), Integer.valueOf(6)).getInputs()).split("\\s+"))), _function);
    final ArrayList<Integer> banks = new ArrayList<Integer>(initial_banks);
    Day6.update(banks);
    final ArrayList<List<Integer>> known_configurations = CollectionLiterals.<List<Integer>>newArrayList(initial_banks);
    while ((!known_configurations.contains(banks))) {
      {
        ArrayList<Integer> _arrayList = new ArrayList<Integer>(banks);
        known_configurations.add(_arrayList);
        Day6.update(banks);
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(known_configurations.size()));
    int _size = known_configurations.size();
    int _indexOf = known_configurations.indexOf(banks);
    int _minus = (_size - _indexOf);
    InputOutput.<Integer>println(Integer.valueOf(_minus));
  }

  public static void update(final ArrayList<Integer> _banks) {
    final int _size = _banks.size();
    Integer toSpread = IterableExtensions.<Integer>max(_banks);
    int location = _banks.indexOf(toSpread);
    _banks.set(location, Integer.valueOf(0));
    while (((toSpread).intValue() > 0)) {
      {
        location = ((location + 1) % _size);
        Integer _get = _banks.get(location);
        int _plus = ((_get).intValue() + 1);
        _banks.set(location, Integer.valueOf(_plus));
        toSpread--;
      }
    }
  }
}
