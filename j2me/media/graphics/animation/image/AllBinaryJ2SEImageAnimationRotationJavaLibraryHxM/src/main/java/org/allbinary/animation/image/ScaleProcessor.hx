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
package org.allbinary.animation.image;

import javax.microedition.lcdui.Image;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.image.ImageScaleUtil;
import org.allbinary.string.CommonStrings;

class ScaleProcessor extends ScaleBaseProcessor {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instanceC : ScaleProcessor = new ScaleProcessor();
    public static function getInstance() : ScaleBaseProcessor {
        return ScaleProcessor.instanceC;
    }

    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final imageScaleUtil : ImageScaleUtil = ImageScaleUtil.getInstance();
    public override function update(originalImage : Image, originalImageArray : haxe.ds.Vector<Image>, ximageToShowArray : haxe.ds.Vector<Image>, unused : Int, scaleX : Float, scaleY : Float, maxScaleX : Float, maxScaleY : Float) : Void {
        try {
            this.imageScaleUtil.scale2(originalImage, originalImageArray, ximageToShowArray, unused, scaleX, scaleY, maxScaleX, maxScaleY);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.UPDATE, e);
        }
    }

    public function new() {
        super();
    }
}

