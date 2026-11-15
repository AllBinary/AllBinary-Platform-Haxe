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
//import javax.microedition.lcdui.OpenGLESPostLoadPlatformImage;
//import javax.microedition.lcdui.PostLoadImageProcessor;
import org.allbinary.graphics.GraphicsStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.platform.graphics.PlatformBitmapBase;
import org.allbinary.platform.graphics.PlatformBitmapBaseFactory;
import org.allbinary.platform.opengles.PlatformTextureBaseFactory;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

//OpenGLESSWTJOGLImageJavaLibrary
class OpenGLESImage extends Image implements OpenGLSurfaceChangedInterface {
    public static final NULL_OPENGL_IMAGE : OpenGLESImage = new OpenGLESImage(NullImage.NULL_IMAGE, PlatformBitmapBaseFactory.NULL_PLATFORM_BITMAP_BASE_FACTORY, PlatformTextureBaseFactory.NULL_PLATFORM_TEXTURE_BASE_FACTORY);
    public final logUtil : LogUtil = LogUtil.getInstance();
    public static final texture2dList : BasicArrayList = new BasicArrayListD();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final textureFactory : PlatformTextureBaseFactory;
    public final openGLBitmap : PlatformBitmapBase;
    public var imageProcessor : OpenGLESImageProcessor = OpenGLESImageProcessor.getInstance();
    public var openGLESImageTranslate : OpenGLESImageTranslate = OpenGLESImageTranslate.getInstance();
    public final openGLESImageProperties : OpenGLESImageProperties = new OpenGLESImageProperties();
    public function new(image : Image, bitmapFactory : PlatformBitmapBaseFactory, textureFactory : PlatformTextureBaseFactory) {
        super(image.getName(), PostLoadImageProcessor.NULL_POST_LOAD_IMAGE_PROCESSOR);
        this.openGLBitmap = bitmapFactory.createBitmap(image);
        this.textureFactory = textureFactory;
        OpenGLImageCacheFactory.getInstance().init(this);
        this.platformImage = OpenGLESPostLoadPlatformImage.getInstance();
    }

    public function getHeight() : Int {
        return Std.int((this.openGLBitmap.getHeight() * this.openGLESImageProperties.scaleY2));
    }

    public function getWidth() : Int {
        return Std.int((this.openGLBitmap.getWidth() * this.openGLESImageProperties.scaleX2));
    }

    // throws Exception
    public function set(gl : GL) : Void {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    public function initTexture(gl : GL10) : Bool {
        if (!OpenGLESImage.texture2dList.contains(this)) {
            OpenGLESImage.texture2dList.add(this);
            final textures : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) 0]);
            gl.glEnable(GL10.GL_TEXTURE_2D);
            if (this.openGLESImageProperties.textureID != -1) {
                textures[0] = this.openGLESImageProperties.textureID;
                gl.glDeleteTextures(1, textures, 0);
            }
            gl.glGenTextures(1, textures, 0);
            this.openGLESImageProperties.textureID = textures[0];
            gl.glBindTexture(GL10.GL_TEXTURE_2D, this.openGLESImageProperties.textureID);
            gl.glTexParameterf(GL10.GL_TEXTURE_2D, GL10.GL_TEXTURE_MIN_FILTER, GL10.GL_NEAREST);
            gl.glTexParameterf(GL10.GL_TEXTURE_2D, GL10.GL_TEXTURE_WRAP_S, GL10.GL_CLAMP_TO_EDGE);
            gl.glTexParameterf(GL10.GL_TEXTURE_2D, GL10.GL_TEXTURE_WRAP_T, GL10.GL_CLAMP_TO_EDGE);
            return true;
        }
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

    public function toString() : String {
        final graphicsStrings : GraphicsStrings = GraphicsStrings.getInstance();
        return new StringMaker().append(this.getName()).append(super.toString()).append(graphicsStrings.OPACITY).appendfloat(this.openGLESImageProperties.alphaf).toString();
    }

}

