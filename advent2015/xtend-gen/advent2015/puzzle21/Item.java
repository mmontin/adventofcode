package advent2015.puzzle21;

@SuppressWarnings("all")
public class Item {
  protected String name;

  protected int cost;

  protected int dmg;

  protected int arm;

  public Item(final String name_, final int cost_, final int dmg_, final int arm_) {
    this.name = name_;
    this.cost = cost_;
    this.dmg = dmg_;
    this.arm = arm_;
  }

  public boolean equals(final Object o) {
    return this.name.equals(((Item) o).name);
  }
}
