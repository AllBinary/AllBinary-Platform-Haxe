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
package org.allbinary.image.opengles;

//import javax.microedition.lcdui.Image;
import org.allbinary.platform.graphics.PlatformBitmapBaseFactory;
import org.allbinary.platform.opengles.PlatformTextureBaseFactory;

class OpenGLESGL11ExtImageFactory extends OpenGLImageFactory {
    public override function getInstance(image : Image, bitmapFactory : PlatformBitmapBaseFactory, textureFactory : PlatformTextureBaseFactory) : Image {
        return new OpenGLESGL11ExtImage(image, bitmapFactory, textureFactory);
    }

    public function new() {
        super();
    }
}

