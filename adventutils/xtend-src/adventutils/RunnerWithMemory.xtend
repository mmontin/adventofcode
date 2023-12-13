package adventutils

import java.util.Map
import java.util.function.Function
import org.eclipse.xtext.xbase.lib.Functions.Function2

class RunnerWithMemory<T, V> {

	Map<T, V> results
	Function<T, V> fun

	new(Function<T, V> fun_) {
		results = newHashMap
		fun = fun_
	}

	def V call(T param) {
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

class RunnerWithMemory2<T, T2, V> extends RunnerWithMemory<Pair<T, T2>, V> {

	new(Function2<T, T2, V> fun) {
		super[
			fun.apply(it.key, it.value)
		]
	}
	
	def V call(T par1, T2 par2) {
		super.call(par1 -> par2)
	}
}
