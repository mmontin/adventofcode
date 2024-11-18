package advent2015.puzzle21;

import java.util.List;
import java.util.Objects;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  private static List<Item> weapons = CollectionLiterals.<Item>newArrayList(
    new Item("Dagger", 8, 4, 0), 
    new Item("Shortsword", 10, 5, 0), 
    new Item("Warhammer", 25, 6, 0), 
    new Item("Longsword", 40, 7, 0), 
    new Item("Greataxe", 74, 8, 0));

  private static List<Item> armors = CollectionLiterals.<Item>newArrayList(
    new Item("noArmmor", 0, 0, 0), 
    new Item("Leather", 13, 0, 1), 
    new Item("Chainmail", 31, 0, 2), 
    new Item("Splintmail", 53, 0, 3), 
    new Item("Bandedmail", 75, 0, 4), 
    new Item("Platemail", 102, 0, 5));

  private static List<Item> rings = CollectionLiterals.<Item>newArrayList(
    new Item("noRing1", 0, 0, 0), 
    new Item("noRing2", 0, 0, 0), 
    new Item("dam1", 25, 1, 0), 
    new Item("dam2", 50, 2, 0), 
    new Item("dam3", 100, 3, 0), 
    new Item("def1", 20, 0, 1), 
    new Item("def2", 40, 0, 2), 
    new Item("def3", 80, 0, 3));

  public static void main(final String[] args) {
    int min_cost = Integer.MAX_VALUE;
    int max_cost = Integer.MIN_VALUE;
    for (final Item weapon : Launcher.weapons) {
      for (final Item armor : Launcher.armors) {
        for (final Item ring1 : Launcher.rings) {
          for (final Item ring2 : Launcher.rings) {
            boolean _equals = ring1.equals(ring2);
            boolean _not = (!_equals);
            if (_not) {
              int cost = (((weapon.cost + armor.cost) + ring1.cost) + ring2.cost);
              Player p = new Player(100);
              p.addAllItems(CollectionLiterals.<Item>newArrayList(weapon, armor, ring1, ring2));
              Player boss = new Player(100, 8, 2);
              Player _battle = Launcher.battle(p, boss);
              boolean _equals_1 = Objects.equals(_battle, p);
              if (_equals_1) {
                min_cost = Math.min(min_cost, cost);
              } else {
                max_cost = Math.max(max_cost, cost);
              }
            }
          }
        }
      }
    }
    String _plus = (Integer.valueOf(min_cost) + ",");
    String _plus_1 = (_plus + Integer.valueOf(max_cost));
    InputOutput.<String>println(_plus_1);
  }

  public static Player battle(final Player p1, final Player p2) {
    Player _xblockexpression = null;
    {
      Player current = p1;
      while (((!p1.isDead()) && (!p2.isDead()))) {
        {
          Player _xifexpression = null;
          boolean _equals = Objects.equals(current, p1);
          if (_equals) {
            _xifexpression = p2;
          } else {
            _xifexpression = p1;
          }
          final Player other = _xifexpression;
          current.hit(other);
          current = other;
        }
      }
      Player _xifexpression = null;
      boolean _isDead = p1.isDead();
      if (_isDead) {
        _xifexpression = p2;
      } else {
        _xifexpression = p1;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
