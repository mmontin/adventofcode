package advent2016.puzzle11

import java.util.ArrayList
import java.util.List
import java.util.Set

class Building implements Comparable<Building> {

	final List<Integer> content
	final Integer elevator
	final Integer score
	final protected boolean isFinal

	Integer distance

	new(List<Integer> content_, Integer elevator_, int distance_) {
		content = content_
		elevator = elevator_
		score = content.reduce[x, y|x + y]
		isFinal = score == 4 * content.size
		distance = distance_
	}

	new(int distance_) {
		this(newArrayList(2, 2, 1, 1, 2, 2, 1, 1, 2, 3, 1, 1, 1, 1), 1, distance_)
	}

	def getDistance() {
		distance
	}
	
	def getScore() {
		score
	}

	def updateDistance(int previous) {
		if (previous + 1 < distance)
			distance = previous + 1
	}

	def valid() {
		val CG = content.get(0)
		val CC = content.get(1)
		val PG = content.get(2)
		val PC = content.get(3)
		val RG = content.get(4)
		val RC = content.get(5)
		val SG = content.get(6)
		val SC = content.get(7)
		val TG = content.get(8)
		val TC = content.get(9)
		val UG = content.get(10)
		val UC = content.get(11)
		val VG = content.get(12)
		val VC = content.get(13)

		(CC == CG || !newHashSet(PG, RG, SG, TG, UG, VG).contains(CC)) &&
		(PC == PG || !newHashSet(CG, RG, SG, TG, UG, VG).contains(PC)) &&
		(RC == RG || !newHashSet(CG, PG, SG, TG, UG, VG).contains(RC)) &&
		(SC == SG || !newHashSet(CG, PG, RG, TG, UG, VG).contains(SC)) &&
		(TC == TG || !newHashSet(CG, PG, RG, SG, UG, VG).contains(TC)) &&
		(UC == UG || !newHashSet(CG, PG, RG, TG, SG, VG).contains(UC)) &&
		(VC == VG || !newHashSet(CG, PG, RG, SG, UG, TG).contains(VC))
	}

	def step(Set<Building> known_states, Set<Building> visited) {

		val el = newHashSet
		if(elevator > 1) el.add(elevator - 1)
		if(elevator < 4) el.add(elevator + 1)

		val indices = (0 ..< content.size).fold(newArrayList) [ s, i |
			if(content.get(i) == elevator) s.add(i)
			s
		]

		val indices_nb = indices.size
		for (e : el) {
			for (i : 0 ..< indices_nb) {
				val l1 = new ArrayList(content)
				l1.set(indices.get(i), e)
				val b = new Building(l1, e, distance + 1)
				if (b.valid) {
					if (known_states.contains(b)) {
						val c = known_states.findFirst[it.equals(b)]
						c.updateDistance(distance)
					} else if (!visited.contains(b))
						known_states.add(b)
				}
				for (j : i + 1 ..< indices_nb) {
					val l = new ArrayList(content)
					l.set(indices.get(i), e)
					l.set(indices.get(j), e)
					val a = new Building(l, e, distance + 1)
					if (a.valid) {
						if (known_states.contains(a)) {
							val c = known_states.findFirst[it.equals(a)]
							c.updateDistance(distance)
						} else if (!visited.contains(a))
							known_states.add(a)
					}
				}
			}
		}
	}

	override equals(Object other) {
		val b = other as Building
		this.toNormalForm.equals(b.toNormalForm) && this.elevator.equals(b.elevator)
	}

	def toNormalForm() {
		(0..<content.size/2).fold(newArrayList)[ l , i |
			l.add('' + content.get(2*i) + content.get(2*i+1))
			l
		].sort.reduce[s , e | s + e]
	}

	override hashCode() {
		this.score * 10 + this.elevator
	}

	override toString() {
		"Distance : " + distance + " ; Score : " + score
	}
	
	override compareTo(Building other) {
		if (other.distance == this.distance)
			other.score.compareTo(this.score)
		else
			this.distance.compareTo(other.distance)
	}
}
