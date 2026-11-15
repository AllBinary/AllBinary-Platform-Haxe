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
package org.allbinary.platform.opengles;

import javax.microedition.khronos.opengles.GL10;
import javax.microedition.lcdui.Image;
import org.allbinary.string.CommonStrings;

class PlatformTextureBaseFactory {
    public static final NULL_PLATFORM_TEXTURE_BASE_FACTORY : PlatformTextureBaseFactory = new PlatformTextureBaseFactory();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function load(gl : GL10, target : Int, level : Int, image : Image, border : Int, flip : Bool) : Void {
    }

    public function new() {
    }
}

