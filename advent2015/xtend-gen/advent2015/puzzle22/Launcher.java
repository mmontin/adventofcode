package advent2015.puzzle22;

import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    long time = System.currentTimeMillis();
    new Board().play(Integer.valueOf(0));
    long _currentTimeMillis = System.currentTimeMillis();
    long _minus = (_currentTimeMillis - time);
    String _plus = ((("The answer is " + Integer.valueOf(Board.mana_min_spent_to_win)) + " and it took ") + Long.valueOf(_minus));
    String _plus_1 = (_plus + " ms to compute it.");
    InputOutput.<String>println(_plus_1);
  }
}
