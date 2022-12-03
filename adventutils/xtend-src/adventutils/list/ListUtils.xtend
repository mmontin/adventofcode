package adventutils.list

import java.util.List

class ListUtils {
	
	def static <T, L extends List<T>> L cons(T e, L l) {
		l.add(e) ; l
	}
}