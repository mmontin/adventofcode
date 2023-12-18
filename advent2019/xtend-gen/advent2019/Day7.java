package advent2019;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

import adventutils.collection.ListUtils;
import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day7 implements Runnable {
  public static void main(final String[] args) {
    final Function1<String, Integer> _function = (String it) -> {
      return Integer.valueOf(Integer.parseInt(it));
    };
    final List<Integer> opcodes = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(new InputLoader(Integer.valueOf(2019), Integer.valueOf(7)).getInputs().get(0).split(","))), _function);
    final Function1<ArrayList<Integer>, Day7> _function_1 = (ArrayList<Integer> it) -> {
      return new Day7(opcodes, it);
    };
    final List<Day7> launchers = ListExtensions.<ArrayList<Integer>, Day7>map(ListUtils.<Integer>permute(CollectionLiterals.<Integer>newArrayList(Integer.valueOf(5), Integer.valueOf(6), Integer.valueOf(7), Integer.valueOf(8), Integer.valueOf(9))), _function_1);
    final Function1<Day7, Thread> _function_2 = (Day7 it) -> {
      return new Thread(it);
    };
    final List<Thread> threads = ListExtensions.<Day7, Thread>map(launchers, _function_2);
    final Consumer<Thread> _function_3 = (Thread it) -> {
      it.start();
    };
    threads.forEach(_function_3);
    final Consumer<Thread> _function_4 = (Thread it) -> {
      try {
        it.join();
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    };
    threads.forEach(_function_4);
    final Function1<Day7, Integer> _function_5 = (Day7 it) -> {
      return Integer.valueOf(it.getAnswer());
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer>max(ListExtensions.<Day7, Integer>map(launchers, _function_5)));
  }

  private List<Intcode.ListWrapper> outputs;

  private List<Intcode> decoders;

  public Day7(final List<Integer> opcodes, final List<Integer> permut) {
    final Function1<Integer, Intcode.ListWrapper> _function = (Integer it) -> {
      ArrayList<Integer> _newArrayList = CollectionLiterals.<Integer>newArrayList(it);
      return new Intcode.ListWrapper(_newArrayList);
    };
    List<Intcode.ListWrapper> _map = ListExtensions.<Integer, Intcode.ListWrapper>map(permut, _function);
    ArrayList<Intcode.ListWrapper> _arrayList = new ArrayList<Intcode.ListWrapper>(_map);
    this.outputs = _arrayList;
    this.outputs.get(0).add(Integer.valueOf(0));
    final Function1<Integer, Intcode> _function_1 = (Integer it) -> {
      Intcode.ListWrapper _get = this.outputs.get((it).intValue());
      Intcode.ListWrapper _get_1 = this.outputs.get((((it).intValue() + 1) % 5));
      String _string = permut.get((it).intValue()).toString();
      return new Intcode(opcodes, _get, _get_1, _string);
    };
    List<Intcode> _list = IterableExtensions.<Intcode>toList(IterableExtensions.<Integer, Intcode>map(new IntegerRange(0, 4), _function_1));
    ArrayList<Intcode> _arrayList_1 = new ArrayList<Intcode>(_list);
    this.decoders = _arrayList_1;
  }

  @Override
  public void run() {
    try {
      final Function1<Intcode, Thread> _function = (Intcode it) -> {
        return new Thread(it);
      };
      final List<Thread> threads = ListExtensions.<Intcode, Thread>map(this.decoders, _function);
      final Consumer<Thread> _function_1 = (Thread it) -> {
        it.start();
      };
      threads.forEach(_function_1);
      threads.get(4).join();
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }

  public int getAnswer() {
    return (this.outputs.get(0).lastProduced).intValue();
  }
}
