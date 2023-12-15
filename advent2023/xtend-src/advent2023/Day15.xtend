package advent2023

import adventutils.collection.Collection
import adventutils.input.InputLoader
import java.util.function.Function

class Day15 {
	def static void main(String[] args) {

		val Function<String, Integer> decode = [
			it.toCharArray.fold(0) [ acc, el |
				((el as int + acc) * 17) % 256
			]
		]

		val codes = new InputLoader(2023, 15).inputs.get(0).split(",")
		println(codes.fold(0)[acc, el|acc + decode.apply(el)])

		val boxes = Collection.aggregateToMap(codes)[el,boxes|
			if (el.contains("=")) {
				val split = el.split("=")
				val label = split.get(0)
				val box = decode.apply(label)
				val focal = Integer.parseInt(split.get(1))
				val previous = boxes.get(box)
				if (previous === null)
					boxes.put(box, newArrayList(label -> focal))
				else {
					val index = previous.map[key].indexOf(label)
					if (index == -1)
						previous.add(label -> focal)
					else
						previous.set(index, label -> focal)
				}
			} else {
				val label = el.split("-").get(0)
				val previous = boxes.get(decode.apply(label))
				if (previous !== null) {
					val index = previous.map[key].indexOf(label)
					if(index != -1) previous.remove(index)
				}
			}
		]

		println(boxes.entrySet.fold(0) [ acc, box |
			box.value.fold(acc -> 1) [ acc1, lense |
				acc1.key + acc1.value * (box.key + 1) * lense.value -> acc1.value + 1
			].key
		])
	}
}
