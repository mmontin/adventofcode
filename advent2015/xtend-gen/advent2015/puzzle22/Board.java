package advent2015.puzzle22;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Board {
  public enum Spell {
    MAGIC_MISSILE,

    DRAIN,

    SHIELD,

    POISON,

    RECHARGE;
  }

  public static int mana_min_spent_to_win = Integer.MAX_VALUE;

  public static int updateManaMin(final Integer mana) {
    return Board.mana_min_spent_to_win = Math.min(Board.mana_min_spent_to_win, (mana).intValue());
  }

  /**
   * A list of the game data, in this order :
   * SHIELD_COUNTER
   * POISON_COUNTER
   * RECHARGE_COUNTER
   * BOSS_HP
   * BOSS_DMG
   * PLAYER_HP
   * PLAYER_MANA
   * PLAYER_ARMOR
   */
  private List<Integer> boardState;

  public Board() {
    this.boardState = CollectionLiterals.<Integer>newArrayList(Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(58), Integer.valueOf(9), Integer.valueOf(50), Integer.valueOf(500), Integer.valueOf(0));
  }

  public Board(final Board other) {
    ArrayList<Integer> _arrayList = new ArrayList<Integer>(other.boardState);
    this.boardState = _arrayList;
  }

  public List<Integer> update(final Integer... vector) {
    final Function2<ArrayList<Integer>, Integer, ArrayList<Integer>> _function = new Function2<ArrayList<Integer>, Integer, ArrayList<Integer>>() {
      public ArrayList<Integer> apply(final ArrayList<Integer> l, final Integer i) {
        ArrayList<Integer> _xblockexpression = null;
        {
          Integer _get = Board.this.boardState.get((i).intValue());
          Integer _get_1 = vector[(i).intValue()];
          int _plus = ((_get).intValue() + (_get_1).intValue());
          l.add(Integer.valueOf(_plus));
          _xblockexpression = l;
        }
        return _xblockexpression;
      }
    };
    return this.boardState = IterableExtensions.<Integer, ArrayList<Integer>>fold(new IntegerRange(0, 7), CollectionLiterals.<Integer>newArrayList(), _function);
  }

  public HashSet<Board.Spell> availableSpells() {
    HashSet<Board.Spell> _xblockexpression = null;
    {
      HashSet<Board.Spell> output = CollectionLiterals.<Board.Spell>newHashSet();
      if ((((this.shield_counter()).intValue() == 0) && ((this.player_mana()).intValue() >= 113))) {
        output.add(Board.Spell.SHIELD);
      }
      if ((((this.poison_counter()).intValue() == 0) && ((this.player_mana()).intValue() >= 173))) {
        output.add(Board.Spell.POISON);
      }
      if ((((this.recharge_counter()).intValue() == 0) && ((this.player_mana()).intValue() >= 229))) {
        output.add(Board.Spell.RECHARGE);
      }
      Integer _player_mana = this.player_mana();
      boolean _greaterEqualsThan = ((_player_mana).intValue() >= 53);
      if (_greaterEqualsThan) {
        output.add(Board.Spell.MAGIC_MISSILE);
      }
      Integer _player_mana_1 = this.player_mana();
      boolean _greaterEqualsThan_1 = ((_player_mana_1).intValue() >= 73);
      if (_greaterEqualsThan_1) {
        output.add(Board.Spell.DRAIN);
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  public boolean initTurn() {
    boolean _xblockexpression = false;
    {
      Integer _shield_counter = this.shield_counter();
      boolean _greaterThan = ((_shield_counter).intValue() > 0);
      if (_greaterThan) {
        Integer _player_armor = this.player_armor();
        int _minus = (7 - (_player_armor).intValue());
        this.update(Integer.valueOf((-1)), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(_minus));
      } else {
        Integer _player_armor_1 = this.player_armor();
        boolean _greaterThan_1 = ((_player_armor_1).intValue() > 0);
        if (_greaterThan_1) {
          Integer _player_armor_2 = this.player_armor();
          int _minus_1 = (-(_player_armor_2).intValue());
          this.update(Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(_minus_1));
        }
      }
      Integer _poison_counter = this.poison_counter();
      boolean _greaterThan_2 = ((_poison_counter).intValue() > 0);
      if (_greaterThan_2) {
        this.update(Integer.valueOf(0), Integer.valueOf((-1)), Integer.valueOf(0), Integer.valueOf((-3)), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0));
      }
      Integer _recharge_counter = this.recharge_counter();
      boolean _greaterThan_3 = ((_recharge_counter).intValue() > 0);
      if (_greaterThan_3) {
        this.update(Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf((-1)), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(101), Integer.valueOf(0));
      }
      Integer _boss_hp = this.boss_hp();
      _xblockexpression = ((_boss_hp).intValue() <= 0);
    }
    return _xblockexpression;
  }

  public boolean bossTurn() {
    boolean _xblockexpression = false;
    {
      Integer _boss_damage = this.boss_damage();
      Integer _player_armor = this.player_armor();
      int _minus = ((_boss_damage).intValue() - (_player_armor).intValue());
      int _max = Math.max(1, _minus);
      int _minus_1 = (-_max);
      this.update(Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(_minus_1), Integer.valueOf(0), Integer.valueOf(0));
      Integer _player_hp = this.player_hp();
      _xblockexpression = ((_player_hp).intValue() <= 0);
    }
    return _xblockexpression;
  }

  public List<Integer> playerTurn(final Board.Spell spell) {
    List<Integer> _switchResult = null;
    if (spell != null) {
      switch (spell) {
        case MAGIC_MISSILE:
          _switchResult = this.update(Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf((-4)), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf((-53)), Integer.valueOf(0));
          break;
        case DRAIN:
          _switchResult = this.update(Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf((-2)), Integer.valueOf(0), Integer.valueOf(2), Integer.valueOf((-73)), Integer.valueOf(0));
          break;
        case SHIELD:
          _switchResult = this.update(Integer.valueOf(6), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf((-113)), Integer.valueOf(0));
          break;
        case POISON:
          _switchResult = this.update(Integer.valueOf(0), Integer.valueOf(6), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf((-173)), Integer.valueOf(0));
          break;
        default:
          _switchResult = this.update(Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(5), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf((-229)), Integer.valueOf(0));
          break;
      }
    } else {
      _switchResult = this.update(Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(5), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf((-229)), Integer.valueOf(0));
    }
    return _switchResult;
  }

  public void play(final Integer mana_spent_already) {
    this.update(Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf((-1)), Integer.valueOf(0), Integer.valueOf(0));
    Integer _player_hp = this.player_hp();
    boolean _greaterThan = ((_player_hp).intValue() > 0);
    if (_greaterThan) {
      boolean _initTurn = this.initTurn();
      if (_initTurn) {
        Board.updateManaMin(mana_spent_already);
      } else {
        if (((Board.mana_min_spent_to_win - (mana_spent_already).intValue()) >= 53)) {
          final Consumer<Board.Spell> _function = new Consumer<Board.Spell>() {
            public void accept(final Board.Spell it) {
              final Board newBoard = new Board(Board.this);
              newBoard.playerTurn(it);
              Integer _player_mana = Board.this.player_mana();
              int _plus = ((mana_spent_already).intValue() + (_player_mana).intValue());
              Integer _player_mana_1 = newBoard.player_mana();
              final int new_mana_spent = (_plus - (_player_mana_1).intValue());
              boolean _initTurn = newBoard.initTurn();
              if (_initTurn) {
                Board.updateManaMin(Integer.valueOf(new_mana_spent));
              } else {
                boolean _bossTurn = newBoard.bossTurn();
                boolean _not = (!_bossTurn);
                if (_not) {
                  newBoard.play(Integer.valueOf(new_mana_spent));
                }
              }
            }
          };
          this.availableSpells().forEach(_function);
        }
      }
    }
  }

  public Integer shield_counter() {
    return this.boardState.get(0);
  }

  public Integer poison_counter() {
    return this.boardState.get(1);
  }

  public Integer recharge_counter() {
    return this.boardState.get(2);
  }

  public Integer boss_hp() {
    return this.boardState.get(3);
  }

  public Integer boss_damage() {
    return this.boardState.get(4);
  }

  public Integer player_hp() {
    return this.boardState.get(5);
  }

  public Integer player_mana() {
    return this.boardState.get(6);
  }

  public Integer player_armor() {
    return this.boardState.get(7);
  }
}
