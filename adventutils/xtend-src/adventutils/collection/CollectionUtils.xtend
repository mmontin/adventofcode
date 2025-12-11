package adventutils.collection

import java.util.List
import java.util.Map
import java.util.Set
import java.util.Collection
import org.eclipse.xtext.xbase.lib.Functions.Function2

class CollectionUtils {

	static def <T, L extends Collection<T>> L cons(T e, L l) {
		l.add(e)
		l
	}
	
	static def <T , L extends Collection<T>, M extends Collection<T>> L consAll(M els, L l) {
		l.addAll(els)
		l
	}
	
	static def <O, E, D> O aggregate(Iterable<E> input, Function2<E, O, D> fun, O init) {
		input.forEach [
			fun.apply(it, init)
		]
		init
	}

	static def <K, V, E, D> Map<K, V> aggregateToMap(Iterable<E> input, Function2<E, Map<K, V>, D> fun) {
		aggregate(input, fun, newHashMap)
	}
	
	static def <K, V, E, D> Map<K, V> aggregateToMapWithSeed(Iterable<E> input, Map<K,V> seed, Function2<E, Map<K, V>, D> fun) {
		aggregate(input, fun, seed)
	}
	
	static def <K, E, D> List<K> aggregateToList(Iterable<E> input, Function2<E, List<K>, D> fun) {
		aggregate(input, fun, newArrayList)
	}
	
	static def <K, E, D> Set<K> aggregateToSet(Iterable<E> input, Function2<E, Set<K>, D> fun) {
		aggregate(input, fun, newHashSet)
	}	
	
	static def <K, E, D, S extends Set<K>> S aggregateToSetWithSeed(Iterable<E> input, S seed, Function2<E, S, D> fun) {
		aggregate(input, fun, seed)
	}
}
