package advent2021.puzzle18

import java.io.BufferedReader

class Pair extends SNumber {
	
	SNumber left
	SNumber right
	
	new (BufferedReader br, Pair parent_) {
		super(parent_)
		br.read
		left = SNumber.createSNumber(br,this)
		br.read
		right = SNumber.createSNumber(br,this)
		br.read
	}
	
	new (SNumber s1, SNumber s2, Pair parent_) {
		super(parent_)
		left = s1
		s1.parent = this
		right = s2
		s2.parent = this
	}
	
	new (int v1, int v2, Pair parent_) {
		super(parent_)
		left = new Singleton(v1,this)
		right = new Singleton(v2,this)
	}
	
	def update(SNumber previousSN, SNumber newSN) {
		left == previousSN ? left = newSN : right = newSN 
	}
	
	def reduce() {
		var SNumber toProcess
		do {
			toProcess = findFirstToExplode
			if (toProcess !== null) {
				(toProcess as Pair).explode
			} else {
				toProcess = findFirstToSplit
				if (toProcess !== null)
					(toProcess as Singleton).split
			}
		} while (toProcess !== null)
		return this
	}
	
	override Singleton findFirstToSplit() {
		val ans = left.findFirstToSplit
		ans === null ? right.findFirstToSplit : ans
	}
	
	override findFirstToExplode() {
		if (numberOfAncestors == 4)
			this
		else {
			var leftFirst = left.findFirstToExplode
			leftFirst !== null ? leftFirst : right.findFirstToExplode
		}
	}
	
	def SNumber findFirst(SNumber nb, boolean b) {
		nb == (b ? left : right) ? (b ? right : left) : (parent === null ? null : parent.findFirst(this,b))
	}
	
	def explode() {
		if (parent !== null) {
			val leftV = (left as Singleton).value
			val rightV = (right as Singleton).value
			val findFirstLeft = parent.findFirst(this,false)
			if (findFirstLeft !== null) findFirstLeft.updateValue(true,leftV)
			val findFirstRight = parent.findFirst(this,true)
			if (findFirstRight !== null) findFirstRight.updateValue(false,rightV)
			parent.update(this,new Singleton(0,parent))
		}
	}
	
	override toString() {
		'[' + left + ',' + right + ']'
	}
	
	override updateValue(boolean r, int value) {
		r ? right.updateValue(r,value) : left.updateValue(r,value)
	}
	
	override magnitude() {
		3 * left.magnitude + 2 * right.magnitude
	}
}