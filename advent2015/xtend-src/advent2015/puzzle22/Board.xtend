package advent2015.puzzle22

class Board {

	int shield_counter = 0
	int poison_counter = 0
	int recharge_counter = 0

	int boss_hp = 58
	int boss_damage = 9

	int player_hp = 50
	int player_mana = 500
	int player_armor = 0

	new() {
		shield_counter = 0
		poison_counter = 0
		recharge_counter = 0

		boss_hp = 58
		boss_damage = 9

		player_hp = 50
		player_mana = 500
		player_armor = 0
	}

	new(Board other) {
		shield_counter = other.shield_counter
		poison_counter = other.poison_counter
		recharge_counter = other.recharge_counter

		boss_hp = other.boss_hp
		boss_damage = other.boss_damage

		player_hp = other.player_hp
		player_mana = other.player_mana
		player_armor = other.player_armor
	}

	def availableSpells() {
		var output = newHashSet
		if(shield_counter == 0 && player_mana >= 113) output.add(Spells.SHIELD)
		if(poison_counter == 0 && player_mana >= 173) output.add(Spells.POISON)
		if(recharge_counter == 0 && player_mana >= 229) output.add(Spells.RECHARGE)
		if(player_mana >= 53) output.add(Spells.MAGIC_MISSILE)
		if(player_mana >= 73) output.add(Spells.DRAIN)
		output
	}

	// Return true if the game should end here, false otherwise
	def initTurn() {
		if (shield_counter > 0) {
			player_armor = 7
			shield_counter--
		}
		if (poison_counter > 0) {
			boss_hp -= 3
			poison_counter--
		}
		if (recharge_counter > 0) {
			player_mana += 101
			recharge_counter--
		}
		boss_hp <= 0 ? true : false
	}

	// "turn" is true when it's the player's turn, false otherwise
	// This returns the minimum amount of mana spent to win from this configuration
	def int step(boolean turn, Spells spell) {
		initTurn
			? 0
			: {
			if (turn) {
				var original_mana = player_mana
				// The player plays
				switch (spell) {
					case DRAIN: {
						player_mana -= 73
						player_hp += 2
						boss_hp -= 2
					}
					case MAGIC_MISSILE: {
						player_mana -= 53
						boss_hp -= 4
					}
					case SHIELD: {
						player_mana -= 113
						shield_counter = 6
					}
					case POISON: {
						player_mana -= 173
						poison_counter = 6
					}
					default: { // RECHARGE
						player_mana -= 229
						recharge_counter = 5
					}
				}
				original_mana - player_mana + (boss_hp <= 0 ? 0 : step(false, null))
			} else {
				// The boss plays
				player_hp -= Math.max(1, boss_damage - player_armor)
				// If the boss wins, we stop here with MAX_VALUE, otherwise, we explore the possible next steps
				player_hp <= 0
					? Integer::MAX_VALUE
					: availableSpells.fold(Integer::MAX_VALUE)[v, s|Math.min(v, new Board(this).step(true, s))]
			}
		}
	}
}
