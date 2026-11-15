/*
 * 
 * To change this license header, choose License Headers in Project Properties. 
 * To change this template file, choose Tools | Templates 
 * and open the template in the editor.  
 */
// Generated Code Do Not Modify
package org.allbinary.media.image;

//import java.awt.image.BufferedImage;
//import java.io.File;
//import java.io.IOException;
//import java.util.Iterator;
//import javax.imageio.IIOImage;
//import javax.imageio.ImageIO;
//import javax.imageio.ImageWriteParam;
//import javax.imageio.ImageWriter;
//import javax.imageio.stream.ImageOutputStream;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.AbFileOutputStream;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.string.CommonStrings;
import org.apache.batik.ext.awt.image.codec.png.PNGImageWriter;

class ImagePersistanceUtil {
    private static final instance : ImagePersistanceUtil = new ImagePersistanceUtil();
    public static function getInstance() : ImagePersistanceUtil {
        return ImagePersistanceUtil.instance;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    // throws Exception
    public function saveWithBatik(file : AbFile, bufferedImage : BufferedImage) : Void {
        final batikPNGImageWriter : PNGImageWriter = new PNGImageWriter();
        final fileOutputStream : AbFileOutputStream = AbFileOutputStream.createFromAbFile(file);
        try {
            batikPNGImageWriter.writeImage(bufferedImage, fileOutputStream);
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            fileOutputStream.flush();
            StreamUtil.getInstance().close(fileOutputStream);
        }
        this.logUtil.putF("Wrote Image: " + file.getAbsolutePath(), this, this.commonStrings.SAVE);
    }

    public function saveWithImageIO(filePath : String, bufferedImage : BufferedImage) : Void {
        this.saveWithImageIO(new File(filePath), bufferedImage);
    }

    public function saveWithImageIO(file : File, bufferedImage : BufferedImage) : Void {
        var writer : ImageWriter = null;
        var ios : ImageOutputStream = null;
        try {
            final iter : Iterator = ImageIO.getImageWritersByFormatName("jpeg");
            if (!iter.hasNext()) {
                this.logUtil.putF("Unable to save image to jpeg file type.", this, this.commonStrings.SAVE);
                return;
            }
            writer = (cast iter.next() : ImageWriter);
            ios = ImageIO.createImageOutputStream(file);
            writer.setOutput(ios);
            final iwp : ImageWriteParam = writer.getDefaultWriteParam();
            iwp.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
            iwp.setCompressionQuality(0.95);
            writer.write(null, new IIOImage(bufferedImage, null, null), iwp);
            this.logUtil.putF("Wrote Image: " + file.getAbsolutePath(), this, this.commonStrings.SAVE);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.SAVE, e);
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            try {
                if (ios != null) {
                    ios.flush();
                    try {
                        if (ios != null) {
                            this.logUtil.putF(ios.toString(), ios, this.commonStrings.CLOSE);
                            ios.close();
                        }
                    } catch (e : haxe.Exception) {
                        this.logUtil.put(commonStrings.EXCEPTION, ios, commonStrings.CLOSE, e);
                    }
                }
                if (writer != null) {
                    writer.dispose();
                }
            } catch (e2 : IOException) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.SAVE, e2);
            }
        }
    }

    public function new() {
    }
}

