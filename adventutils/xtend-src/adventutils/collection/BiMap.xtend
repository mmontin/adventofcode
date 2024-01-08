package adventutils.collection

import java.util.HashSet
import java.util.Map

class BiMap<K, V> {

	final public Map<K, HashSet<V>> left_right
	final public Map<V, HashSet<K>> right_left

	new() {
		left_right = newHashMap
		right_left = newHashMap
	}

	new(BiMap<K, V> other) {
		left_right = newHashMap
		other.left_right.entrySet.forEach [
			left_right.put(key, new HashSet(value))
		]

		right_left = newHashMap
		other.right_left.entrySet.forEach[
			right_left.put(key, new HashSet(value))
		]
	}

	def put(K key, V value) {
		left_right.merge(key, newHashSet(value))[x, y|x.addAll(y); x]
		right_left.merge(value, newHashSet(key))[x, y|x.addAll(y); x]
	}

	def rm(K key) {
		val value = left_right.getOrDefault(key, newHashSet)
		left_right.remove(key)
		value.forEach [
			right_left.get(it).remove(key)
		]
		value
	}
}
