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
package org.allbinary.media.image;

//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.microemu.device.playn.PlaynImage;
import org.microemu.device.ResourceCallbackStrings;
import playn.core.Callback;
import playn.core.Canvas;
import playn.core.CoreImage;
import playn.core.ImageImpl;
import playn.html.HTMLPlaynUtil;

class ImageModifierUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public static function getInstanceOrCreate() : ImageModifierUtil {
        return new ImageModifierUtil();
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final resourceCallbackStrings : ResourceCallbackStrings = ResourceCallbackStrings.getInstance();
    private final playnUtil : HTMLPlaynUtil = HTMLPlaynUtil.getInstance();
    private var alphaArray : haxe.ds.Vector<Bool> = null;
    public function setColor(unusedOriginalImage : Image, image : Image, imageIndex : Int, basicColor : BasicColor) : Void {
    }

    public function changeColor(unusedOriginalImage : Image, image : Image, imageIndex : Int, basicColor : BasicColor) : Void {
    }

    public function setAlpha(originalImage : Image, image : Image, imageIndex : Int, alpha : Int) : Void {
        final alphaF : Float = alpha;
        final alphaFloat : Float = alphaF / 255.0;
        this.setAlphaF(originalImage, image, imageIndex, alphaFloat);
    }

    public function setAlphaF(originalImage : Image, image : Image, imageIndex : Int, alpha : Float) : Void {
        if (this.alphaArray[imageIndex]) {
            this.alphaArray[imageIndex] = false;
            this.setAlpha2(originalImage, image, imageIndex, alpha);
        }
    }

    public function setAlpha2(originalImage : Image, image : Image, imageIndex : Int, alpha : Float) : Void {
        final htmlImage : PlaynImage = (cast image : PlaynImage);
        final canvasImage : ImageImpl = (cast htmlImage.getImage() : ImageImpl);
        final originalPlaynImage : CoreImage = (cast ((cast originalImage : PlaynImage)).getImage() : CoreImage);
        final canvas : Canvas = this.playnUtil.getCanvas(canvasImage);
        canvas.clear();
        canvas.setAlpha(alpha);
        canvas.draw(originalPlaynImage, 0, 0);
    }

    public function setAlpha3(image : Image, alpha : Float) : Void {
        final alphaF : Float = alpha;
        final alphaFloat : Float = alphaF / 255.0;
        final htmlImage : PlaynImage = (cast image : PlaynImage);
        final canvasImage : ImageImpl = (cast htmlImage.getImage() : ImageImpl);
        final canvas : Canvas = this.playnUtil.getCanvas(canvasImage);
        canvas.setAlpha(alphaFloat);
    }

    public function getImageArray(originalImageArray : haxe.ds.Vector<Image>) : haxe.ds.Vector<Image> {
        final size : Int = originalImageArray.length;
        this.alphaArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) false]);
        final imageArray : haxe.ds.Vector<Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        for (index in 0...size) {
            imageArray[index] = originalImageArray[index];
            this.handleImage(imageArray, index, originalImageArray[index]);
        }
        return imageArray;
    }

    public function handleImage(imageArray : haxe.ds.Vector<Image>, index : Int, image : Image) : Void {
        final image3 : CoreImage = (cast ((cast image : PlaynImage)).getImage() : CoreImage);
        if (image3 != null) {
            if (image3.isReady() || image3.width() + image3.height() <= 0 || image.getName() == this.resourceCallbackStrings.FROM_DATA) {
                this.copy(imageArray, index, image, image3);
            } else {
                final callback : Callback = /* anonymous class body:
                    public function onSuccess(resource : Any) : Void {
                        final logUtil : LogUtil = LogUtil.getInstance();
                        logUtil.putF(resourceCallbackStrings.DONE + image.getName(), this, resourceCallbackStrings.HANDLE_IMAGE);
                        copy(imageArray, index, image, image3);
                    }

                    public function onFailure(e : haxe.Exception) : Void {
                        final logUtil : LogUtil = LogUtil.getInstance();
                        logUtil.put(new StringMaker().append(commonStrings.EXCEPTION_LABEL).append(resourceCallbackStrings.ERROR).append(image.getName()).toString(), this, resourceCallbackStrings.HANDLE_IMAGE, e);
                    }

*/ new Callback();
                image3.addCallback(callback);
            }
        } else {
            this.logUtil.putF(this.resourceCallbackStrings.NULL + image.isMutable(), this, this.resourceCallbackStrings.HANDLE_IMAGE);
        }
    }

    public function copy(imageArray : haxe.ds.Vector<Image>, index : Int, image : Image, image3 : CoreImage) : Void {
        try {
            final image2 : Image = Image.createImageWH(Std.int(image3.width()), Std.int(image3.height()));
            final graphics : Graphics = image2.getGraphics();
            graphics.drawImage(image, 0, 0, Anchor.TOP_LEFT);
            imageArray[index] = image2;
        } catch (e : haxe.Exception) {
            this.logUtil.putF(this.commonStrings.EXCEPTION_LABEL + resourceCallbackStrings.DONE, this, resourceCallbackStrings.HANDLE_IMAGE);
        }
    }

    public function reset() : Void {
        final size : Int = this.alphaArray.length;
        for (index in 0...size) {
            this.alphaArray[index] = true;
        }
    }

    public function new() {
    }
}

