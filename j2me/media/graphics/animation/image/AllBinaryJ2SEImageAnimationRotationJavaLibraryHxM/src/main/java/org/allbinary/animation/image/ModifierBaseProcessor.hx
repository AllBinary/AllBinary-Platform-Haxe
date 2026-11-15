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
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.media.image.ImageModifierUtil;

class ModifierBaseProcessor {
    private static final instance : ModifierBaseProcessor = new ModifierBaseProcessor();
    public static function getInstance() : ModifierBaseProcessor {
        return ModifierBaseProcessor.instance;
    }

    public function updateColor(imageModifierUtil : ImageModifierUtil, originalImage : Image, imageToShow : Image, index : Int, basicColor : BasicColor) : Void {
    }

    public function updateAlpha(imageModifierUtil : ImageModifierUtil, originalImage : Image, imageToShow : Image, index : Int, alpha : Int) : Void {
    }

    public function new() {
    }
}

