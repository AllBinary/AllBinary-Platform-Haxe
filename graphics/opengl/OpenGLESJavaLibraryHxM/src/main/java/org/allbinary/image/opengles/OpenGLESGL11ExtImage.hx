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
//import javax.microedition.khronos.opengles.GL11;
//import javax.microedition.khronos.opengles.GL11Ext;
//import javax.microedition.lcdui.Image;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.displayable.event.DisplayChangeEvent;
import org.allbinary.graphics.opengles.OpenGLLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.platform.graphics.PlatformBitmapBaseFactory;
import org.allbinary.platform.opengles.PlatformTextureBaseFactory;

//Many devices don't support this even though it is supposed to
class OpenGLESGL11ExtImage extends OpenGLESImage {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var a : Int = 0;
    private final rectangle : haxe.ds.Vector<Int>;
    public function new(image : Image, bitmapFactory : PlatformBitmapBaseFactory, textureFactory : PlatformTextureBaseFactory) {
        super(image, bitmapFactory, textureFactory);
        this.onDisplayChangeEvent(null);
        this.rectangle = haxe.ds.Vector.fromArrayCopy([0, this.getHeight(), this.getWidth(), -this.getHeight()]);
    }

    public function onDisplayChangeEvent(displayChangeEvent : DisplayChangeEvent) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "onResize");
            this.a = DisplayInfoSingleton.getInstance().getLastHeight() - this.getHeight();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onResize", e);
        }
    }

    public override function set(gl : GL) : Void {
        this.onDisplayChangeEvent(null);
        final gl11 : GL11 = (cast gl : GL11);
        if (super.initTexture(gl11)) {
            this.textureFactory.load(gl11, GL10.GL_TEXTURE_2D, 0, this, 0, true);
            gl11.glTexParameteriv(GL10.GL_TEXTURE_2D, GL11Ext.GL_TEXTURE_CROP_RECT_OES, this.rectangle, 0);
            gl11.glDisable(GL10.GL_TEXTURE_2D);
            OpenGLLogUtil.getInstance().logError(gl11, this);
        }
    }

    public function draw(gl : GL10, x : Int, y : Int, z : Int) : Void {
        gl.glEnable(GL10.GL_TEXTURE_2D);
        gl.glBindTexture(GL10.GL_TEXTURE_2D, this.openGLESImageProperties.textureID);
        ((cast gl : GL11Ext)).glDrawTexfOES(x, this.a - y, z, this.getWidth(), this.getHeight());
        gl.glDisable(GL10.GL_TEXTURE_2D);
    }

}

