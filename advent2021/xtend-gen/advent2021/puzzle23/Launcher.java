package advent2021.puzzle23;

import org.eclipse.xtext.xbase.lib.InputOutput;

import adventutils.pathfinding.AStar;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final long timer = System.currentTimeMillis();
    AmphipodState _amphipodState = new AmphipodState();
    InputOutput.<Integer>println(new AStar(_amphipodState).run().getMinDistance());
    long _currentTimeMillis = System.currentTimeMillis();
    long _minus = (_currentTimeMillis - timer);
    String _plus = ("Result computed in " + Long.valueOf(_minus));
    String _plus_1 = (_plus + "ms");
    InputOutput.<String>println(_plus_1);
  }
}
