package advent2016.puzzle15;

import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    int t = 0;
    while ((!(((((((((t + 2) % 17) == 0) && 
      (((t + 2) % 7) == 0)) && 
      (((t + 5) % 19) == 0)) && 
      (((t + 4) % 5) == 0)) && 
      (((t + 5) % 3) == 0)) && 
      (((t + 11) % 13) == 0)) && 
      (((t + 7) % 11) == 0)))) {
      t++;
    }
    InputOutput.<Integer>println(Integer.valueOf(t));
  }
}
