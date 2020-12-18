package advent2020.puzzle16;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class Launcher {

	public static void main(String[] args) throws IOException {

		long millis = System.currentTimeMillis();

		List<TicketField> fields = new ArrayList<TicketField>();
		List<Ticket> tickets = new ArrayList<Ticket>();

		BufferedReader br = new BufferedReader(
				new FileReader("/home/monsieuro/eclipse-workspace/advent2020/inputs/input16"));

		String currentLine;
		while (!(currentLine = br.readLine()).isBlank())
			fields.add(new TicketField(currentLine));

		br.readLine();

		Ticket myTicket = new Ticket(br.readLine());

		br.readLine();
		br.readLine();

		while (!(currentLine = br.readLine()).isBlank())
			tickets.add(new Ticket(currentLine));

		br.close();

		System.out.println("Answer for part 1 is "
				+ tickets.stream().reduce(0, ((x, y) -> x + y.errorRate(fields)), Integer::sum));

		for (int i = 0; i < tickets.size(); i++)
			if (tickets.get(i).errorRate(fields) > 0)
				tickets.remove(i--);

		long millis2 = System.currentTimeMillis();

		System.out.println("It was computed in " + (millis2 - millis) + " ms.");

		List<Set<Integer>> allValues = new ArrayList<>();
		for (int i = 0; i < fields.size(); i++) {
			Set<Integer> s = new HashSet<>();
			for (Ticket t : tickets)
				s.add(t.getValueAt(i));
			allValues.add(s);
		}

		List<Set<TicketField>> allPossibleFields = new ArrayList<>();
		for (Set<Integer> set : allValues) {
			Set<TicketField> setFields = new HashSet<>();
			for (TicketField field : fields) {
				boolean b = true;
				for (Integer i : set) {
					b &= field.inRange(i);
					if (!b)
						break;
				}
				if (b)
					setFields.add(field);
			}
			allPossibleFields.add(setFields);
		}

		Map<Integer, TicketField> mapping = new HashMap<Integer, TicketField>();

		for (int i = 0; i < allPossibleFields.size(); i++) {
			if (allPossibleFields.get(i).size() == 1) {
				TicketField ticketField = allPossibleFields.get(i).iterator().next();
				mapping.put(i, ticketField);
				for (Set<TicketField> s : allPossibleFields)
					s.remove(ticketField);
				i = 0;
			}
		}

		long i = mapping.entrySet().stream().reduce(1L,
				((val, entry) -> val * (entry.getValue().isDeparture() ? myTicket.getValueAt(entry.getKey()) : 1L)),
				((x, y) -> x * y));

		long millis3 = System.currentTimeMillis();

		System.out.println("Answer for part 2 is " + i);
		System.out.println("It was computed in " + (millis3 - millis2) + " ms.");
		System.out.println("In total, the runtime was : " + (millis3 - millis) + " ms.");
	}
}
