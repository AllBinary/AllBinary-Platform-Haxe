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
import org.allbinary.media.image.ImageModifierUtil;

class AlphaBaseProcessor {
    private static final instance : AlphaBaseProcessor = new AlphaBaseProcessor();
    public static function getInstance() : AlphaBaseProcessor {
        return AlphaBaseProcessor.instance;
    }

    public function setAlpha(imageModifierUtil : ImageModifierUtil, originalImage : Image, imageToShow : Image, alpha : Int) : Void {
    }

    public function new() {
    }
}

