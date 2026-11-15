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

//import java.nio.ByteBuffer;
//import java.nio.ByteOrder;
//import java.nio.FloatBuffer;
//import javax.microedition.khronos.opengles.GL;
//import javax.microedition.khronos.opengles.GL10;
//import javax.microedition.lcdui.Image;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.opengles.OpenGLLogUtil;
import org.allbinary.opengles.GLUtil;
import org.allbinary.platform.graphics.PlatformBitmapBaseFactory;
import org.allbinary.platform.opengles.PlatformTextureBaseFactory;

class OpenGLESGL10Image extends OpenGLESImage {
    private final textureVertexFloatBuffer : FloatBuffer = ByteBuffer.allocateDirect(4 * 4 * 2).order(ByteOrder.nativeOrder()).asFloatBuffer();
    private final realOpenGLESImageDraw : OpenGLESImageDraw = /* anonymous class body:
        private final glUtil : GLUtil = GLUtil.getInstance();
        private final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        private final textureVertexFloatBuffer : FloatBuffer = this.textureVertexFloatBuffer;
        private final regionTextureRectangleFloatArray : haxe.ds.Vector<Float> = haxe.ds.Vector.fromArrayCopy([for (index in 0...8) 0.0]);
        private final regionTextureVertexFloatBuffer : FloatBuffer = ByteBuffer.allocateDirect(4 * 4 * 2).order(ByteOrder.nativeOrder()).asFloatBuffer();
        private final regionRectangleFloatArray : haxe.ds.Vector<Float> = haxe.ds.Vector.fromArrayCopy([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);
        public final regionRectangleVertexFloatBuffer : FloatBuffer = ByteBuffer.allocateDirect(4 * 4 * 3).order(ByteOrder.nativeOrder()).asFloatBuffer();
        public final openGLESImageProperties : OpenGLESImageProperties = this.openGLESImageProperties;
        public function drawRegion(gl : GL10, viewHeight : Int, x_src : Float, y_src : Float, width : Float, height : Float, x : Int, y : Int, z : Int) : Void {
            final imageWidth : Int = this.getWidth();
            final imageHeight : Int = this.getHeight();
            this.regionRectangleFloatArray[7] = viewHeight;
            this.regionRectangleFloatArray[1] = this.regionRectangleFloatArray[7] - height;
            this.regionRectangleFloatArray[3] = width;
            this.regionRectangleFloatArray[4] = this.regionRectangleFloatArray[1];
            this.regionRectangleFloatArray[9] = this.regionRectangleFloatArray[3];
            this.regionRectangleFloatArray[10] = this.regionRectangleFloatArray[7];
            this.regionTextureRectangleFloatArray[0] = x_src / imageWidth;
            this.regionTextureRectangleFloatArray[1] = ((y_src + height)) / imageHeight;
            this.regionTextureRectangleFloatArray[2] = ((x_src + width)) / imageWidth;
            this.regionTextureRectangleFloatArray[3] = this.regionTextureRectangleFloatArray[1];
            this.regionTextureRectangleFloatArray[4] = this.regionTextureRectangleFloatArray[0];
            this.regionTextureRectangleFloatArray[5] = y_src / imageHeight;
            this.regionTextureRectangleFloatArray[6] = this.regionTextureRectangleFloatArray[2];
            this.regionTextureRectangleFloatArray[7] = this.regionTextureRectangleFloatArray[5];
            final u_center : Float = (this.regionTextureRectangleFloatArray[0] + this.regionTextureRectangleFloatArray[2]) / 2.0;
            final v_center : Float = (this.regionTextureRectangleFloatArray[5] + this.regionTextureRectangleFloatArray[1]) / 2.0;
            this.glUtil.rotateUVs(this.regionTextureRectangleFloatArray, -this.openGLESImageProperties.angle, u_center, v_center);
            gl.glPushMatrix();
            final imageProcessor : OpenGLESImageProcessor = this.imageProcessor;
            this.openGLESImageTranslate.translate(gl, this, x, -y);
            imageProcessor.scale(gl, this.openGLESImageProperties.scaleX, this.openGLESImageProperties.scaleY);
            imageProcessor.colorMask(gl, this.openGLESImageProperties.redf, this.openGLESImageProperties.greenf, this.openGLESImageProperties.bluef, this.openGLESImageProperties.alphaf);
            this.openGLESImageTranslate.translate2(gl, this);
            this.regionRectangleVertexFloatBuffer.put(this.regionRectangleFloatArray);
            this.glUtil.position(this.regionRectangleVertexFloatBuffer, 0);
            gl.glVertexPointer(3, GL10.GL_FLOAT, 0, this.regionRectangleVertexFloatBuffer);
            gl.glEnableClientState(GL10.GL_VERTEX_ARRAY);
            gl.glEnable(GL10.GL_TEXTURE_2D);
            gl.glBindTexture(GL10.GL_TEXTURE_2D, this.openGLESImageProperties.textureID);
            gl.glEnableClientState(GL10.GL_TEXTURE_COORD_ARRAY);
            this.regionTextureVertexFloatBuffer.put(this.regionTextureRectangleFloatArray);
            this.glUtil.position(this.regionTextureVertexFloatBuffer, 0);
            gl.glTexCoordPointer(2, GL10.GL_FLOAT, 0, this.regionTextureVertexFloatBuffer);
            gl.glDrawArrays(GL10.GL_TRIANGLE_STRIP, 0, 4);
            gl.glDisableClientState(GL10.GL_VERTEX_ARRAY);
            gl.glDisableClientState(GL10.GL_TEXTURE_COORD_ARRAY);
            gl.glDisable(GL10.GL_TEXTURE_2D);
            gl.glPopMatrix();
        }

        public function draw(gl : GL10, x : Int, y : Int, z : Int) : Void {
            final width : Int = this.getWidth();
            final height : Int = this.getHeight();
            this.regionRectangleFloatArray[7] = this.displayInfoSingleton.getLastHeight();
            this.regionRectangleFloatArray[1] = this.regionRectangleFloatArray[7] - height;
            this.regionRectangleFloatArray[3] = width;
            this.regionRectangleFloatArray[4] = this.regionRectangleFloatArray[1];
            this.regionRectangleFloatArray[9] = this.regionRectangleFloatArray[3];
            this.regionRectangleFloatArray[10] = this.regionRectangleFloatArray[7];
            this.regionTextureRectangleFloatArray[0] = 0;
            this.regionTextureRectangleFloatArray[1] = 1;
            this.regionTextureRectangleFloatArray[2] = 1;
            this.regionTextureRectangleFloatArray[3] = 1;
            this.regionTextureRectangleFloatArray[4] = 0;
            this.regionTextureRectangleFloatArray[5] = 0;
            this.regionTextureRectangleFloatArray[6] = 1;
            this.regionTextureRectangleFloatArray[7] = 0;
            gl.glPushMatrix();
            this.openGLESImageTranslate.translate(gl, this, x, -y);
            final imageProcessor : OpenGLESImageProcessor = this.imageProcessor;
            imageProcessor.scale(gl, this.openGLESImageProperties.scaleX, this.openGLESImageProperties.scaleY);
            imageProcessor.colorMask(gl, this.openGLESImageProperties.redf, this.openGLESImageProperties.greenf, this.openGLESImageProperties.bluef, this.openGLESImageProperties.alphaf);
            this.openGLESImageTranslate.translate2(gl, this);
            this.regionRectangleVertexFloatBuffer.put(this.regionRectangleFloatArray);
            this.glUtil.position(this.regionRectangleVertexFloatBuffer, 0);
            gl.glVertexPointer(3, GL10.GL_FLOAT, 0, this.regionRectangleVertexFloatBuffer);
            gl.glEnableClientState(GL10.GL_VERTEX_ARRAY);
            gl.glEnable(GL10.GL_TEXTURE_2D);
            gl.glBindTexture(GL10.GL_TEXTURE_2D, this.openGLESImageProperties.textureID);
            gl.glEnableClientState(GL10.GL_TEXTURE_COORD_ARRAY);
            this.glUtil.rotateUVs(this.regionTextureRectangleFloatArray, -this.openGLESImageProperties.angle, 0.5, 0.5);
            this.glUtil.position(this.textureVertexFloatBuffer, 0);
            this.textureVertexFloatBuffer.put(this.regionTextureRectangleFloatArray);
            this.glUtil.position(this.textureVertexFloatBuffer, 0);
            gl.glTexCoordPointer(2, GL10.GL_FLOAT, 0, this.textureVertexFloatBuffer);
            gl.glDrawArrays(GL10.GL_TRIANGLE_STRIP, 0, 4);
            gl.glDisableClientState(GL10.GL_VERTEX_ARRAY);
            gl.glDisableClientState(GL10.GL_TEXTURE_COORD_ARRAY);
            gl.glDisable(GL10.GL_TEXTURE_2D);
            gl.glPopMatrix();
        }

*/ new OpenGLESImageDraw();
    private var openGLESImageDraw : OpenGLESImageDraw = OpenGLESImageDraw.getInstance();
    public function new(image : Image, bitmapFactory : PlatformBitmapBaseFactory, textureFactory : PlatformTextureBaseFactory) {
        super(image, bitmapFactory, textureFactory);
        this.initVertices();
    }

    public function initVertices() : Void {
        this.textureVertexFloatBuffer.put(0);
        this.textureVertexFloatBuffer.put(1);
        this.textureVertexFloatBuffer.put(1);
        this.textureVertexFloatBuffer.put(1);
        this.textureVertexFloatBuffer.put(0);
        this.textureVertexFloatBuffer.put(0);
        this.textureVertexFloatBuffer.put(1);
        this.textureVertexFloatBuffer.put(0);
        this.textureVertexFloatBuffer.rewind();
    }

    public function set(gl : GL) : Void {
        final gl10 : GL10 = (cast gl : GL10);
        if (super.initTexture(gl10)) {
            this.textureFactory.load(gl10, GL10.GL_TEXTURE_2D, 0, this, 0, true);
            gl10.glDisable(GL10.GL_TEXTURE_2D);
            this.openGLESImageDraw = this.realOpenGLESImageDraw;
            OpenGLLogUtil.getInstance().logError(gl10, this);
        }
    }

    public function drawRegion(gl : GL10, viewHeight : Int, x_src : Float, y_src : Float, width : Float, height : Float, x : Int, y : Int, z : Int) : Void {
        this.openGLESImageDraw.drawRegion(gl, viewHeight, x_src, y_src, width, height, x, y, z);
    }

    public function draw(gl : GL10, x : Int, y : Int, z : Int) : Void {
        this.openGLESImageDraw.draw(gl, x, y, z);
    }

}

