package advent2021.puzzle17

class Launcher {

	static final int minX = 281
	static final int maxX = 311
	static final int minY = -74
	static final int maxY = -54

	def static void main(String[] args) {
		var max_velocity_x = maxX
		var max_velocity_y = -minY - 1
		
		val map_y_candidates = newHashMap
		
		for (vy : -(max_velocity_y+1)..max_velocity_y)
			getYCandidateSteps(vy).forEach[
				map_y_candidates.merge(it,newHashSet(vy))[s1 , s2 | s1.addAll(s2) ; s1]
			]
		
		var max_y = 0
		var velocities = newHashSet
		
		for (vx : 1..max_velocity_x)
			for (e : map_y_candidates.entrySet)
				if (validXValue(vx,e.key))
					for (vy : e.value) {
						max_y = Math.max(max_y, (vy * (vy + 1) / 2))
						velocities.add(vx + ',' + vy)
					}

		println('PART 1: ' + max_y)
		println('PART 2: ' + velocities.size)
	}

	def static getYCandidateSteps(int vy) {
		var step_nbs = newHashSet
		var step_nb = vy > 0 ? 2 * vy + 1 : 0
		var y = 0
		var vely = vy > 0 ? -vy - 1 : vy
		while (y > minY) {
			step_nb++
			y += vely
			vely--
			if(y >= minY && y <= maxY) step_nbs.add(step_nb)
		}
		step_nbs
	}
	
	def static validXValue(int vx, int step) {
		var value = step >= vx + 1 ? vx * (vx + 1) / 2 : step * (2 * vx - step + 1) / 2
		value >= minX && value <= maxX
	}
}
