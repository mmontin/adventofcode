package advent2022;

import java.util.ArrayList;
import java.util.function.Consumer;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

import com.google.common.base.Objects;

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day10 {
  public static void main(final String[] args) {
    final ArrayList<Integer> instructions = CollectionLiterals.<Integer>newArrayList();
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String e) {
        final String[] split = e.split(" ");
        boolean _equals = (split[0]).equals("noop");
        if (_equals) {
          instructions.add(Integer.valueOf(0));
        } else {
          instructions.addAll(
            CollectionLiterals.<Integer>newArrayList(Integer.valueOf(0), Integer.valueOf(Integer.parseInt(split[1]))));
        }
      }
    };
    new InputLoader(Integer.valueOf(2022), Integer.valueOf(10)).getInputs().forEach(_function);
    final ArrayList<Integer> register_values = CollectionLiterals.<Integer>newArrayList(Integer.valueOf(1));
    final Consumer<Integer> _function_1 = new Consumer<Integer>() {
      public void accept(final Integer it) {
        Integer _get = register_values.get((it).intValue());
        Integer _get_1 = instructions.get((it).intValue());
        int _plus = ((_get).intValue() + (_get_1).intValue());
        register_values.add(Integer.valueOf(_plus));
      }
    };
    new ExclusiveRange(0, 220, true).forEach(_function_1);
    final Function2<Integer, Integer, Integer> _function_2 = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer acc, final Integer v) {
        int _xblockexpression = (int) 0;
        {
          final int index = (19 + ((v).intValue() * 40));
          Integer _get = register_values.get(index);
          int _multiply = ((index + 1) * (_get).intValue());
          _xblockexpression = ((acc).intValue() + _multiply);
        }
        return Integer.valueOf(_xblockexpression);
      }
    };
    InputOutput.<Integer>println(
      IterableExtensions.<Integer, Integer>fold(new IntegerRange(0, 5), Integer.valueOf(0), _function_2));
    final ArrayList<ArrayList<String>> screen = CollectionLiterals.<ArrayList<String>>newArrayList();
    final Consumer<Integer> _function_3 = new Consumer<Integer>() {
      public void accept(final Integer i) {
        screen.add(CollectionLiterals.<String>newArrayList());
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer j) {
            int _size = register_values.size();
            int _minus = (_size - 1);
            final Integer reg = register_values.get(Math.min(_minus, (((i).intValue() * 40) + (j).intValue())));
            if (((Objects.equal(j, reg) || ((j).intValue() == ((reg).intValue() - 1))) || ((j).intValue() == ((reg).intValue() + 1)))) {
              screen.get((i).intValue()).add("#");
            } else {
              screen.get((i).intValue()).add(".");
            }
          }
        };
        new IntegerRange(0, 39).forEach(_function);
      }
    };
    new IntegerRange(0, 5).forEach(_function_3);
    final Consumer<ArrayList<String>> _function_4 = new Consumer<ArrayList<String>>() {
      public void accept(final ArrayList<String> line) {
        final Consumer<String> _function = new Consumer<String>() {
          public void accept(final String chara) {
            InputOutput.<String>print(chara);
          }
        };
        line.forEach(_function);
        InputOutput.println();
      }
    };
    screen.forEach(_function_4);
  }
}
