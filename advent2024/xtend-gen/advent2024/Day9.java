package advent2024;

import adventutils.geometry.Interval;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day9 {
  public static void main(final String[] args) {
    final ArrayList<Pair<Interval, Optional<Integer>>> hard_drive = CollectionLiterals.<Pair<Interval, Optional<Integer>>>newArrayList();
    final ArrayList<Pair<Interval, Optional<Integer>>> hard_drive_2 = CollectionLiterals.<Pair<Interval, Optional<Integer>>>newArrayList();
    int current_position = 0;
    boolean is_data = true;
    int current_id = 0;
    final Function1<Character, Integer> _function = (Character it) -> {
      String _plus = (it + "");
      return Integer.valueOf(Integer.parseInt(_plus));
    };
    final List<Integer> inputs = ListExtensions.<Character, Integer>map(((List<Character>)Conversions.doWrapArray(new InputLoader(Integer.valueOf(2024), Integer.valueOf(9)).getInputs().get(0).toCharArray())), _function);
    for (final Integer current_number : inputs) {
      {
        final Interval current_interval = new Interval(current_position, ((current_position + (current_number).intValue()) - 1));
        int _current_position = current_position;
        current_position = (_current_position + (current_number).intValue());
        if (((current_number).intValue() > 0)) {
          Optional<Integer> _xifexpression = null;
          if (is_data) {
            _xifexpression = Optional.<Integer>of(Integer.valueOf(current_id));
          } else {
            _xifexpression = Optional.<Integer>empty();
          }
          Pair<Interval, Optional<Integer>> _mappedTo = Pair.<Interval, Optional<Integer>>of(current_interval, _xifexpression);
          hard_drive.add(_mappedTo);
          Optional<Integer> _xifexpression_1 = null;
          if (is_data) {
            int _plusPlus = current_id++;
            _xifexpression_1 = Optional.<Integer>of(Integer.valueOf(_plusPlus));
          } else {
            _xifexpression_1 = Optional.<Integer>empty();
          }
          Pair<Interval, Optional<Integer>> _mappedTo_1 = Pair.<Interval, Optional<Integer>>of(current_interval, _xifexpression_1);
          hard_drive_2.add(_mappedTo_1);
        }
        is_data = (!is_data);
      }
    }
    while (IterableExtensions.<Pair<Interval, Optional<Integer>>>exists(hard_drive, ((Function1<Pair<Interval, Optional<Integer>>, Boolean>) (Pair<Interval, Optional<Integer>> it) -> {
      return Boolean.valueOf(it.getValue().isEmpty());
    }))) {
      {
        Pair<Interval, Optional<Integer>> last = hard_drive.getLast();
        boolean _isEmpty = last.getValue().isEmpty();
        if (_isEmpty) {
          hard_drive.remove(last);
        } else {
          final Interval last_interval = last.getKey();
          final long last_interval_size = last_interval.length();
          final Optional<Integer> last_value = last.getValue();
          final Function1<Pair<Interval, Optional<Integer>>, Boolean> _function_1 = (Pair<Interval, Optional<Integer>> it) -> {
            return Boolean.valueOf(it.getValue().isEmpty());
          };
          final Pair<Interval, Optional<Integer>> first_empty = IterableExtensions.<Pair<Interval, Optional<Integer>>>findFirst(hard_drive, _function_1);
          final int index_first_empty = hard_drive.indexOf(first_empty);
          final long first_empty_size = first_empty.getKey().length();
          if ((first_empty_size > last_interval_size)) {
            final long difference = (first_empty_size - last_interval_size);
            final Interval new_full_interval = new Interval(first_empty.getKey().leftBound, 
              (first_empty.getKey().rightBound - difference));
            final Interval new_empty_interval = new Interval(((first_empty.getKey().rightBound - difference) + 1), 
              first_empty.getKey().rightBound);
            Optional<Integer> _empty = Optional.<Integer>empty();
            Pair<Interval, Optional<Integer>> _mappedTo = Pair.<Interval, Optional<Integer>>of(new_empty_interval, _empty);
            hard_drive.set(index_first_empty, _mappedTo);
            Pair<Interval, Optional<Integer>> _mappedTo_1 = Pair.<Interval, Optional<Integer>>of(new_full_interval, last_value);
            hard_drive.add(index_first_empty, _mappedTo_1);
            int _size = hard_drive.size();
            int _minus = (_size - 1);
            hard_drive.remove(_minus);
          } else {
            if ((first_empty_size == last_interval_size)) {
              Interval _key = first_empty.getKey();
              Pair<Interval, Optional<Integer>> _mappedTo_2 = Pair.<Interval, Optional<Integer>>of(_key, last_value);
              hard_drive.set(index_first_empty, _mappedTo_2);
              int _size_1 = hard_drive.size();
              int _minus_1 = (_size_1 - 1);
              hard_drive.remove(_minus_1);
            } else {
              Interval _key_1 = first_empty.getKey();
              Pair<Interval, Optional<Integer>> _mappedTo_3 = Pair.<Interval, Optional<Integer>>of(_key_1, last_value);
              hard_drive.set(index_first_empty, _mappedTo_3);
              int _size_2 = hard_drive.size();
              int _minus_2 = (_size_2 - 1);
              Interval _interval = new Interval(last_interval.leftBound, ((last_interval.rightBound - first_empty_size) - 1));
              Pair<Interval, Optional<Integer>> _mappedTo_4 = Pair.<Interval, Optional<Integer>>of(_interval, last_value);
              hard_drive.set(_minus_2, _mappedTo_4);
            }
          }
        }
      }
    }
    int _size = hard_drive_2.size();
    int i = (_size - 1);
    while ((i > 0)) {
      {
        Pair<Interval, Optional<Integer>> last = hard_drive_2.get(i);
        boolean _isEmpty = last.getValue().isEmpty();
        boolean _not = (!_isEmpty);
        if (_not) {
          final Interval last_interval = last.getKey();
          final long last_interval_size = last_interval.length();
          final Optional<Integer> last_value = last.getValue();
          final Function1<Integer, Boolean> _function_1 = (Integer j) -> {
            boolean _xblockexpression = false;
            {
              final Pair<Interval, Optional<Integer>> current_itv = hard_drive_2.get((j).intValue());
              _xblockexpression = (current_itv.getValue().isEmpty() && (current_itv.getKey().length() >= last_interval_size));
            }
            return Boolean.valueOf(_xblockexpression);
          };
          final Integer index_first_empty = IterableExtensions.<Integer>findFirst(new ExclusiveRange(0, i, true), _function_1);
          if ((index_first_empty != null)) {
            final Pair<Interval, Optional<Integer>> first_empty = hard_drive_2.get((index_first_empty).intValue());
            final long first_empty_size = first_empty.getKey().length();
            final long difference = (first_empty_size - last_interval_size);
            final Interval new_full_interval = new Interval(first_empty.getKey().leftBound, 
              (first_empty.getKey().rightBound - difference));
            final Interval new_empty_interval = new Interval(((first_empty.getKey().rightBound - difference) + 1), 
              first_empty.getKey().rightBound);
            Optional<Integer> _empty = Optional.<Integer>empty();
            Pair<Interval, Optional<Integer>> _mappedTo = Pair.<Interval, Optional<Integer>>of(new_empty_interval, _empty);
            hard_drive_2.set((index_first_empty).intValue(), _mappedTo);
            Pair<Interval, Optional<Integer>> _mappedTo_1 = Pair.<Interval, Optional<Integer>>of(new_full_interval, last_value);
            hard_drive_2.add((index_first_empty).intValue(), _mappedTo_1);
            hard_drive_2.remove((i + 1));
            i++;
          }
        }
        i--;
      }
    }
    final Function2<Long, Pair<Interval, Optional<Integer>>, Long> _function_1 = (Long acc, Pair<Interval, Optional<Integer>> el) -> {
      long _xblockexpression = (long) 0;
      {
        final long m = el.getKey().leftBound;
        final long n = el.getKey().rightBound;
        final Integer id = el.getValue().get();
        _xblockexpression = ((acc).longValue() + ((id).intValue() * (((n * (n + 1)) - (m * (m - 1))) / 2)));
      }
      return Long.valueOf(_xblockexpression);
    };
    InputOutput.<Long>println(IterableExtensions.<Pair<Interval, Optional<Integer>>, Long>fold(hard_drive, Long.valueOf(0L), _function_1));
    final Function2<Long, Pair<Interval, Optional<Integer>>, Long> _function_2 = (Long acc, Pair<Interval, Optional<Integer>> el) -> {
      Long _xblockexpression = null;
      {
        final long m = el.getKey().leftBound;
        final long n = el.getKey().rightBound;
        Long _xifexpression = null;
        boolean _isEmpty = el.getValue().isEmpty();
        if (_isEmpty) {
          _xifexpression = acc;
        } else {
          long _xblockexpression_1 = (long) 0;
          {
            final Integer id = el.getValue().get();
            _xblockexpression_1 = ((acc).longValue() + ((id).intValue() * (((n * (n + 1)) - (m * (m - 1))) / 2)));
          }
          _xifexpression = Long.valueOf(_xblockexpression_1);
        }
        _xblockexpression = _xifexpression;
      }
      return _xblockexpression;
    };
    InputOutput.<Long>println(IterableExtensions.<Pair<Interval, Optional<Integer>>, Long>fold(hard_drive_2, Long.valueOf(0L), _function_2));
  }
}
