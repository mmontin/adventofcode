package advent2021.puzzle18

import java.io.BufferedReader

abstract class SNumber {
	
	def static final SNumber createSNumber(BufferedReader br, Pair parent_) {
		br.mark(1)
		val first = br.read as char + ''
		br.reset
		first.equals('[') ?	new Pair(br,parent_) : new Singleton(br,parent_)
	}
	
	protected Pair parent = null
	
	new(Pair parent_) {
		parent = parent_
	}
	
	def getParent() {
		parent
	}
	
	def int numberOfAncestors() {
		parent === null ? 0 : 1 + parent.numberOfAncestors
	}
	
	def abstract Singleton findFirstToSplit()
	def abstract Pair findFirstToExplode()
	def abstract void updateValue(boolean right, int value)
	def abstract int magnitude()
}