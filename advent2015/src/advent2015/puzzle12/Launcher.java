package advent2015.puzzle12;

//import java.io.IOException;
//import java.io.StringReader;
//import java.util.regex.Matcher;
//import java.util.regex.Pattern;

//import javax.json.Json;
//import javax.json.JsonArray;
//import javax.json.JsonNumber;
//import javax.json.JsonObject;
//import javax.json.JsonString;
//import javax.json.JsonValue;

//import advent2015.Utils;

public class Launcher {
//
//	public static void main(String[] args) throws IOException {
//		String input = Utils.getInputs(12).get(0) ;
//        Matcher m = Pattern.compile("-?\\d+").matcher(input);
//        int sum = 0 ;
//        while(m.find()) sum += Integer.parseInt(m.group()) ;
//        System.out.println(sum);
//        System.out.println(handleObject(Json.createReader(new StringReader(input)).readObject()));
//	}
//	
//	private static long handleObject(Object o) {
//		long ans = 0 ;
//		for (JsonValue e : o instanceof JsonObject ? ((JsonObject)o).values() : (JsonArray)o) {
//			if (e instanceof JsonNumber) {
//				ans += ((JsonNumber) e).longValue() ;
//			} else if (e instanceof JsonObject) {
//				ans += handleObject(e) ;
//			} else if (e instanceof JsonString) {
//				if (o instanceof JsonObject && ((JsonString) e).getString().equals("red")) return 0 ;
//			} else { // JsonArray
//				ans += handleObject(e) ;
//			}
//		}
//		return ans;
//	}
}
