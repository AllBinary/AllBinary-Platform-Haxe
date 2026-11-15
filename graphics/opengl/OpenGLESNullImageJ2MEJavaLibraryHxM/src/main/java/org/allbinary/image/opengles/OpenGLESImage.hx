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

//import javax.microedition.khronos.opengles.GL;
//import javax.microedition.khronos.opengles.GL10;
//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.NullImage;
import org.allbinary.platform.graphics.PlatformBitmapBase;
import org.allbinary.platform.graphics.PlatformBitmapBaseFactory;
import org.allbinary.platform.opengles.PlatformTextureBaseFactory;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

//OpenGLESNullImageJ2MEJavaLibrary
class OpenGLESImage implements OpenGLSurfaceChangedInterface {
    public static final NULL_OPENGL_IMAGE : OpenGLESImage = new OpenGLESImage(NullImage.NULL_IMAGE, PlatformBitmapBaseFactory.NULL_PLATFORM_BITMAP_BASE_FACTORY, PlatformTextureBaseFactory.NULL_PLATFORM_TEXTURE_BASE_FACTORY);
    public static final texture2dList : BasicArrayList = new BasicArrayListD();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final textureFactory : PlatformTextureBaseFactory;
    public final openGLBitmap : PlatformBitmapBase;
    public final openGLESImageProperties : OpenGLESImageProperties = new OpenGLESImageProperties();
    public function new(image : Image, bitmapFactory : PlatformBitmapBaseFactory, textureFactory : PlatformTextureBaseFactory) {
        this.openGLBitmap = bitmapFactory.createBitmap(image);
        this.textureFactory = textureFactory;
    }

    // throws Exception
    public function set(gl : GL) : Void {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    public function initTexture(gl : GL10) : Bool {
        return false;
    }

    public function drawRegion(gl : GL10, viewHeight : Int, x_src : Float, y_src : Float, width : Float, height : Float, x : Int, y : Int, z : Int) : Void {
    }

    public function draw(gl : GL10, x : Int, y : Int, z : Int) : Void {
    }

    public static final TYPE : Int = 4;
    public function getType() : Int {
        return OpenGLESImage.TYPE;
    }

}

