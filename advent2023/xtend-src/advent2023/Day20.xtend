package advent2023

import adventutils.input.InputLoader
import adventutils.maths.Arithmetics
import java.util.List
import java.util.Map
import java.util.Optional
import java.util.Queue
import java.util.Set

class Day20 {

	protected static Map<String, Module> modules = newHashMap("button" -> new Button)
	static Queue<Pair<String, Pair<Boolean, String>>> messages = newLinkedList
	static int low_pulses = 0
	static int high_pulses = 0
	static int i = 0
	static Set<String> pre_end = newHashSet("pv", "qh", "xm", "hz")
	static Set<Long> ranks = newHashSet
	
	def static void main(String[] args) {

		val Set<String> all_receivers = newHashSet

		new InputLoader(2023, 20).inputs.filter[!isBlank].forEach [
			val split = it.split(" -> ")
			val receivers = split.get(1).split(", ")
			all_receivers.addAll(receivers)
			switch (x:split.get(0)) {
				case "broadcaster": modules.put("broadcaster", new BroadCaster(receivers))
				case x.startsWith("&"): modules.put(x.substring(1), new Conjunction(receivers))
				default: modules.put(x.substring(1), new FlipFlop(receivers))
			}
		]

		all_receivers.forEach [
			if (!modules.containsKey(it))
				modules.put(it, new BroadCaster(newArrayList))
		]

		modules.entrySet.forEach [
			val targets = it.value.targets
			targets.map[modules.get(it)].forEach [ tar |
				if (tar instanceof Conjunction)
					(tar as Conjunction).addSource(it.key)
			]
		]

		while (!pre_end.empty) {
			pushButton
			i++
			if(i == 1000) println(low_pulses * high_pulses)
		}
		
		println(ranks.reduce[x,y|Arithmetics.lcm(x,y)])
	}

	def static pushButton() {
		modules.get("button").receiveAndSend(null, false).forEach[messages.add("button" -> it)]
		while (!messages.empty)
			processMessage(messages.poll)
	}

	def static processMessage(Pair<String, Pair<Boolean, String>> message) {
		val source = message.key
		val signal = message.value.key
		val target = message.value.value
		val response = modules.get(target).receiveAndSend(source, signal)
		messages.addAll(response.map[target -> it])
		if(signal) high_pulses++ else low_pulses++
		if(pre_end.contains(source) && signal) {
			pre_end.remove(source)
			ranks.add((i + 1) as long)
		}
	}
}

abstract class Module {

	protected List<String> targets

	new(List<String> targets_) {
		targets = targets_
	}

	def final send(boolean highPulse) {
		targets.map[highPulse -> it]
	}

	def Optional<Boolean> generateSignal(String source, boolean highPulse)

	def final receiveAndSend(String source, boolean highPulse) {
		val toSend = generateSignal(source, highPulse)
		if (toSend.present)
			targets.map[toSend.get -> it]
		else
			newArrayList
	}

	override toString() {
		"sends to + " + targets
	}
}

class Button extends Module {

	new() {
		super(newArrayList("broadcaster"))
	}

	override generateSignal(String source, boolean highPulse) {
		Optional.of(false)
	}
}

class BroadCaster extends Module {

	new(List<String> targets_) {
		super(targets_)
	}

	override generateSignal(String source, boolean highPulse) {
		Optional.of(highPulse)
	}
}

class Conjunction extends Module {

	protected Map<String, Boolean> sources

	new(List<String> targets_) {
		super(targets_)
		sources = newHashMap
	}

	def addSource(String source) {
		sources.put(source, false)
	}

	override generateSignal(String source, boolean highPulse) {
		sources.put(source, highPulse)
		Optional.of(!sources.values.reduce[x, y|x && y])
	}

	override toString() {
		"Receives from " + sources + " ; " + super.toString
	}
}

class FlipFlop extends Module {

	protected boolean on

	new(List<String> targets_) {
		super(targets_)
		on = false
	}

	override generateSignal(String source, boolean highPulse) {
		if (!highPulse) {
			on = !on
			Optional.of(on)
		} else
			Optional.empty
	}
}
