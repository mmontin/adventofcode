package advent2023;

import java.util.List;
import java.util.Optional;

@SuppressWarnings("all")
public class BroadCaster extends advent2023.Module {
  public BroadCaster(final List<String> targets_) {
    super(targets_);
  }

  @Override
  public Optional<Boolean> generateSignal(final String source, final boolean highPulse) {
    return Optional.<Boolean>of(Boolean.valueOf(highPulse));
  }
}
