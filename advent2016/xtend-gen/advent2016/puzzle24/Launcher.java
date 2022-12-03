package advent2016.puzzle24;

import adventutils.astar.AStar;
import adventutils.astar.State;
import adventutils.geometry.Coordinate;
import adventutils.graphic.FramedImage;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Launcher {
  public static Set<Coordinate> walls = CollectionLiterals.<Coordinate>newHashSet();
  
  public static Set<Coordinate> objectives = CollectionLiterals.<Coordinate>newHashSet();
  
  public static Coordinate initial;
  
  public static Map<Set<Coordinate>, Integer> distances = CollectionLiterals.<Set<Coordinate>, Integer>newHashMap();
  
  public static Map<Pair<Coordinate, Coordinate>, List<State>> paths = CollectionLiterals.<Pair<Coordinate, Coordinate>, List<State>>newHashMap();
  
  public static List<List<Integer>> map = CollectionLiterals.<List<Integer>>newArrayList();
  
  public static void main(final String[] args) {
    int lineNumber = 0;
    List<String> _inputs = new InputLoader(Integer.valueOf(2016), Integer.valueOf(24)).getInputs();
    for (final String line : _inputs) {
      {
        final ArrayList<Integer> listLine = CollectionLiterals.<Integer>newArrayList();
        Launcher.map.add(listLine);
        int _length = line.length();
        ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _length, true);
        for (final Integer columnNumber : _doubleDotLessThan) {
          try {
            char _charAt = line.charAt((columnNumber).intValue());
            String _plus = (Character.valueOf(_charAt) + "");
            final int v = Integer.parseInt(_plus);
            if ((v == 0)) {
              Coordinate _coordinate = new Coordinate(lineNumber, (columnNumber).intValue());
              Launcher.initial = _coordinate;
            }
            Coordinate _coordinate_1 = new Coordinate(lineNumber, (columnNumber).intValue());
            Launcher.objectives.add(_coordinate_1);
            listLine.add(Integer.valueOf(FramedImage.GREEN));
          } catch (final Throwable _t) {
            if (_t instanceof NumberFormatException) {
              char _charAt_1 = line.charAt((columnNumber).intValue());
              boolean _equals = (Character.valueOf(_charAt_1) + "").equals("#");
              if (_equals) {
                Coordinate _coordinate_2 = new Coordinate(lineNumber, (columnNumber).intValue());
                Launcher.walls.add(_coordinate_2);
                listLine.add(Integer.valueOf(FramedImage.BLACK));
              } else {
                listLine.add(Integer.valueOf(FramedImage.WHITE));
              }
            } else {
              throw Exceptions.sneakyThrow(_t);
            }
          }
        }
        lineNumber++;
      }
    }
    int _size = Launcher.objectives.size();
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
    for (final Integer i : _doubleDotLessThan) {
      {
        final Coordinate source = ((Coordinate[])Conversions.unwrapArray(Launcher.objectives, Coordinate.class))[(i).intValue()];
        int _size_1 = Launcher.objectives.size();
        ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((i).intValue() + 1), _size_1, true);
        for (final Integer j : _doubleDotLessThan_1) {
          {
            final Coordinate target = ((Coordinate[])Conversions.unwrapArray(Launcher.objectives, Coordinate.class))[(j).intValue()];
            CoordinateState _coordinateState = new CoordinateState(source, target);
            final AStar astar = new AStar(_coordinateState).run();
            Launcher.distances.put(CollectionLiterals.<Coordinate>newHashSet(source, target), astar.getMinDistance());
            final List<State> path = astar.minPath();
            Pair<Coordinate, Coordinate> _pair = new Pair<Coordinate, Coordinate>(source, target);
            Launcher.paths.put(_pair, path);
            Pair<Coordinate, Coordinate> _pair_1 = new Pair<Coordinate, Coordinate>(target, source);
            Launcher.paths.put(_pair_1, ListExtensions.<State>reverse(new ArrayList<State>(path)));
          }
        }
      }
    }
    HashSet<Coordinate> _hashSet = new HashSet<Coordinate>(Launcher.objectives);
    OverState _overState = new OverState(Launcher.initial, _hashSet);
    final AStar finalAStar = new AStar(_overState).run();
    InputOutput.<Integer>println(finalAStar.getMinDistance());
  }
}
