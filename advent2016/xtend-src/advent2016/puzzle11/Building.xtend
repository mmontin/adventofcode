package advent2016.puzzle11

import java.util.ArrayList
import java.util.List

class Building {

	// curium plutonium ruthenium strontium thulium
	// generator, then chip
	final List<Integer> content
	final Integer elevator
	final Integer score
	final protected boolean isFinal

	new(List<Integer> content_, Integer elevator_) {
		content = content_
		elevator = elevator_
		score = content.reduce[x, y|x + y]
		isFinal = score == 4 * content.size
	}

	new() {
		this(newArrayList(2, 2, 1, 1, 2, 2, 1, 1, 2, 3),1)
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

		(CC == CG || !newHashSet(PG,RG,SG,TG).contains(CC)) &&
		(PC == PG || !newHashSet(CG,RG,SG,TG).contains(PC)) &&
		(RC == RG || !newHashSet(CG,PG,SG,TG).contains(RC)) &&
		(SC == SG || !newHashSet(CG,PG,RG,TG).contains(SC)) &&
		(TC == TG || !newHashSet(CG,PG,RG,SG).contains(TC))
	}

	def steps() {
		val el = newHashSet
		if(elevator > 1) el.add(elevator - 1)
		if(elevator < 4) el.add(elevator + 1)

		val indices = (0..<content.size).fold(newArrayList) [ s, i |
			if(content.get(i) == elevator) s.add(i)
			s
		]
		
		val possible_states = newArrayList
		val indices_nb = indices.size
		for (e : el) {
			for (i : 0 ..< indices_nb) {
				val l1 = new ArrayList(content)
				l1.set(indices.get(i),e)
				possible_states.add(new Building(l1,e))
				for (j : i + 1 ..< indices_nb) {
					val l = new ArrayList(content)
					l.set(indices.get(i), e)
					l.set(indices.get(j), e)
					possible_states.add(new Building(l, e))
				}
			}
		}
		
		possible_states.filter[valid].sortBy[-score]
	}

	override equals(Object other) {
		val b = other as Building
		this.content.equals(b.content) && this.elevator.equals(b.elevator)
	}
	
	override hashCode() {
		this.score * 10 + this.elevator	
	}

	override toString() {
		"Elements : " + content + " ; Elevator : " + elevator
	}
}
