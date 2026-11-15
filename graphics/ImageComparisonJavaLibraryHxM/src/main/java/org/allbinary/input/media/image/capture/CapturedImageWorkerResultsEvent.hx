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
package org.allbinary.input.media.image.capture;

//import java.awt.image.BufferedImage;
import org.allbinary.logic.util.event.AllBinaryEventObject;

class CapturedImageWorkerResultsEvent extends AllBinaryEventObject {
    private final frame : Null<haxe.Int64>;
    private var bufferedImage : BufferedImage = null;
    public function new(anyType : Any, frame : Null<haxe.Int64>, bufferedImage : BufferedImage) {
        super(anyType);
        this.frame = frame;
        this.setBufferedImage(bufferedImage);
    }

    public function getBufferedImage() : BufferedImage {
        return this.bufferedImage;
    }

    private function setBufferedImage(bufferedImage : BufferedImage) : Void {
        this.bufferedImage = bufferedImage;
    }

    public function getFrame() : Null<haxe.Int64> {
        return this.frame;
    }

}

