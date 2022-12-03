package adventutils.graphic

import java.awt.Color
import java.awt.FlowLayout
import java.awt.Image
import java.awt.image.BufferedImage
import java.awt.image.DataBufferInt
import java.util.List
import javax.swing.ImageIcon
import javax.swing.JFrame
import javax.swing.JLabel

class FramedImage {

	public static int RED = Color.RED.RGB
	public static int BLACK = Color.BLACK.RGB
	public static int WHITE = Color.WHITE.RGB
	public static int GRAY = Color.GRAY.RGB
	public static int GREEN = Color.GREEN.RGB

	JLabel label
	JFrame frame
	BufferedImage image

	new(String frameName, List<List<Integer>> pixels) {
		label = new JLabel

		frame = new JFrame(frameName)
		frame.defaultCloseOperation = JFrame.HIDE_ON_CLOSE
		frame.setLayout(new FlowLayout)
		frame.add(label)
		
		imageFromPixels = pixels
		commit
	}

	def show() {
		frame.visible = true
	}

	def hide() {
		frame.visible = false
	}

	def setImageFromPixels(List<List<Integer>> pixels) {
		val x = pixels.size
		val y = pixels.get(0).size
		image = new BufferedImage(y, x, BufferedImage.TYPE_INT_ARGB)
		val tmp = newIntArrayOfSize(x * y)
		for (i : 0 ..< x)
			for (j : 0 ..< y)
				tmp.set(y * i + j, pixels.get(i).get(j))

		System.arraycopy(tmp, 0, (image.raster.dataBuffer as DataBufferInt).data, 0, x * y)
		frame.setSize(pixels.size + 20, pixels.get(0).size + 50)
	}

	def commit(int ms) {
		Thread.sleep(ms)
		commit()
	}

	def commit() {
		label.icon = new ImageIcon(image)
	}

	def scale(int factor) {
		val newX = image.width * factor
		val newY = image.height * factor
		frame.setSize(newX + 20, newY + 50)
		val tmp = image.getScaledInstance(newX, newY, Image.SCALE_REPLICATE)
		image = new BufferedImage(newX, newY, BufferedImage.TYPE_INT_ARGB)
		val g2d = image.createGraphics;
		g2d.drawImage(tmp, 0, 0, null)
		g2d.dispose
	}
}
