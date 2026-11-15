/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
 *  
 * By agreeing to this license you and any business entity you represent are 
 * legally bound to the AllBinary Open License Version 1 legal agreement. 
 *  
 * You may obtain the AllBinary Open License Version 1 legal agreement from 
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
 *  
 * Created By: Travis Berthelot 
 *   
 */
// Generated Code Do Not Modify
package org.allbinary.media.image;

//import java.awt.image.BufferedImage;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;

class CanvasExpandUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : CanvasExpandUtil = new CanvasExpandUtil();
    public static function getInstance() : CanvasExpandUtil {
        return CanvasExpandUtil.instance;
    }

    private final stringUtil : StringUtil = StringUtil.getInstance();
    // throws Exception
    public function process(imageProcessorInput : ImageProcessorInput, increaseX : Int, increaseY : Int, visitor : ImageProcessedVisitor) : Void {
        final imageUtil : ImageUtil = ImageUtil.getInstance();
        final bufferedImageArray : haxe.ds.Vector<BufferedImage> = imageProcessorInput.getBufferedImageArray();
        final subBufferedImageArray : haxe.ds.Vector<BufferedImage> = haxe.ds.Vector.fromArrayCopy([for (index in 0...bufferedImageArray.length) null]);
        final size : Int = bufferedImageArray.length;
        var bufferedImage : BufferedImage = null;
        for (index in 0...size) {
            bufferedImage = bufferedImageArray[index];
            subBufferedImageArray[index] = imageUtil.createBufferedImage(bufferedImage, bufferedImage.getWidth() + increaseX, bufferedImage.getHeight() + increaseY, false);
            visitor.visit(subBufferedImageArray[index], this.stringUtil.EMPTY_STRING, index);
        }
    }

    public function new() {
    }
}

