package advent2019;

import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;

import adventutils.string.StringUtils;

@SuppressWarnings("all")
public class Day5 {
  public static void main(final String[] args) {
    final Function1<String, Integer> _function = (String it) -> {
      return Integer.valueOf(Integer.parseInt(it));
    };
    /* ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(new InputLoader(Integer.valueOf(2019), Integer.valueOf(5)).getInputs().get(0).split(","))), _function); */
    InputOutput.<String>println(StringUtils.padWith("lol", "0", 10));
  }
}
