package advent2023

import adventutils.geometry.Interval
import adventutils.input.InputLoader
import java.math.BigInteger
import java.util.List
import java.util.Map
import java.util.Set

class Day19 {
	def static void main(String[] args) {
		val inputs = new InputLoader(2023, 19).inputs
		val rank = inputs.indexOf("")
		inputs.subList(0, rank).forEach[new Rules(it)]
		val res = inputs.subList(rank + 1, inputs.size).fold(newArrayList) [ l, el |
			Rules.all_rules.get("in").process(el.substring(1, el.length - 1).split(",").map [
				Integer.parseInt(it.split("=").get(1))
			], l)
			l
		]

		println(res.fold(0) [ acc, el |
			acc + el.get(0) + el.get(1) + el.get(2) + el.get(3)
		])

		val intervals = Rules.all_rules.get("in").processItvs(newArrayList(new Interval(1, 4000), new Interval(1, 4000), new Interval(1, 4000),
			new Interval(1, 4000)))
			
		println(intervals.key.fold(BigInteger.ZERO)[acc,el|
			acc + el.map[BigInteger.valueOf(it.length + 1)].reduce[x,y | x * y]
		])
	}
}

interface Rule {
	def boolean process(List<Integer> values, List<List<Integer>> accepted)

	def Pair<Set<List<Interval>>,List<Interval>> processItvs(List<Interval> itvs)
}

class AcceptRule implements Rule {

	override process(List<Integer> values, List<List<Integer>> accepted) {
		accepted.add(values)
		true
	}

	override processItvs(List<Interval> itvs) {
		newHashSet(itvs)->newArrayList
	}
}

class RejectRule implements Rule {

	override process(List<Integer> values, List<List<Integer>> accepted) {
		true
	}

	override processItvs(List<Interval> itvs) {
		newHashSet->newArrayList
	}
}

class CompareRule implements Rule {

	boolean isLower
	int rank
	int value
	Rule next

	new(String s) {
		isLower = s.contains("<")
		val split = isLower ? s.split("[<:]") : s.split("[>:]")
		rank = Rules.getRank(split.get(0))
		value = Integer.parseInt(split.get(1))
		next = Rules.createRule(split.get(2))
	}

	override process(List<Integer> values, List<List<Integer>> accepted) {
		if (isLower ? (values.get(rank) < value) : (values.get(rank) > value)) {
			next.process(values,accepted)
			true
		} else 
			false
	}

	override processItvs(List<Interval> itvs) {
		val left = newArrayList
		val right = newArrayList ;
		(0..<4).forEach[
			val current = itvs.get(it)
			if (it == rank) {
				val split = current.split(value,!isLower)
				left.add(isLower ? split.key : split.value)
				right.add(isLower ? split.value : split.key)
			} else {
				right.add(new Interval(current))
				left.add(new Interval(current))
			}
		]
		next.processItvs(left).key -> right
	}
}

class RedirectRule implements Rule {
	
	String where
	
	new(String where_) {
		where = where_
	}
	
	override process(List<Integer> values, List<List<Integer>> accepted) {
		Rules.all_rules.get(where).process(values,accepted)
		true
	}
	
	override processItvs(List<Interval> itvs) {
		Rules.all_rules.get(where).processItvs(itvs)
	}
}

class Rules implements Rule {

	public static final Map<String, Rules> all_rules = newHashMap

	List<Rule> rules

	new(String s) {
		val split = s.split("\\{")
		val name = split.get(0)
		val p = split.get(1).substring(0, split.get(1).length - 1)
		rules = p.split(",").toList.map[createRule]
		all_rules.put(name, this)
	}
	
	def static Rule createRule(String s) {
		switch s {
			case "R": new RejectRule
			case "A": new AcceptRule
			case s.contains("<") || s.contains(">"): new CompareRule(s)
			default: new RedirectRule(s)
		}
	}

	override process(List<Integer> values, List<List<Integer>> accepted) {
		var finished = false
		var i = 0
		while (i < rules.size && !finished) {
			finished = rules.get(i).process(values,accepted)
			i++			
		}
		finished
	}
	
	override processItvs(List<Interval> itvs) {
		var i = 0
		var List<Interval> res = itvs
		val output = newHashSet
		while (i < rules.size && !res.empty) {
			val apply = rules.get(i).processItvs(res)
			res = apply.value
			output.addAll(apply.key)
			i++
		}
		output -> newArrayList
	}

	def static getRank(String s) {
		switch s {
			case "x": 0
			case "m": 1
			case "a": 2
			default: 3
		}
	}
}
