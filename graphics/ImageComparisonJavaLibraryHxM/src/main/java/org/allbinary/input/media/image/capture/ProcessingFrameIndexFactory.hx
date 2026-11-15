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


class ProcessingFrameIndexFactory {
    private static var currentFrame : haxe.Int64 = haxe.Int64.ofInt(0);
    public function new() {
    }

    // synchronized
    public static function next() : haxe.Int64 {
        return ProcessingFrameIndexFactory.currentFrame++;
    }

}

