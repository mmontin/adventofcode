package advent2019;

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
public class Day5 {
  public static void main(final String[] args) {
    final Function1<String, Integer> _function = (String it) -> {
      return Integer.valueOf(Integer.parseInt(it));
    };
    final List<Integer> inputs = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(new InputLoader(Integer.valueOf(2019), Integer.valueOf(5)).getInputs().get(0).split(","))), _function);
    ArrayList<Integer> _arrayList = new ArrayList<Integer>(inputs);
    final Intcode decoder = new Intcode(_arrayList);
    InputOutput.<Integer>println(IterableExtensions.<Integer>last(decoder.processWithInputs(CollectionLiterals.<Integer>newArrayList(Integer.valueOf(1)))));
    ArrayList<Integer> _arrayList_1 = new ArrayList<Integer>(inputs);
    decoder.reset(_arrayList_1);
    InputOutput.<Integer>println(IterableExtensions.<Integer>last(decoder.processWithInputs(CollectionLiterals.<Integer>newArrayList(Integer.valueOf(5)))));
  }
}
