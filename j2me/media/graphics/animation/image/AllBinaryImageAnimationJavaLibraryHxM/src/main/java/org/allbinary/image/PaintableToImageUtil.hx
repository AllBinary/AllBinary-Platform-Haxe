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
package org.allbinary.image;

import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;
import org.allbinary.graphics.paint.PaintableInterface;

class PaintableToImageUtil {
    private static final instance : PaintableToImageUtil = new PaintableToImageUtil();
    // throws Exception
    public static function getImage(paintableInterface : PaintableInterface, width : Int, height : Int) : Image {
        var image : Image = GameFeatureImageCacheFactory.getInstance().get(Type.getClassName(Type.getClass(PaintableToImageUtil.instance)), width, height);
        var graphics : Graphics = image.getGraphics();
        paintableInterface.paint(graphics);
        return image;
    }

    public function new() {
    }
}

