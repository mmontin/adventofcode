package advent2015.puzzle22;

import java.util.HashSet;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Board {
  private int shield_counter = 0;
  
  private int poison_counter = 0;
  
  private int recharge_counter = 0;
  
  private int boss_hp = 58;
  
  private int boss_damage = 9;
  
  private int player_hp = 50;
  
  private int player_mana = 500;
  
  private int player_armor = 0;
  
  public Board() {
    this.shield_counter = 0;
    this.poison_counter = 0;
    this.recharge_counter = 0;
    this.boss_hp = 58;
    this.boss_damage = 9;
    this.player_hp = 50;
    this.player_mana = 500;
    this.player_armor = 0;
  }
  
  public Board(final Board other) {
    this.shield_counter = other.shield_counter;
    this.poison_counter = other.poison_counter;
    this.recharge_counter = other.recharge_counter;
    this.boss_hp = other.boss_hp;
    this.boss_damage = other.boss_damage;
    this.player_hp = other.player_hp;
    this.player_mana = other.player_mana;
    this.player_armor = other.player_armor;
  }
  
  public HashSet<Spells> availableSpells() {
    HashSet<Spells> _xblockexpression = null;
    {
      HashSet<Spells> output = CollectionLiterals.<Spells>newHashSet();
      if (((this.shield_counter == 0) && (this.player_mana >= 113))) {
        output.add(Spells.SHIELD);
      }
      if (((this.poison_counter == 0) && (this.player_mana >= 173))) {
        output.add(Spells.POISON);
      }
      if (((this.recharge_counter == 0) && (this.player_mana >= 229))) {
        output.add(Spells.RECHARGE);
      }
      if ((this.player_mana >= 53)) {
        output.add(Spells.MAGIC_MISSILE);
      }
      if ((this.player_mana >= 73)) {
        output.add(Spells.DRAIN);
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }
  
  public boolean initTurn() {
    boolean _xblockexpression = false;
    {
      if ((this.shield_counter > 0)) {
        this.player_armor = 7;
        this.shield_counter--;
      }
      if ((this.poison_counter > 0)) {
        int _boss_hp = this.boss_hp;
        this.boss_hp = (_boss_hp - 3);
        this.poison_counter--;
      }
      if ((this.recharge_counter > 0)) {
        int _player_mana = this.player_mana;
        this.player_mana = (_player_mana + 101);
        this.recharge_counter--;
      }
      boolean _xifexpression = false;
      if ((this.boss_hp <= 0)) {
        _xifexpression = true;
      } else {
        _xifexpression = false;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
  
  public int step(final boolean turn, final Spells spell) {
    Integer _xifexpression = null;
    boolean _initTurn = this.initTurn();
    if (_initTurn) {
      _xifexpression = Integer.valueOf(0);
    } else {
      Integer _xifexpression_1 = null;
      if (turn) {
        int _xblockexpression = (int) 0;
        {
          int original_mana = this.player_mana;
          if (spell != null) {
            switch (spell) {
              case DRAIN:
                int _player_mana = this.player_mana;
                this.player_mana = (_player_mana - 73);
                int _player_hp = this.player_hp;
                this.player_hp = (_player_hp + 2);
                int _boss_hp = this.boss_hp;
                this.boss_hp = (_boss_hp - 2);
                break;
              case MAGIC_MISSILE:
                int _player_mana_1 = this.player_mana;
                this.player_mana = (_player_mana_1 - 53);
                int _boss_hp_1 = this.boss_hp;
                this.boss_hp = (_boss_hp_1 - 4);
                break;
              case SHIELD:
                int _player_mana_2 = this.player_mana;
                this.player_mana = (_player_mana_2 - 113);
                this.shield_counter = 6;
                break;
              case POISON:
                int _player_mana_3 = this.player_mana;
                this.player_mana = (_player_mana_3 - 173);
                this.poison_counter = 6;
                break;
              default:
                {
                  int _player_mana_4 = this.player_mana;
                  this.player_mana = (_player_mana_4 - 229);
                  this.recharge_counter = 5;
                }
                break;
            }
          } else {
            {
              int _player_mana_4 = this.player_mana;
              this.player_mana = (_player_mana_4 - 229);
              this.recharge_counter = 5;
            }
          }
          int _xifexpression_2 = (int) 0;
          if ((this.boss_hp <= 0)) {
            _xifexpression_2 = 0;
          } else {
            _xifexpression_2 = this.step(false, null);
          }
          _xblockexpression = ((original_mana - this.player_mana) + _xifexpression_2);
        }
        _xifexpression_1 = Integer.valueOf(_xblockexpression);
      } else {
        Integer _xblockexpression_1 = null;
        {
          int _player_hp = this.player_hp;
          int _max = Math.max(1, (this.boss_damage - this.player_armor));
          this.player_hp = (_player_hp - _max);
          Integer _xifexpression_2 = null;
          if ((this.player_hp <= 0)) {
            _xifexpression_2 = Integer.valueOf(Integer.MAX_VALUE);
          } else {
            final Function2<Integer, Spells, Integer> _function = new Function2<Integer, Spells, Integer>() {
              public Integer apply(final Integer v, final Spells s) {
                return Integer.valueOf(Math.min((v).intValue(), new Board(Board.this).step(true, s)));
              }
            };
            _xifexpression_2 = IterableExtensions.<Spells, Integer>fold(this.availableSpells(), Integer.valueOf(Integer.MAX_VALUE), _function);
          }
          _xblockexpression_1 = _xifexpression_2;
        }
        _xifexpression_1 = _xblockexpression_1;
      }
      _xifexpression = _xifexpression_1;
    }
    return (_xifexpression).intValue();
  }
}
