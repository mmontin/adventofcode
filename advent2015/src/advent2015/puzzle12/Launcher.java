package advent2015.puzzle12;

import java.io.IOException;
import java.io.StringReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.json.* ;

import advent2015.Utils;

public class Launcher {

	public static void main(String[] args) throws IOException {
		
		String input = Utils.getInputs(12).get(0) ;
		
		// Part 1
        Pattern p = Pattern.compile("-?\\d+");
        Matcher m = p.matcher(input);
        int sum = 0 ;
        while(m.find()) sum += Integer.parseInt(m.group()) ;
        System.out.println(sum);
        
        // Part 2
        JsonObject jo = Json.createReader(new StringReader(input)).readObject() ;
        System.out.println(handleObject(jo));
	}
	
	private static long handleObject(JsonObject jo) {
		long ans = 0 ;
		for (JsonValue e : jo.values()) {
			if (e instanceof JsonNumber) {
				ans += ((JsonNumber) e).longValue() ;
			} else if (e instanceof JsonObject) {
				ans += handleObject((JsonObject)e) ;
			} else if (e instanceof JsonString) {
				if (((JsonString) e).getString().equals("red")) return 0 ;
			} else { // JsonArray
				ans += handleArray((JsonArray)e) ;
			}
		}
		return ans;
	}
	
	private static long handleArray(JsonArray ja) {
		long ans = 0 ;
		for (JsonValue e : ja) {
			if (e instanceof JsonNumber) {
				ans += ((JsonNumber) e).longValue() ;
			} else if (e instanceof JsonObject) {
				ans += handleObject((JsonObject)e) ;
			} else if (e instanceof JsonString) {
				// Nothing to do, we are in an array
			} else { // JsonArray
				ans += handleArray((JsonArray)e) ;
			}
		}
		return ans;
	}
}
