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
package org.allbinary.platform.graphics;

//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.NullImage;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;

class PlatformBitmapBase {
    public static final NULL_PLATFORM_BITMAP_BASE : PlatformBitmapBase = new PlatformBitmapBase();
    public var alpha : Int = 255;
    public var basicColor : BasicColor = BasicColorFactory.getInstance().NULL_COLOR;
    public function getWidth() : Int {
        return 0;
    }

    public function getHeight() : Int {
        return 0;
    }

    public function getImage() : Image {
        return NullImage.NULL_IMAGE;
    }

    public function new() {
    }
}

