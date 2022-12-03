package adventutils.graphic;

import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.DataBuffer;
import java.awt.image.DataBufferInt;
import java.util.List;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;

@SuppressWarnings("all")
public class FramedImage {
  public static int RED = Color.RED.getRGB();
  
  public static int BLACK = Color.BLACK.getRGB();
  
  public static int WHITE = Color.WHITE.getRGB();
  
  public static int GRAY = Color.GRAY.getRGB();
  
  public static int GREEN = Color.GREEN.getRGB();
  
  private JLabel label;
  
  private JFrame frame;
  
  private BufferedImage image;
  
  public FramedImage(final String frameName, final List<List<Integer>> pixels) {
    JLabel _jLabel = new JLabel();
    this.label = _jLabel;
    JFrame _jFrame = new JFrame(frameName);
    this.frame = _jFrame;
    this.frame.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
    FlowLayout _flowLayout = new FlowLayout();
    this.frame.setLayout(_flowLayout);
    this.frame.add(this.label);
    this.setImageFromPixels(pixels);
    this.commit();
  }
  
  public void show() {
    this.frame.setVisible(true);
  }
  
  public void hide() {
    this.frame.setVisible(false);
  }
  
  public void setImageFromPixels(final List<List<Integer>> pixels) {
    final int x = pixels.size();
    final int y = pixels.get(0).size();
    BufferedImage _bufferedImage = new BufferedImage(y, x, BufferedImage.TYPE_INT_ARGB);
    this.image = _bufferedImage;
    final int[] tmp = new int[(x * y)];
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, x, true);
    for (final Integer i : _doubleDotLessThan) {
      ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, y, true);
      for (final Integer j : _doubleDotLessThan_1) {
        tmp[((y * (i).intValue()) + (j).intValue())] = (pixels.get((i).intValue()).get((j).intValue())).intValue();
      }
    }
    DataBuffer _dataBuffer = this.image.getRaster().getDataBuffer();
    System.arraycopy(tmp, 0, ((DataBufferInt) _dataBuffer).getData(), 0, (x * y));
    int _size = pixels.size();
    int _plus = (_size + 20);
    int _size_1 = pixels.get(0).size();
    int _plus_1 = (_size_1 + 50);
    this.frame.setSize(_plus, _plus_1);
  }
  
  public void commit(final int ms) {
    try {
      Thread.sleep(ms);
      this.commit();
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public void commit() {
    ImageIcon _imageIcon = new ImageIcon(this.image);
    this.label.setIcon(_imageIcon);
  }
  
  public void scale(final int factor) {
    int _width = this.image.getWidth();
    final int newX = (_width * factor);
    int _height = this.image.getHeight();
    final int newY = (_height * factor);
    this.frame.setSize((newX + 20), (newY + 50));
    final Image tmp = this.image.getScaledInstance(newX, newY, Image.SCALE_REPLICATE);
    BufferedImage _bufferedImage = new BufferedImage(newX, newY, BufferedImage.TYPE_INT_ARGB);
    this.image = _bufferedImage;
    final Graphics2D g2d = this.image.createGraphics();
    g2d.drawImage(tmp, 0, 0, null);
    g2d.dispose();
  }
}
