/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
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
package org.allbinary.input.media.image;

import org.allbinary.input.media.image.capture.CapturedImageInputOutput;
import org.allbinary.media.image.comparison.ComparisonImageInputOutput;
import org.allbinary.media.image.comparison.motion.MotionRectanglesImageInputOutput;
import org.allbinary.media.image.io.ImageIOInterface;

class InputImageIOInterfaceFactory {
    public function new() {
    }

    // throws Exception
    public static function getInstance(imageType : InputImageType) : ImageIOInterface {
        if (imageType == InputImageType.CAPTURE) {
            return new CapturedImageInputOutput();
        } else if (imageType == InputImageType.COMPARISON) {
            return new ComparisonImageInputOutput();
        } else if (imageType == InputImageType.MOTION) {
            return new MotionRectanglesImageInputOutput();
        } else {
            throw new haxe.Exception("No ImageIOInterface for: " + imageType.toString());
        }
    }

}

