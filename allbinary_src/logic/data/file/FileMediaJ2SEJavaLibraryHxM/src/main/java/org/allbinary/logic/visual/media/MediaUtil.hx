// Generated Code Do Not Modify
package org.allbinary.logic.visual.media;

//import java.awt.image.BufferedImage;
//import java.awt.image.RenderedImage;
//import java.util.HashMap;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory;
import org.allbinary.logic.communication.log.config.type.LogConfigTypes;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.image.ImageUtil;
import org.allbinary.string.CommonLabels;

//import com.sun.imageio.plugins.common.ImageUtil;
class MediaUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : MediaUtil = new MediaUtil();
    public static function getInstance() : MediaUtil {
        return MediaUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function saveImageFile(originalImageFile : AbFile, newImageFileName : String, category : String, mediaData : MediaData, newWidth : Int, newHeight : Int) : Void {
        if (originalImageFile == null || !originalImageFile.isFile()) {
            throw new haxe.Exception("Original Image File Does Not Exist.");
        }
        var bufferedImage : BufferedImage = ImageIOUtil.read(originalImageFile);
        if (bufferedImage == null) {
            throw new haxe.Exception("Unable to find ImageReader for this file.");
        }
        if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().VIEW)) {
            var hashMap : HashMap = this.getImageBufferPropertyHashMap(bufferedImage);
            this.logUtil.putF("Image Properties: " + Std.string(hashMap), this, "saveImageFile()");
        }
        final imageFile : AbFile = AbFile.createAbFile(category + newImageFileName);
        imageFile.createNewFile();
        final imageUtil : ImageUtil = ImageUtil.getInstance();
        var newBufferedImage : BufferedImage = imageUtil.createBufferedImageForSave(bufferedImage, newWidth, newHeight);
        var isWritten : Bool = ImageIOUtil.write((cast newBufferedImage : RenderedImage), mediaData.getName(), imageFile);
        if (!isWritten) {
            throw new haxe.Exception("Unable to write.");
        }
        if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().VIEW)) {
            final commonLabels : CommonLabels = CommonLabels.getInstance();
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Get Path: ");
            stringBuffer.append(originalImageFile.getPath());
            stringBuffer.append("\nNewImageFileName: ");
            stringBuffer.append(newImageFileName);
            stringBuffer.append("\nCategory: ");
            stringBuffer.append(category);
            stringBuffer.append("\nSave File Type: ");
            stringBuffer.append(mediaData.getName());
            stringBuffer.append("\nNew").append(commonLabels.WIDTH_LABEL);
            stringBuffer.appendint(newWidth);
            stringBuffer.append("\nNew").append(commonLabels.HEIGHT_LABEL);
            stringBuffer.appendint(newHeight);
            stringBuffer.append("\nFile Length: ");
            stringBuffer.appendlong(haxe.Int64.ofInt(originalImageFile.length()));
            stringBuffer.append("\nNew File Length: ");
            stringBuffer.appendlong(haxe.Int64.ofInt(imageFile.length()));
            this.logUtil.putF(Std.string(stringBuffer), this, "saveImageFile()");
        }
    }

    private static function getImageBufferPropertyHashMap(bufferedImage : BufferedImage) : HashMap {
        final hashMap : HashMap = StdUtil.getInstance().createHashMap();
        final propertyStringArray : haxe.ds.Vector<String> = bufferedImage.getPropertyNames();
        if (propertyStringArray != null) {
            for (index in 0...propertyStringArray.length) {
                var propertyObject : Any = bufferedImage.getProperty(propertyStringArray[index]);
                hashMap.put(propertyStringArray[index], Std.string(propertyObject));
            }
        }
        return hashMap;
    }

}

