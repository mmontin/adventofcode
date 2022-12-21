package advent2022

import java.util.Map
import java.util.List
import adventutils.input.InputLoader

class Day21 {

	static final Map<String, List<String>> monkeys = newHashMap

	def static void main(String[] args) {
		new InputLoader(2022, 21).inputs.forEach [
			val split1 = it.split(": ")
			monkeys.put(split1.get(0), split1.get(1).split(" ").toList)
		]
		println(resolve("root"))

		val root = monkeys.get("root")
		var left = Expression.createExpression(root.get(0))
		var right = Expression.createExpression(root.get(2))
		while (!(left instanceof Unknown)) {
			val left_bis = left as Operation
			val right_bis = right as Value
			switch (left_bis.op) {
				case "+": {
					switch (x : left_bis.left) {
						Value: {
							left = left_bis.right
							right = new Value(right_bis.value - x.value)
						}
						default: {
							left = x
							right = new Value(right_bis.value - (left_bis.right as Value).value)
						}
					}
				}
				case "-": {
					switch (x : left_bis.left) {
						Value: {
							left = left_bis.right
							right = new Value(x.value - right_bis.value)
						}
						default: {
							left = x
							right = new Value(right_bis.value + (left_bis.right as Value).value)
						}
					}
				}
				case "*": {
					switch (x : left_bis.left) {
						Value: {
							left = left_bis.right
							right = new Value(right_bis.value / x.value)
						}
						default: {
							left = x
							right = new Value(right_bis.value / (left_bis.right as Value).value)
						}
					}
				}
				default: {
					switch (x : left_bis.left) {
						Value: {
							left = left_bis.right
							right = new Value(x.value / right_bis.value)
						}
						default: {
							left = x
							right = new Value(right_bis.value * (left_bis.right as Value).value)
						}
					}
				}
			}
		}
		println((right as Value).value)
	}

	def static long resolve(String monkey) {
		val others = monkeys.get(monkey)
		if (others.size == 1)
			Long.parseLong(others.get(0))
		else {
			val left = resolve(others.get(0))
			val right = resolve(others.get(2))
			switch (others.get(1)) {
				case "+": left + right
				case "-": left - right
				case "*": left * right
				default: left / right
			}
		}
	}

	static abstract class Expression {

		def static Expression createExpression(String key) {
			val ops = monkeys.get(key)
			if (key.equals("humn"))
				new Unknown
			else
				try
					new Value(Long.parseLong(ops.get(0)))
				catch (NumberFormatException nfe) {
					val left = createExpression(ops.get(0))
					val right = createExpression(ops.get(2))
					if (left instanceof Value && right instanceof Value) {
						val left_bis = left as Value
						val right_bis = right as Value
						new Value(switch (ops.get(1)) {
							case "+": left_bis.value + right_bis.value
							case "-": left_bis.value - right_bis.value
							case "*": left_bis.value * right_bis.value
							default: left_bis.value / right_bis.value
						})
					} else
						new Operation(left, right, ops.get(1))
				}
		}
	}

	static class Operation extends Expression {

		public Expression left
		public Expression right
		public String op

		new(Expression _left, Expression _right, String _op) {
			left = _left
			right = _right
			op = _op
		}
	}

	static class Value extends Expression {
		public long value

		new(long _value) {
			value = _value
		}
	}

	static class Unknown extends Expression {
	}
}
