package advent2023

import adventutils.input.InputLoader

class Day15 {
	def static void main(String[] args) {
		val codes = new InputLoader(2023, 15).inputs.get(0).split(",")
		println(codes.fold(0)[acc, el|acc + decode(el)])

		val boxes = newHashMap
		codes.forEach [
			if (it.contains("=")) {
				val split = it.split("=")
				val label = split.get(0)
				val box = decode(label)
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
				val label = it.split("-").get(0)
				val previous = boxes.get(decode(label))
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

	def static int decode(String s) {
		s.toCharArray.fold(0) [ acc, el |
			var ans = el as int + acc;
			(ans * 17) % 256
		]
	}
}
