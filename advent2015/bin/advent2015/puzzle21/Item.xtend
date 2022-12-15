package advent2015.puzzle21

class Item {
	
	protected String name
	protected int cost
	protected int dmg
	protected int arm
	
	new(String name_, int cost_, int dmg_, int arm_) {
		name = name_
		cost = cost_
		dmg = dmg_
		arm = arm_
	}
	
	override equals(Object o) {
		this.name.equals((o as Item).name)
	}
}