package advent2015.puzzle21;

import java.util.List;
import java.util.function.Consumer;

@SuppressWarnings("all")
public class Player {
  protected int hp;
  
  private int dmg;
  
  private int armor;
  
  public Player(final int hp_) {
    this(hp_, 0, 0);
  }
  
  public Player(final int hp_, final int dmg_, final int armor_) {
    this.hp = hp_;
    this.dmg = dmg_;
    this.armor = armor_;
  }
  
  public boolean isDead() {
    return (this.hp <= 0);
  }
  
  public int hit(final Player p) {
    int _max = Math.max(1, (this.dmg - p.armor));
    int _minus = (p.hp - _max);
    return p.hp = _minus;
  }
  
  public int addItem(final Item i) {
    int _xblockexpression = (int) 0;
    {
      int _dmg = this.dmg;
      this.dmg = (_dmg + i.dmg);
      int _armor = this.armor;
      _xblockexpression = this.armor = (_armor + i.arm);
    }
    return _xblockexpression;
  }
  
  public void addAllItems(final List<Item> items) {
    final Consumer<Item> _function = new Consumer<Item>() {
      public void accept(final Item i) {
        Player.this.addItem(i);
      }
    };
    items.forEach(_function);
  }
}
