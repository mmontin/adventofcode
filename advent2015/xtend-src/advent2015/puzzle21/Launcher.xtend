package advent2015.puzzle21

import java.util.List

class Launcher {

	static List<Item> weapons = newArrayList(
		new Item("Dagger", 8, 4, 0),
		new Item("Shortsword", 10, 5, 0),
		new Item("Warhammer", 25, 6, 0),
		new Item("Longsword", 40, 7, 0),
		new Item("Greataxe", 74, 8, 0)
	)

	static List<Item> armors = newArrayList(
		new Item("noArmmor", 0, 0, 0),
		new Item("Leather", 13, 0, 1),
		new Item("Chainmail", 31, 0, 2),
		new Item("Splintmail", 53, 0, 3),
		new Item("Bandedmail", 75, 0, 4),
		new Item("Platemail", 102, 0, 5)
	)

	static List<Item> rings = newArrayList(
		new Item("noRing1", 0, 0, 0),
		new Item("noRing2", 0, 0, 0),
		new Item("dam1", 25, 1, 0),
		new Item("dam2", 50, 2, 0),
		new Item("dam3", 100, 3, 0),
		new Item("def1", 20, 0, 1),
		new Item("def2", 40, 0, 2),
		new Item("def3", 80, 0, 3)
	)

	def static void main(String[] args) {

		var min_cost = Integer::MAX_VALUE
		var max_cost = Integer::MIN_VALUE
		
		for (weapon : weapons)
			for (armor : armors)
				for (ring1 : rings)
					for (ring2 : rings)
						if (!ring1.equals(ring2)) {
							var cost = weapon.cost + armor.cost + ring1.cost + ring2.cost
							var p = new Player(100)
							p.addAllItems(newArrayList(weapon, armor, ring1, ring2))
							var boss = new Player(100, 8, 2)
							if (battle(p, boss) == p)
								min_cost = Math.min(min_cost, cost)
							else
								max_cost = Math.max(max_cost, cost)
						}
						
		println(min_cost + "," + max_cost)
	}

	def static battle(Player p1, Player p2) {
		var current = p1
		while (!p1.isDead && !p2.isDead) {
			val other = current == p1 ? p2 : p1
			current.hit(other)
			current = other
		}
		p1.isDead ? p2 : p1
	}
}
