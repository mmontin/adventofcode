package advent2020.puzzle9;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import adventutils.input.InputLoader;

public class Launcher {

	private static final int RANGE = 25;

	public static void main(String[] args) throws IOException {
		List<Long> inputs = new InputLoader(2020,9).getInputs().stream().map(x -> Long.parseLong(x)).collect(Collectors.toList());
		List<Long> toCheck = new ArrayList<>(inputs.subList(0, RANGE));
		List<Long> toBeChecked = new ArrayList<>(inputs.subList(RANGE, inputs.size()));
		long key = checkList(toCheck, toBeChecked);
		System.out.println("Key : " + key);
		long t1 = System.currentTimeMillis() ;
		System.out.println("WeaknessSmart : " + findContiguousSetSmart(0, 1, key, inputs.get(0) + inputs.get(1), inputs));
		long t2 = System.currentTimeMillis() ;
		System.out.println("Duration : " + (t2 - t1) + " ms");
		System.out.println("WeaknessBrute : " + findContinuousSetBF(inputs, key));
		long t3 = System.currentTimeMillis() ;
		System.out.println("Duration : " + (t3 - t2) + " ms");
	}

	private static long findContiguousSetSmart(int i, int j, long key, long currentSum, List<Long> inputs) {
		if (i == j)
			return findContiguousSetSmart(i, i + 1, key, inputs.get(i) + inputs.get(i + 1), inputs);
		if (currentSum < key)
			return findContiguousSetSmart(i, j + 1, key, currentSum + inputs.get(j + 1), inputs);
		if (currentSum > key)
			return findContiguousSetSmart(i + 1, j, key, currentSum - inputs.get(i), inputs);
		else // currentSum == key
			return inputs.subList(i, j + 1).stream().min(Long::compare).get()
					+ inputs.subList(i, j + 1).stream().max(Long::compare).get();
	}

	private static long findContinuousSetBF(List<Long> inputs, long key) {
		for (int i = 0; i < inputs.size()-1; i++) {
			for (int j = i+1; j < inputs.size(); j++) {
				List<Long> sublist = inputs.subList(i, j+1) ;
				if (sublist.stream().reduce(Long::sum).get() == key) {
					return sublist.stream().min(Long::compare).get() + sublist.stream().max(Long::compare).get();
				}
			}
		}
		return 0 ;
	}
	
	public static long checkList(List<Long> toCheck, List<Long> toBeChecked) {
		Long head = toBeChecked.remove(0);
		if (!check(toCheck, head)) {
			return head;
		} else {
			toCheck.remove(0);
			toCheck.add(head);
			return checkList(toCheck, toBeChecked);
		}
	}

	private static boolean check(List<Long> toCheck, Long g) {
		for (Long l1 : toCheck)
			for (Long l2 : toCheck)
				if (l1 != l2 && l1 + l2 == g)
					return true;
		return false;
	}
}
