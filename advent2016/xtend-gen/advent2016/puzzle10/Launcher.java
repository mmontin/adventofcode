package advent2016.puzzle10;

import advent2016.Utils;
import java.util.HashMap;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static HashMap<Integer, Bot> bots = CollectionLiterals.<Integer, Bot>newHashMap();
  
  private static HashMap<Integer, Bin> bins = CollectionLiterals.<Integer, Bin>newHashMap();
  
  public static void main(final String[] args) {
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String it) {
        final String[] split = it.split(" ");
        boolean _equals = (split[0]).equals("value");
        if (_equals) {
          Launcher.find_bot(split[5], "bot").addChips(Integer.parseInt(split[1]));
        } else {
          Bin _find_bot = Launcher.find_bot(split[1], "bot");
          ((Bot) _find_bot).putLowHigh(
            Launcher.find_bot(split[6], split[5]), 
            Launcher.find_bot(split[11], split[10]));
        }
      }
    };
    Utils.getInputs(10).forEach(_function);
    Bot current = null;
    while (((current = IterableExtensions.<Bot>findFirst(Launcher.bots.values(), new Function1<Bot, Boolean>() {
      public Boolean apply(final Bot it) {
        return Boolean.valueOf(it.isFull());
      }
    })) != null)) {
      current.giveAll();
    }
    Integer _firstChip = Launcher.bins.get(Integer.valueOf(0)).firstChip();
    Integer _firstChip_1 = Launcher.bins.get(Integer.valueOf(1)).firstChip();
    int _multiply = ((_firstChip).intValue() * (_firstChip_1).intValue());
    Integer _firstChip_2 = Launcher.bins.get(Integer.valueOf(2)).firstChip();
    int _multiply_1 = (_multiply * (_firstChip_2).intValue());
    InputOutput.<Integer>println(Integer.valueOf(_multiply_1));
  }
  
  public static Bin find_bot(final String s, final String type) {
    Bin _xblockexpression = null;
    {
      final int number = Integer.parseInt(s);
      Bin _xifexpression = null;
      boolean _equals = type.equals("bot");
      if (_equals) {
        Bot _xblockexpression_1 = null;
        {
          boolean _containsKey = Launcher.bots.containsKey(Integer.valueOf(number));
          boolean _not = (!_containsKey);
          if (_not) {
            Bot _bot = new Bot(number);
            Launcher.bots.put(Integer.valueOf(number), _bot);
          }
          _xblockexpression_1 = Launcher.bots.get(Integer.valueOf(number));
        }
        _xifexpression = _xblockexpression_1;
      } else {
        Bin _xblockexpression_2 = null;
        {
          boolean _containsKey = Launcher.bins.containsKey(Integer.valueOf(number));
          boolean _not = (!_containsKey);
          if (_not) {
            Bin _bin = new Bin(number);
            Launcher.bins.put(Integer.valueOf(number), _bin);
          }
          _xblockexpression_2 = Launcher.bins.get(Integer.valueOf(number));
        }
        _xifexpression = _xblockexpression_2;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
