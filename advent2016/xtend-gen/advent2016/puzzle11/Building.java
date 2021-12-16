package advent2016.puzzle11;

import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Building implements Comparable<Building> {
  private final List<Integer> content;
  
  private final Integer elevator;
  
  private final Integer score;
  
  private final boolean isFinal;
  
  private final String normalForm;
  
  private final boolean valid;
  
  private final Integer hCode;
  
  private Integer distance;
  
  public Building(final List<Integer> content_, final Integer elevator_, final int distance_) {
    this.content = content_;
    this.elevator = elevator_;
    final Function2<Integer, Integer, Integer> _function = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer x, final Integer y) {
        return Integer.valueOf(((x).intValue() + (y).intValue()));
      }
    };
    this.score = IterableExtensions.<Integer>reduce(this.content, _function);
    int _size = this.content.size();
    int _multiply = (4 * _size);
    boolean _equals = ((this.score).intValue() == _multiply);
    this.isFinal = _equals;
    this.distance = Integer.valueOf(distance_);
    int _size_1 = this.content.size();
    int _divide = (_size_1 / 2);
    final Function2<ArrayList<String>, Integer, ArrayList<String>> _function_1 = new Function2<ArrayList<String>, Integer, ArrayList<String>>() {
      public ArrayList<String> apply(final ArrayList<String> l, final Integer i) {
        ArrayList<String> _xblockexpression = null;
        {
          Integer _get = Building.this.content.get((2 * (i).intValue()));
          String _plus = ("" + _get);
          Integer _get_1 = Building.this.content.get(((2 * (i).intValue()) + 1));
          String _plus_1 = (_plus + _get_1);
          l.add(_plus_1);
          _xblockexpression = l;
        }
        return _xblockexpression;
      }
    };
    final Function2<String, String, String> _function_2 = new Function2<String, String, String>() {
      public String apply(final String s, final String e) {
        return (s + e);
      }
    };
    this.normalForm = IterableExtensions.<String>reduce(IterableExtensions.<String>sort(IterableExtensions.<Integer, ArrayList<String>>fold(new ExclusiveRange(0, _divide, true), CollectionLiterals.<String>newArrayList(), _function_1)), _function_2);
    boolean _xblockexpression = false;
    {
      final Integer CG = this.content.get(0);
      final Integer CC = this.content.get(1);
      final Integer PG = this.content.get(2);
      final Integer PC = this.content.get(3);
      final Integer RG = this.content.get(4);
      final Integer RC = this.content.get(5);
      final Integer SG = this.content.get(6);
      final Integer SC = this.content.get(7);
      final Integer TG = this.content.get(8);
      final Integer TC = this.content.get(9);
      final Integer UG = this.content.get(10);
      final Integer UC = this.content.get(11);
      final Integer VG = this.content.get(12);
      final Integer VC = this.content.get(13);
      _xblockexpression = (((((((Objects.equal(CC, CG) || (!CollectionLiterals.<Integer>newHashSet(PG, RG, SG, TG, UG, VG).contains(CC))) && (Objects.equal(PC, PG) || (!CollectionLiterals.<Integer>newHashSet(CG, RG, SG, TG, UG, VG).contains(PC)))) && (Objects.equal(RC, RG) || (!CollectionLiterals.<Integer>newHashSet(CG, PG, SG, TG, UG, VG).contains(RC)))) && (Objects.equal(SC, SG) || (!CollectionLiterals.<Integer>newHashSet(CG, PG, RG, TG, UG, VG).contains(SC)))) && (Objects.equal(TC, TG) || (!CollectionLiterals.<Integer>newHashSet(CG, PG, RG, SG, UG, VG).contains(TC)))) && (Objects.equal(UC, UG) || (!CollectionLiterals.<Integer>newHashSet(CG, PG, RG, TG, SG, VG).contains(UC)))) && (Objects.equal(VC, VG) || (!CollectionLiterals.<Integer>newHashSet(CG, PG, RG, SG, UG, TG).contains(VC))));
    }
    this.valid = _xblockexpression;
    int _hashCode = this.normalForm.hashCode();
    int _multiply_1 = (_hashCode * 10);
    int _plus = (_multiply_1 + (this.elevator).intValue());
    this.hCode = Integer.valueOf(_plus);
  }
  
  public Building(final int distance_) {
    this(CollectionLiterals.<Integer>newArrayList(Integer.valueOf(2), Integer.valueOf(2), Integer.valueOf(1), Integer.valueOf(1), Integer.valueOf(2), Integer.valueOf(2), Integer.valueOf(1), Integer.valueOf(1), Integer.valueOf(2), Integer.valueOf(3), Integer.valueOf(1), Integer.valueOf(1), Integer.valueOf(1), Integer.valueOf(1)), Integer.valueOf(1), distance_);
  }
  
  public Integer getDistance() {
    return this.distance;
  }
  
  public Integer getScore() {
    return this.score;
  }
  
  public boolean getFinal() {
    return this.isFinal;
  }
  
  public Integer updateDistance(final int previous) {
    Integer _xifexpression = null;
    if (((previous + 1) < (this.distance).intValue())) {
      _xifexpression = this.distance = Integer.valueOf((previous + 1));
    }
    return _xifexpression;
  }
  
  public void step(final Set<Building> known_states, final Set<Building> visited) {
    final HashSet<Integer> el = CollectionLiterals.<Integer>newHashSet();
    if (((this.elevator).intValue() > 1)) {
      el.add(Integer.valueOf(((this.elevator).intValue() - 1)));
    }
    if (((this.elevator).intValue() < 4)) {
      el.add(Integer.valueOf(((this.elevator).intValue() + 1)));
    }
    int _size = this.content.size();
    final Function2<ArrayList<Integer>, Integer, ArrayList<Integer>> _function = new Function2<ArrayList<Integer>, Integer, ArrayList<Integer>>() {
      public ArrayList<Integer> apply(final ArrayList<Integer> s, final Integer i) {
        ArrayList<Integer> _xblockexpression = null;
        {
          Integer _get = Building.this.content.get((i).intValue());
          boolean _equals = Objects.equal(_get, Building.this.elevator);
          if (_equals) {
            s.add(i);
          }
          _xblockexpression = s;
        }
        return _xblockexpression;
      }
    };
    final ArrayList<Integer> indices = IterableExtensions.<Integer, ArrayList<Integer>>fold(new ExclusiveRange(0, _size, true), CollectionLiterals.<Integer>newArrayList(), _function);
    final int indices_nb = indices.size();
    for (final Integer e : el) {
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, indices_nb, true);
      for (final Integer i : _doubleDotLessThan) {
        {
          final ArrayList<Integer> l1 = new ArrayList<Integer>(this.content);
          l1.set((indices.get((i).intValue())).intValue(), e);
          final Building b = new Building(l1, e, ((this.distance).intValue() + 1));
          if (b.valid) {
            boolean _contains = known_states.contains(b);
            if (_contains) {
              final Function1<Building, Boolean> _function_1 = new Function1<Building, Boolean>() {
                public Boolean apply(final Building it) {
                  return Boolean.valueOf(it.equals(b));
                }
              };
              final Building c = IterableExtensions.<Building>findFirst(known_states, _function_1);
              c.updateDistance((this.distance).intValue());
            } else {
              boolean _contains_1 = visited.contains(b);
              boolean _not = (!_contains_1);
              if (_not) {
                known_states.add(b);
              }
            }
          }
          ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((i).intValue() + 1), indices_nb, true);
          for (final Integer j : _doubleDotLessThan_1) {
            {
              final ArrayList<Integer> l = new ArrayList<Integer>(this.content);
              l.set((indices.get((i).intValue())).intValue(), e);
              l.set((indices.get((j).intValue())).intValue(), e);
              final Building a = new Building(l, e, ((this.distance).intValue() + 1));
              if (a.valid) {
                boolean _contains_2 = known_states.contains(a);
                if (_contains_2) {
                  final Function1<Building, Boolean> _function_2 = new Function1<Building, Boolean>() {
                    public Boolean apply(final Building it) {
                      return Boolean.valueOf(it.equals(a));
                    }
                  };
                  final Building c_1 = IterableExtensions.<Building>findFirst(known_states, _function_2);
                  c_1.updateDistance((this.distance).intValue());
                } else {
                  boolean _contains_3 = visited.contains(a);
                  boolean _not_1 = (!_contains_3);
                  if (_not_1) {
                    known_states.add(a);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  
  public boolean equals(final Object other) {
    boolean _xblockexpression = false;
    {
      final Building b = ((Building) other);
      _xblockexpression = (this.normalForm.equals(b.normalForm) && this.elevator.equals(b.elevator));
    }
    return _xblockexpression;
  }
  
  public int hashCode() {
    return (this.hCode).intValue();
  }
  
  public String toString() {
    return ((("Distance : " + this.distance) + " ; Score : ") + this.score);
  }
  
  public int compareTo(final Building other) {
    int _xifexpression = (int) 0;
    boolean _equals = Objects.equal(other.distance, this.distance);
    if (_equals) {
      _xifexpression = other.score.compareTo(this.score);
    } else {
      _xifexpression = this.distance.compareTo(other.distance);
    }
    return _xifexpression;
  }
}
