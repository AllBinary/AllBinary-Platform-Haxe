// Generated Code Do Not Modify
package org.allbinary.logic.visual.media;

//import javax.imageio.ImageIO;

class MediaIOUtil {
    private static final instance : MediaIOUtil = new MediaIOUtil();
    public static function getInstance() : MediaIOUtil {
        return MediaIOUtil.instance;
    }

    public function getReaderFormatNames() : haxe.ds.Vector<String> {
        return ImageIO.getReaderFormatNames();
    }

    public function getWriterFormatNames() : haxe.ds.Vector<String> {
        return ImageIO.getWriterFormatNames();
    }

    public function new() {
    }
}

