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
package org.allbinary.media.image;

import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.Canvas;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.graphics.GC;
import org.eclipse.swt.graphics.ImageData;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.eclipse.swt.events.PaintEvent;
import org.eclipse.swt.events.PaintListener;
import org.eclipse.swt.graphics.Transform;
import org.eclipse.swt.widgets.Display;
import org.microemu.app.BareMain;

class ImageUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ImageUtil = new ImageUtil();
    public static function getInstance() : ImageUtil {
        return ImageUtil.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    private var IIOIMAGE_POOL_NAME : String = "IIOIMAGE_POOL_NAME";
    private final CREATE_BUFFERED_IMAGE : String = "createBufferedImage";
    public function new() {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
        }
    }

    public function create(width : Int, height : Int) : org.eclipse.swt.graphics.Image {
        final display : Display = BareMain.shell.getDisplay();
        return new org.eclipse.swt.graphics.Image(display, width, height);
    }

    // throws Exception
    public function createBufferedImage(bufferedImageArray : haxe.ds.Vector<org.eclipse.swt.graphics.Image>, percent : Int, scale : Bool) : haxe.ds.Vector<org.eclipse.swt.graphics.Image> {
        final size : Int = bufferedImageArray.length;
        final scaledBufferedImageArray : haxe.ds.Vector<org.eclipse.swt.graphics.Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        var bufferedImage : org.eclipse.swt.graphics.Image = null;
        var imageData : ImageData = null;
        for (index in 0...size) {
            bufferedImage = bufferedImageArray[index];
            imageData = bufferedImage.getImageData();
            final newWidth : Int = Std.int((imageData.width * percent / 100));
            final newHeight : Int = Std.int((imageData.height * percent / 100));
            scaledBufferedImageArray[index] = this.createBufferedImage5(bufferedImage, newWidth, newHeight, scale);
        }
        return scaledBufferedImageArray;
    }

    // throws Exception
    public function createBufferedImage2(bufferedImageArray : haxe.ds.Vector<org.eclipse.swt.graphics.Image>, percent : Float, scale : Bool) : haxe.ds.Vector<org.eclipse.swt.graphics.Image> {
        final size : Int = bufferedImageArray.length;
        final scaledBufferedImageArray : haxe.ds.Vector<org.eclipse.swt.graphics.Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        var bufferedImage : org.eclipse.swt.graphics.Image = null;
        var imageData : ImageData = null;
        for (index in 0...size) {
            bufferedImage = bufferedImageArray[index];
            imageData = bufferedImage.getImageData();
            final newWidth : Int = Std.int((imageData.width * percent));
            final newHeight : Int = Std.int((imageData.height * percent));
            scaledBufferedImageArray[index] = this.createBufferedImage5(bufferedImage, newWidth, newHeight, scale);
        }
        return scaledBufferedImageArray;
    }

    // throws Exception
    public function createBufferedImage3(bufferedImageArray : haxe.ds.Vector<org.eclipse.swt.graphics.Image>, width : Int, height : Int, scale : Bool) : haxe.ds.Vector<org.eclipse.swt.graphics.Image> {
        final size : Int = bufferedImageArray.length;
        final scaledBufferedImageArray : haxe.ds.Vector<org.eclipse.swt.graphics.Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        for (index in 0...size) {
            scaledBufferedImageArray[index] = this.createBufferedImage5(bufferedImageArray[index], width, height, scale);
        }
        return scaledBufferedImageArray;
    }

    // throws Exception
    public function createBufferedImage4(bufferedImage : org.eclipse.swt.graphics.Image, newWidth : Int, newHeight : Int) : org.eclipse.swt.graphics.Image {
        return this.createBufferedImage5(bufferedImage, newWidth, newHeight, true);
    }

    // throws Exception
    public function createBufferedImage5(bufferedImage : org.eclipse.swt.graphics.Image, newWidth : Int, newHeight : Int, scale : Bool) : org.eclipse.swt.graphics.Image {
        return this.createBufferedImage6(bufferedImage, newWidth, newHeight, scale, false);
    }

    // throws Exception
    public function createBufferedImage6(bufferedImage : org.eclipse.swt.graphics.Image, newWidth : Int, newHeight : Int, scale : Bool, allowTranslate : Bool) : org.eclipse.swt.graphics.Image {
        final imageData : ImageData = bufferedImage.getImageData();
        final width : Float = imageData.width;
        final height : Float = imageData.height;
        final d_newWidth : Float = newWidth;
        final d_newHeight : Float = newHeight;
        final widthRatio : Float = d_newWidth / width;
        final heightRatio : Float = d_newHeight / height;
        var ratioX : Float = 1.0;
        var ratioY : Float = 1.0;
        if (scale) {
            ratioX = widthRatio;
            ratioY = heightRatio;
        }
        this.logUtil.putF(new StringMaker().appendfloat(width).append(this.commonSeps.FORWARD_SLASH).appendfloat(height).append(this.commonSeps.COLON).appendint(newWidth).append(this.commonSeps.FORWARD_SLASH).appendint(newHeight).append(this.commonSeps.COLON).appendfloat(widthRatio).append(this.commonSeps.FORWARD_SLASH).appendfloat(heightRatio).toString(), this, this.CREATE_BUFFERED_IMAGE);
        var dx : Float = 0.0;
        var dy : Float = 0.0;
        if (!scale && allowTranslate) {
            dx = (newWidth - width) / 2.0;
            dy = (newHeight - height) / 2.0;
            this.logUtil.putF(new StringMaker().append("Translate dx: ").appendfloat(dx).append(" dy: ").appendfloat(dy).toString(), this, this.CREATE_BUFFERED_IMAGE);
        }
        final newBufferedImage : org.eclipse.swt.graphics.Image = new org.eclipse.swt.graphics.Image(BareMain.shell.getDisplay(), newWidth, newHeight);
        final gc : GC = new GC(newBufferedImage);
        final affineTransform : Transform = new Transform(gc.getDevice());
        affineTransform.scale(ratioX, ratioY);
        affineTransform.translate(dx, dy);
        gc.setTransform(affineTransform);
        gc.setAntialias(SWT.ON);
        gc.setInterpolation(SWT.HIGH);
        gc.drawImage(bufferedImage, 0, 0, bufferedImage.getBounds().width, bufferedImage.getBounds().height, 0, 0, newWidth, newHeight);
        gc.dispose();
        return newBufferedImage;
    }

    public function drawTransformedImage(image : org.eclipse.swt.graphics.Image, parent : Composite, dx : Int, dy : Int, width : Int, height : Int) : Canvas {
        final imageCanvas : Canvas = new Canvas(parent, SWT.NONE);
        imageCanvas.addPaintListener(/* anonymous class body:
            public function paintControl(event : PaintEvent) : Void {
                final gc : GC = event.gc;
                final affineTransform : Transform = new Transform(gc.getDevice());
                affineTransform.translate(dx, dy);
                gc.setAntialias(SWT.ON);
                gc.setInterpolation(SWT.HIGH);
                gc.drawImage(image, 0, 0, image.getBounds().width, image.getBounds().height, 0, 0, width, height);
            }

*/ new PaintListener());
        return imageCanvas;
    }

    public function toString(bufferedImage : org.eclipse.swt.graphics.Image) : String {
        final commonLabels : CommonLabels = CommonLabels.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        final imageData : ImageData = bufferedImage.getImageData();
        stringBuffer.append(" org.eclipse.swt.graphics.Image: ");
        stringBuffer.append(commonLabels.WIDTH_LABEL);
        stringBuffer.appendint(Std.int(imageData.width));
        stringBuffer.append(commonLabels.HEIGHT_LABEL);
        stringBuffer.appendint(Std.int(imageData.height));
        stringBuffer.append(" Type: ");
        stringBuffer.appendint(Std.int(imageData.type));
        return stringBuffer.toString();
    }

}

