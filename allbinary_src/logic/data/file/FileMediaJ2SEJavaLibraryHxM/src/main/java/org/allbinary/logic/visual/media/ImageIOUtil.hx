// Generated Code Do Not Modify
package org.allbinary.logic.visual.media;

//import java.awt.image.BufferedImage;
//import java.awt.image.RenderedImage;
//import javax.imageio.ImageIO;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.AbFileNativeUtil;

class ImageIOUtil {
    // throws Exception
    public static function read(file : AbFile) : BufferedImage {
        return ImageIO.read(AbFileNativeUtil.get(file));
    }

    // throws Exception
    public static function write(renderedImage : RenderedImage, name : String, file : AbFile) : Bool {
        return ImageIO.write(renderedImage, name, AbFileNativeUtil.get(file));
    }

    public function new() {
    }
}

