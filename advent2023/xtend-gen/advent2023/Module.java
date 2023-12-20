package advent2023;

import java.util.List;
import java.util.Optional;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public abstract class Module {
  protected List<String> targets;

  public Module(final List<String> targets_) {
    this.targets = targets_;
  }

  public final List<Pair<Boolean, String>> send(final boolean highPulse) {
    final Function1<String, Pair<Boolean, String>> _function = new Function1<String, Pair<Boolean, String>>() {
      public Pair<Boolean, String> apply(final String it) {
        return Pair.<Boolean, String>of(Boolean.valueOf(highPulse), it);
      }
    };
    return ListExtensions.<String, Pair<Boolean, String>>map(this.targets, _function);
  }

  public abstract Optional<Boolean> generateSignal(final String source, final boolean highPulse);

  public final List<Pair<Boolean, String>> receiveAndSend(final String source, final boolean highPulse) {
    List<Pair<Boolean, String>> _xblockexpression = null;
    {
      final Optional<Boolean> toSend = this.generateSignal(source, highPulse);
      List<Pair<Boolean, String>> _xifexpression = null;
      boolean _isPresent = toSend.isPresent();
      if (_isPresent) {
        final Function1<String, Pair<Boolean, String>> _function = new Function1<String, Pair<Boolean, String>>() {
          public Pair<Boolean, String> apply(final String it) {
            Boolean _get = toSend.get();
            return Pair.<Boolean, String>of(_get, it);
          }
        };
        _xifexpression = ListExtensions.<String, Pair<Boolean, String>>map(this.targets, _function);
      } else {
        _xifexpression = CollectionLiterals.<Pair<Boolean, String>>newArrayList();
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  public String toString() {
    return ("sends to + " + this.targets);
  }
}
