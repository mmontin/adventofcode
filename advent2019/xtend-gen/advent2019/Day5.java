package advent2019;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day5 {
  public static void main(final String[] args) {
    final Function1<String, Integer> _function = (String it) -> {
      return Integer.valueOf(Integer.parseInt(it));
    };
    final List<Integer> opcodes = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(new InputLoader(Integer.valueOf(2019), Integer.valueOf(5)).getInputs().get(0).split(","))), _function);
    final ArrayList<Integer> inputs = CollectionLiterals.<Integer>newArrayList(Integer.valueOf(1));
    final ArrayList<Integer> outputs = CollectionLiterals.<Integer>newArrayList();
    Intcode.ListWrapper _listWrapper = new Intcode.ListWrapper(inputs);
    Intcode.ListWrapper _listWrapper_1 = new Intcode.ListWrapper(outputs);
    final Intcode decoder = new Intcode(opcodes, _listWrapper, _listWrapper_1, "");
    decoder.run();
    InputOutput.<Integer>println(IterableExtensions.<Integer>last(outputs));
    decoder.reset();
    inputs.clear();
    outputs.clear();
    inputs.add(Integer.valueOf(5));
    decoder.run();
    InputOutput.<Integer>println(IterableExtensions.<Integer>last(outputs));
  }
}
