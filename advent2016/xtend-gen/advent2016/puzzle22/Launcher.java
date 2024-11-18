package advent2016.puzzle22;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import java.io.BufferedReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  public static Map<Coordinate, Node> input = new Function0<Map<Coordinate, Node>>() {
    @Override
    public Map<Coordinate, Node> apply() {
      try {
        HashMap<Coordinate, Node> _xblockexpression = null;
        {
          final HashMap<Coordinate, Node> output = CollectionLiterals.<Coordinate, Node>newHashMap();
          final BufferedReader stream = new InputLoader(Integer.valueOf(2016), Integer.valueOf(22)).getInputReader();
          stream.readLine();
          stream.readLine();
          String s = null;
          while (((s = stream.readLine()) != null)) {
            {
              final String[] split = s.split("\\s+");
              String _replaceAll = ((split[0]).split("/")[3]).substring(6).replaceAll("-y", ",");
              Coordinate _coordinate = new Coordinate(_replaceAll);
              String _get = split[1];
              String _get_1 = split[2];
              Node _node = new Node(_get, _get_1);
              output.put(_coordinate, _node);
            }
          }
          _xblockexpression = output;
        }
        return _xblockexpression;
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    }
  }.apply();

  private static int viablePairs = 0;

  public static Set<Coordinate> walls = CollectionLiterals.<Coordinate>newHashSet();

  public static Coordinate initial;

  public static Coordinate dataPosition;

  public static Coordinate target;

  public static void main(final String[] args) {
    Launcher.initialize();
    InputOutput.<Integer>println(Integer.valueOf(Launcher.viablePairs));
    int totalCost = 0;
    final AStar pathfinding = new AStar();
    while ((!Launcher.dataPosition.equals(new Coordinate(0, 0)))) {
      {
        CoordinateState _coordinateState = new CoordinateState(Launcher.initial);
        pathfinding.initialize(_coordinateState);
        int _talCost = totalCost;
        Integer _minDistance = pathfinding.run().getMinDistance();
        int _plus = ((_minDistance).intValue() + 1);
        totalCost = (_talCost + _plus);
        int _x = Launcher.target.getX();
        int _minus = (_x - 1);
        int _y = Launcher.target.getY();
        Coordinate _coordinate = new Coordinate(_minus, _y);
        Launcher.target = _coordinate;
        int _x_1 = Launcher.target.getX();
        int _plus_1 = (_x_1 + 1);
        int _y_1 = Launcher.target.getY();
        Coordinate _coordinate_1 = new Coordinate(_plus_1, _y_1);
        Launcher.dataPosition = _coordinate_1;
        int _x_2 = Launcher.dataPosition.getX();
        int _plus_2 = (_x_2 + 1);
        int _y_2 = Launcher.target.getY();
        Coordinate _coordinate_2 = new Coordinate(_plus_2, _y_2);
        Launcher.initial = _coordinate_2;
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(totalCost));
  }

  public static Coordinate initialize() {
    Coordinate _xblockexpression = null;
    {
      Set<Map.Entry<Coordinate, Node>> _entrySet = Launcher.input.entrySet();
      for (final Map.Entry<Coordinate, Node> e1 : _entrySet) {
        {
          if (((e1.getKey().getY() == 0) && ((Launcher.dataPosition == null) || (e1.getKey().getX() > Launcher.dataPosition.getX())))) {
            Launcher.dataPosition = e1.getKey();
          }
          boolean _isEmpty = e1.getValue().isEmpty();
          if (_isEmpty) {
            Launcher.initial = e1.getKey();
          } else {
            int nb1 = 0;
            Set<Map.Entry<Coordinate, Node>> _entrySet_1 = Launcher.input.entrySet();
            for (final Map.Entry<Coordinate, Node> e2 : _entrySet_1) {
              int _nb1 = nb1;
              int _xifexpression = (int) 0;
              if (((!e1.getKey().equals(e2.getKey())) && e1.getValue().wouldFitIn(e2.getValue()))) {
                _xifexpression = 1;
              } else {
                _xifexpression = 0;
              }
              nb1 = (_nb1 + _xifexpression);
            }
            if ((nb1 == 0)) {
              Launcher.walls.add(e1.getKey());
            } else {
              int _viablePairs = Launcher.viablePairs;
              Launcher.viablePairs = (_viablePairs + nb1);
            }
          }
        }
      }
      int _x = Launcher.dataPosition.getX();
      int _minus = (_x - 1);
      int _y = Launcher.dataPosition.getY();
      Coordinate _coordinate = new Coordinate(_minus, _y);
      _xblockexpression = Launcher.target = _coordinate;
    }
    return _xblockexpression;
  }
}
