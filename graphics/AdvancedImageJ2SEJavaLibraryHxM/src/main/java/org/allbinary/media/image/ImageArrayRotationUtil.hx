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
//import java.io.IOException;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class ImageArrayRotationUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ImageArrayRotationUtil = new ImageArrayRotationUtil();
    public static function getInstance() : ImageArrayRotationUtil {
        return ImageArrayRotationUtil.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final TOTAL_ANGLE : String = "totalAngle: ";
    // throws IOException
    public function process(imageProcessorInput : ImageProcessorInput, input : String, visitor : ImageProcessedVisitor) : Void {
        var totalAngle : Null<Int> = null;
        if (input == this.commonStrings.UP) {
            totalAngle = Std.string(-90);
        } else if (input == this.commonStrings.DOWN) {
            totalAngle = Std.string(90);
        } else {
            totalAngle = Std.string(input);
        }
        var generatedBufferedImage : BufferedImage = null;
        final bufferedImageArray : haxe.ds.Vector<BufferedImage> = imageProcessorInput.getBufferedImageArray();
        for (index in 0...bufferedImageArray.length) {
            this.logUtil.putF(this.TOTAL_ANGLE + totalAngle, this, this.commonStrings.RUN);
            generatedBufferedImage = ImageJ2SERotationUtil.getInstance().getRotatedImage(bufferedImageArray[index], Std.int(totalAngle));
            visitor.visit(generatedBufferedImage, input, index);
        }
    }

    public function new() {
    }
}

