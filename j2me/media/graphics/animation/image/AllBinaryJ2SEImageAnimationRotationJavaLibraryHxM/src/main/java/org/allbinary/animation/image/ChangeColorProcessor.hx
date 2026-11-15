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

//import javax.microedition.lcdui.Image;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.media.image.ImageModifierUtil;

class ChangeColorProcessor extends ModifierBaseProcessor {
    private static final instanceC : ChangeColorProcessor = new ChangeColorProcessor();
    public static function getInstance() : ChangeColorProcessor {
        return ChangeColorProcessor.instanceC;
    }

    public override function updateColor(imageModifierUtil : ImageModifierUtil, originalImage : Image, imageToShow : Image, index : Int, basicColor : BasicColor) : Void {
        imageModifierUtil.changeColor(originalImage, imageToShow, index, basicColor);
    }

    public function new() {
        super();
    }
}

