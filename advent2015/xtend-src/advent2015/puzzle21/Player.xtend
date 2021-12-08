package advent2015.puzzle21

import java.util.List

class Player {

	protected int hp
	int dmg
	int armor
	
	new(int hp_) {
		this(hp_, 0, 0)
	}
	
	new(int hp_, int dmg_, int armor_) {
		this.hp = hp_
		this.dmg = dmg_
		this.armor = armor_	
	}
	
	def isDead() {
		hp <= 0
	}
	
	def hit(Player p) {
		p.hp = p.hp - Math.max(1, this.dmg - p.armor)
	}
	
	def addItem(Item i) {
		dmg += i.dmg
		armor += i.arm
	}
	
	def addAllItems(List<Item> items) {
		items.forEach[i | this.addItem(i)]
	}
}