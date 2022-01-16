package advent2021.puzzle23;

import java.util.Stack;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Room {
  private Stack<String> content;
  
  private String type;
  
  private int multiplicator;
  
  public Room(final int i) {
    Stack<String> _stack = new Stack<String>();
    this.content = _stack;
    String _switchResult = null;
    switch (i) {
      case 2:
        _switchResult = "A";
        break;
      case 4:
        _switchResult = "B";
        break;
      case 6:
        _switchResult = "C";
        break;
      default:
        _switchResult = "D";
        break;
    }
    this.type = _switchResult;
    this.multiplicator = 1;
  }
  
  public boolean full() {
    int _size = this.content.size();
    return (_size == 2);
  }
  
  public boolean accepts(final String s) {
    return (s.equals(this.type) && (this.content.isEmpty() || ((this.content.size() == 1) && this.content.peek().equals(s))));
  }
  
  public int push(final String s) {
    int _xblockexpression = (int) 0;
    {
      this.content.push(s);
      int _xifexpression = (int) 0;
      int _size = this.content.size();
      boolean _equals = (_size == 2);
      if (_equals) {
        _xifexpression = 1;
      } else {
        _xifexpression = 2;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
  
  public Pair<String, Integer> pop() {
    String _pop = this.content.pop();
    int _plusPlus = this.multiplicator++;
    return new Pair<String, Integer>(_pop, Integer.valueOf(_plusPlus));
  }
}
