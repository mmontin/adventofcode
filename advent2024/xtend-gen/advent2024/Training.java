package advent2024;

import adventutils.collection.ListUtils;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Training {
  public static void main(final String[] args) {
    final ArrayList<String> input = CollectionLiterals.<String>newArrayList("he", "llo", " wor", "ld!");
    String sentence = "";
    int _size = input.size();
    int _minus = (_size - 1);
    IntegerRange _upTo = new IntegerRange(0, _minus);
    for (final Integer i : _upTo) {
      String _get = input.get((i).intValue());
      String _plus = (sentence + _get);
      sentence = _plus;
    }
    InputOutput.<String>println(sentence);
    sentence = "";
    for (final String syllabe : input) {
      String _sentence = sentence;
      sentence = (_sentence + syllabe);
    }
    InputOutput.<String>println(sentence);
    final Function2<String, String, String> _function = (String acc, String el) -> {
      return (acc + el);
    };
    InputOutput.<String>println(IterableExtensions.<String, String>fold(input, "", _function));
    final Function2<String, String, String> _function_1 = (String acc, String el) -> {
      return (acc + el);
    };
    InputOutput.<String>println(IterableExtensions.<String>reduce(input, _function_1));
    InputOutput.<String>println(IterableExtensions.join(input));
    final Function2<Integer, String, Integer> _function_2 = (Integer acc, String el) -> {
      int _length = el.length();
      return Integer.valueOf(((acc).intValue() + _length));
    };
    InputOutput.<Integer>println(
      IterableExtensions.<String, Integer>fold(input, Integer.valueOf(0), _function_2));
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.join(input).length()));
    InputOutput.<List<String>>println(Training.rev(input));
    InputOutput.<List<String>>println(Training.rev2(input));
    InputOutput.<String>println(IterableExtensions.join(Training.rev2(Training.rev(input))));
  }

  public static List<String> rev(final List<String> input) {
    ArrayList<String> _xblockexpression = null;
    {
      final ArrayList<String> output = CollectionLiterals.<String>newArrayList();
      int _size = input.size();
      int _minus = (_size - 1);
      IntegerRange _upTo = new IntegerRange(_minus, 0);
      for (final Integer i : _upTo) {
        output.add(input.get((i).intValue()));
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  public static List<String> rev2(final List<String> input) {
    int _size = input.size();
    int _minus = (_size - 1);
    final Function2<ArrayList<String>, Integer, ArrayList<String>> _function = (ArrayList<String> acc, Integer el) -> {
      return ListUtils.<String, ArrayList<String>>cons(input.get((el).intValue()), acc);
    };
    return IterableExtensions.<Integer, ArrayList<String>>fold(new IntegerRange(_minus, 0), CollectionLiterals.<String>newArrayList(), _function);
  }
}
