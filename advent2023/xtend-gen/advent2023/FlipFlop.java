package advent2023;

import java.util.List;
import java.util.Optional;

@SuppressWarnings("all")
public class FlipFlop extends advent2023.Module {
  protected boolean on;

  public FlipFlop(final List<String> targets_) {
    super(targets_);
    this.on = false;
  }

  public Optional<Boolean> generateSignal(final String source, final boolean highPulse) {
    Optional<Boolean> _xifexpression = null;
    if ((!highPulse)) {
      Optional<Boolean> _xblockexpression = null;
      {
        this.on = (!this.on);
        _xblockexpression = Optional.<Boolean>of(Boolean.valueOf(this.on));
      }
      _xifexpression = _xblockexpression;
    } else {
      _xifexpression = Optional.<Boolean>empty();
    }
    return _xifexpression;
  }
}
