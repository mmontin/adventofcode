package advent2016.puzzle11;

import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Building {
  private final List<Integer> content;
  
  private final Integer elevator;
  
  private final Integer score;
  
  protected final boolean isFinal;
  
  public Building(final List<Integer> content_, final Integer elevator_) {
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
  }
  
  public Building() {
    this(CollectionLiterals.<Integer>newArrayList(Integer.valueOf(2), Integer.valueOf(2), Integer.valueOf(1), Integer.valueOf(1), Integer.valueOf(2), Integer.valueOf(2), Integer.valueOf(1), Integer.valueOf(1), Integer.valueOf(2), Integer.valueOf(3)), Integer.valueOf(1));
  }
  
  public boolean valid() {
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
      _xblockexpression = (((((Objects.equal(CC, CG) || (!CollectionLiterals.<Integer>newHashSet(PG, RG, SG, TG).contains(CC))) && (Objects.equal(PC, PG) || (!CollectionLiterals.<Integer>newHashSet(CG, RG, SG, TG).contains(PC)))) && (Objects.equal(RC, RG) || (!CollectionLiterals.<Integer>newHashSet(CG, PG, SG, TG).contains(RC)))) && (Objects.equal(SC, SG) || (!CollectionLiterals.<Integer>newHashSet(CG, PG, RG, TG).contains(SC)))) && (Objects.equal(TC, TG) || (!CollectionLiterals.<Integer>newHashSet(CG, PG, RG, SG).contains(TC))));
    }
    return _xblockexpression;
  }
  
  public List<Building> steps() {
    List<Building> _xblockexpression = null;
    {
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
      final ArrayList<Building> possible_states = CollectionLiterals.<Building>newArrayList();
      final int indices_nb = indices.size();
      for (final Integer e : el) {
        ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, indices_nb, true);
        for (final Integer i : _doubleDotLessThan) {
          {
            final ArrayList<Integer> l1 = new ArrayList<Integer>(this.content);
            l1.set((indices.get((i).intValue())).intValue(), e);
            Building _building = new Building(l1, e);
            possible_states.add(_building);
            ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((i).intValue() + 1), indices_nb, true);
            for (final Integer j : _doubleDotLessThan_1) {
              {
                final ArrayList<Integer> l = new ArrayList<Integer>(this.content);
                l.set((indices.get((i).intValue())).intValue(), e);
                l.set((indices.get((j).intValue())).intValue(), e);
                Building _building_1 = new Building(l, e);
                possible_states.add(_building_1);
              }
            }
          }
        }
      }
      final Function1<Building, Boolean> _function_1 = new Function1<Building, Boolean>() {
        public Boolean apply(final Building it) {
          return Boolean.valueOf(it.valid());
        }
      };
      final Function1<Building, Integer> _function_2 = new Function1<Building, Integer>() {
        public Integer apply(final Building it) {
          return Integer.valueOf((-(it.score).intValue()));
        }
      };
      _xblockexpression = IterableExtensions.<Building, Integer>sortBy(IterableExtensions.<Building>filter(possible_states, _function_1), _function_2);
    }
    return _xblockexpression;
  }
  
  public boolean equals(final Object other) {
    boolean _xblockexpression = false;
    {
      final Building b = ((Building) other);
      _xblockexpression = (this.content.equals(b.content) && this.elevator.equals(b.elevator));
    }
    return _xblockexpression;
  }
  
  public int hashCode() {
    return (((this.score).intValue() * 10) + (this.elevator).intValue());
  }
  
  public String toString() {
    return ((("Elements : " + this.content) + " ; Elevator : ") + this.elevator);
  }
}
