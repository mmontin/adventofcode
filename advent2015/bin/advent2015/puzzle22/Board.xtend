package advent2015.puzzle22

import java.util.ArrayList
import java.util.List

class Board {

	static public int mana_min_spent_to_win = Integer::MAX_VALUE

	def static updateManaMin(Integer mana) {
		mana_min_spent_to_win = Math.min(mana_min_spent_to_win, mana)
	}

	static enum Spell {
		MAGIC_MISSILE,
		DRAIN,
		SHIELD,
		POISON,
		RECHARGE
	}

	/*  A list of the game data, in this order :
	 * SHIELD_COUNTER
	 * POISON_COUNTER
	 * RECHARGE_COUNTER
	 * BOSS_HP
	 * BOSS_DMG
	 * PLAYER_HP
	 * PLAYER_MANA
	 * PLAYER_ARMOR
	 */
	List<Integer> boardState

	new() {
		// boardState = newArrayList(0, 0, 0, 14, 8, 10, 250, 0)
		// boardState = newArrayList(0, 0, 0, 13, 8, 10, 250, 0)
		boardState = newArrayList(0, 0, 0, 58, 9, 50, 500, 0)
	}

	new(Board other) {
		boardState = new ArrayList(other.boardState)
	}

	def update(Integer... vector) {
		boardState = (0 .. 7).fold(newArrayList) [ l, i |
			l.add(boardState.get(i) + vector.get(i))
			l
		]
	}

	def availableSpells() {
		var output = newHashSet
		if(shield_counter == 0 && player_mana >= 113) output.add(Spell.SHIELD)
		if(poison_counter == 0 && player_mana >= 173) output.add(Spell.POISON)
		if(recharge_counter == 0 && player_mana >= 229) output.add(Spell.RECHARGE)
		if(player_mana >= 53) output.add(Spell.MAGIC_MISSILE)
		if(player_mana >= 73) output.add(Spell.DRAIN)
		output
	}

	// Return true if the game should end here, false otherwise
	def initTurn() {
		if (shield_counter > 0)
			update(-1, 0, 0, 0, 0, 0, 0, 7 - player_armor)
		else if (player_armor > 0)
			update(0, 0, 0, 0, 0, 0, 0, -player_armor)
		if (poison_counter > 0)
			update(0, -1, 0, -3, 0, 0, 0, 0)
		if (recharge_counter > 0)
			update(0, 0, -1, 0, 0, 0, 101, 0)
		boss_hp <= 0
	}

	def bossTurn() {
		update(0, 0, 0, 0, 0, -Math.max(1, boss_damage - player_armor), 0, 0)
		player_hp <= 0
	}

	def playerTurn(Spell spell) {
		switch (spell) {
			case MAGIC_MISSILE:
				update(0, 0, 0, -4, 0, 0, -53, 0)
			case DRAIN:
				update(0, 0, 0, -2, 0, 2, -73, 0)
			case SHIELD:
				update(6, 0, 0, 0, 0, 0, -113, 0)
			case POISON:
				update(0, 6, 0, 0, 0, 0, -173, 0)
			default:
				update(0, 0, 5, 0, 0, 0, -229, 0)
		}
	}

	def void play(Integer mana_spent_already) {
		update(0, 0, 0, 0, 0, -1, 0, 0)
		if (player_hp > 0) {
			if (initTurn)
				updateManaMin(mana_spent_already)
			else if (mana_min_spent_to_win - mana_spent_already >= 53)
				availableSpells.forEach [
					val newBoard = new Board(this)
					newBoard.playerTurn(it)
					val new_mana_spent = mana_spent_already + player_mana - newBoard.player_mana
					if (newBoard.initTurn)
						updateManaMin(new_mana_spent)
					else if (!newBoard.bossTurn)
						newBoard.play(new_mana_spent)
				]
		}
	}

	def shield_counter() {
		boardState.get(0)
	}

	def poison_counter() {
		boardState.get(1)
	}

	def recharge_counter() {
		boardState.get(2)
	}

	def boss_hp() {
		boardState.get(3)
	}

	def boss_damage() {
		boardState.get(4)
	}

	def player_hp() {
		boardState.get(5)
	}

	def player_mana() {
		boardState.get(6)
	}

	def player_armor() {
		boardState.get(7)
	}
}
