package advent2018

import adventutils.input.InputLoader
import java.util.Collection
import java.util.List
import java.util.Optional
import java.util.Set

class Day24 {

	static final int size = 10
	static final List<Unit> groups = newArrayList
	static List<String> input = new InputLoader(2018, 24).inputs

	def static void main(String[] args) {

		play(0)
		println(groups.fold(0)[acc, el|acc + el.count])

		var min = 1
		var max = 1000
		var res = 0
		while (max - min > 0) {
			val middle = min + (max - min) / 2
			if (play(middle))
				min = middle + 1
			else {
				max = middle
				res = groups.fold(0)[acc, el|acc + el.count]
			}
		}
		println(res)
	}

	static def play(int inflation) {

		groups.clear
		for (i : 0 .. 2 * size - 1)
			groups.add(new Unit(i % size + 1, input, (8 * i), i >= size))

		groups.filter[!it.is_infection].forEach[it.damage += inflation]
		var damage_dealt = true
		
		while (groups.exists[it.is_infection] && groups.exists[!it.is_infection] && damage_dealt) {

			// selecting targets
			val targets = newHashMap
			groups.sortBy[-(it.effective_power * 100 + it.initiative)].forEach [
				val selected = it.select_target(targets.values)
				if(!selected.isEmpty) targets.put(it, selected.get)
			]

			// dealing damage
			damage_dealt = groups.sortBy[-initiative].fold(false) [acc, el |
				if (el.count > 0 && targets.containsKey(el))
					el.deal_damage(targets.get(el)) || acc
				else 
					acc
			]

			// removing empty groups
			groups.removeIf[it.count <= 0]
		}

		!damage_dealt || groups.head.is_infection
	}

	static class Unit {
		int id
		int count
		int hp
		Set<String> weaknesses
		Set<String> immunities
		int damage
		String damage_type
		int initiative
		boolean is_infection

		new(int id_, List<String> input, int index, boolean is_infection_) {
			id = id_
			count = Integer.parseInt(input.get(index))
			hp = Integer.parseInt(input.get(index + 1))
			weaknesses = input.get(index + 2).split(", ").toSet
			immunities = input.get(index + 3).split(", ").toSet
			damage = Integer.parseInt(input.get(index + 4))
			damage_type = input.get(index + 5)
			initiative = Integer.parseInt(input.get(index + 6))
			is_infection = is_infection_
		}

		def effective_power() {
			count * damage
		}

		override toString() {
			"[" + #[id, is_infection ? "infection" : "immune", "hp : " + hp, count].join(",") + "]"
		}

		def simulate_damage(Unit other) {
			switch other {
				case other.is_infection == is_infection: 0
				case other.immunities.contains(damage_type): 0
				case other.weaknesses.contains(damage_type): 2 * effective_power
				default: effective_power
			}
		}

		def deal_damage(Unit other) {
			val death_count = simulate_damage(other) / other.hp
			other.count -= death_count
			death_count > 0
		}

		override hashCode() {
			is_infection ? -id : id
		}

		override equals(Object other) {
			switch other {
				Unit: other.id == id && other.is_infection == is_infection
				default: false
			}
		}

		def select_target(Collection<Unit> already_selected) {
			val candidate = groups.filter [
				!already_selected.contains(it)
			].groupBy [
				this.simulate_damage(it)
			].entrySet.maxBy [
				key
			].value.groupBy [
				effective_power
			].entrySet.maxBy [
				key
			].value.groupBy [
				initiative
			].entrySet.maxBy [
				key
			].value.head
			simulate_damage(candidate) > 0 ? Optional.of(candidate) : Optional.empty
		}
	}
}
