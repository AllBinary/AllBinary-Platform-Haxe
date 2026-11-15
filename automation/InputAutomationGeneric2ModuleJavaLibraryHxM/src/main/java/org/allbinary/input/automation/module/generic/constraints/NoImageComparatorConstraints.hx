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
package org.allbinary.input.automation.module.generic.constraints;

//import java.awt.*;
//import java.awt.image.BufferedImage;
import org.allbinary.graphics.GPoint;
import org.allbinary.input.automation.module.ImageComparatorConstraints;

class NoImageComparatorConstraints extends ImageComparatorConstraints {
    public function new() {
        super(1);
        this.setMaxNonMatchingPixelDeltas(Integer.MAX_VALUE);
    }

    public function isColorAllowed(frame : Int, point : GPoint, color : Color) : Bool {
        return true;
    }

    public function isImageValid(bufferedImage : BufferedImage) : Bool {
        return true;
    }

}

