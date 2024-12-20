package adventutils

import java.util.Map
import java.util.function.Function
import org.eclipse.xtext.xbase.lib.Functions.Function2

class MemoryRunner<I, O> {

	public Map<I, O> results
	Function<I, O> fun
	int calls_saved

	new(Function<I, O> fun_) {
		this()
		bind(fun_)
	}

	new() {
		results = newHashMap
		calls_saved = 0
	}

	def bind(Function<I, O> fun_) {
		fun = fun_
		this
	}

	def O call(I param) {
		if (results.containsKey(param)) {
			calls_saved++
			obtain(param)
		} else {
			val res = fun.apply(param)
			results.put(param, res)
			res
		}
	}

	def protected obtain(I param) {
		results.get(param)
	}

	def reset() {
		results.clear
		calls_saved = 0
	}

	def saved() {
		calls_saved
	}
}

class MemoryRunnerWithDefault<I, O> extends MemoryRunner<I, O> {

	O default_value

	new(O default_, Function<I, O> fun_) {
		super(fun_)
		default_value = default_
	}

	override obtain(I param) {
		default_value
	}
}

class MemoryRunner2<I, I2, O> extends MemoryRunner<Pair<I, I2>, O> {

	new(Function2<I, I2, O> fun) {
		super[
			fun.apply(it.key, it.value)
		]
	}

	def O call(I par1, I2 par2) {
		super.call(par1 -> par2)
	}
}
