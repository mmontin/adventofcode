package adventutils

import java.util.Map
import java.util.Set
import java.util.function.Function
import org.eclipse.xtext.xbase.lib.Functions.Function2

class MemoryRunner<I, O> {

	Map<I, O> results
	Function<I, O> fun

	new(Function<I, O> fun_) {
		results = newHashMap
		fun = fun_
	}

	def O call(I param) {
		val prev_result = results.get(param)
		if (prev_result !== null)
			prev_result
		else {
			val res = fun.apply(param)
			results.put(param, res)
			res
		}
	}
}

class MemoryRunnerWithDefault<I, O> {

	Set<I> inputs
	Function<I, O> fun
	O default_value
	int calls_saved

	new(O default_, Function<I, O> fun_) {
		inputs = newHashSet
		fun = fun_
		default_value = default_
		calls_saved = 0
	}
	
	def O call(I param) {
		if (inputs.contains(param)) {
			calls_saved ++
			default_value
		}	
		else {
			inputs.add(param)
			fun.apply(param)
		}	
	}
	
	def saved() {
		calls_saved
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
