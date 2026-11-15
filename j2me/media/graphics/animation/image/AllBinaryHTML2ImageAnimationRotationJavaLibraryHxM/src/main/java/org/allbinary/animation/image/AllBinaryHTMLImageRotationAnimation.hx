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
package org.allbinary.animation.image;

//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.math.AngleInfo;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.media.image.ImageCopyUtil;
import org.allbinary.media.image.ImageModifierUtil;
import org.allbinary.media.image.ImageRotationUtil;
import org.microemu.device.playn.PlaynMutableImage;
import playn.core.Canvas;
import playn.core.ImageImpl;
import playn.core.PlayN;
import playn.html.HtmlGraphics;
import playn.html.HtmlImage;

class AllBinaryHTMLImageRotationAnimation extends ImageBaseRotationAnimation {
    private final imageRotationUtil : ImageRotationUtil = ImageRotationUtil.getInstance();
    private final imageModifierUtil : ImageModifierUtil = ImageModifierUtil.getInstanceOrCreate();
    private final originalImage : Image;
    private final twoImages : haxe.ds.Vector<Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
    private final canvasSurfaceArray : haxe.ds.Vector<Canvas> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
    private var imageToShow : Image;
    private var bufferedImageIndex : Int = 0;
    private var alphaProcessor : AlphaBaseProcessor = AlphaBaseProcessor.getInstance();
    public function new(originalImage : Image, image : Image, angleInfo : AngleInfo, totalAngle : Int, animationBehavior : AnimationBehavior) {
        super(image, angleInfo, totalAngle, animationBehavior);
        this.originalImage = originalImage;
        this.imageToShow = image;
        this.twoImages[0] = image;
        this.twoImages[1] = ImageCopyUtil.getInstance().createImage(image);
        this.canvasSurfaceArray[0] = this.getCanvasSurface(this.twoImages[0]);
        this.canvasSurfaceArray[1] = this.getCanvasSurface(this.twoImages[1]);
    }

    public function getCanvasSurface(image : Image) : Canvas {
        final htmlImage : PlaynMutableImage = (cast image : PlaynMutableImage);
        final canvasImage : ImageImpl = (cast htmlImage.getImage() : ImageImpl);
        final playN : PlayN = PlayN.getInstance();
        final canvas : Canvas = ((cast playN.graphics() : HtmlGraphics)).get((cast canvasImage : HtmlImage));
        canvas.translate(this.originalImage.getWidth() / 2, this.originalImage.getHeight() / 2);
        return canvas;
    }

    public function setBasicColorP(basicColor : BasicColor) : Void {
        var changed : Bool = false;
        if (this.getBasicColorP() == null || Std.int(this.getBasicColorP()) != Std.int(basicColor)) {
            changed = true;
        }
        super.setBasicColorP(basicColor);
        if (changed) {
            this.updateImage();
        }
    }

    public function setAlpha(alpha : Int) : Void {
        var changed : Bool = false;
        if (this.alphaP != alpha) {
            changed = true;
        }
        super.setAlpha(alpha);
        if (changed) {
            this.alphaProcessor = AlphaProcessor.getInstance();
            this.updateImage();
        }
    }

    public function nextRotation() : Void {
        super.nextRotation();
        this.updateImage();
    }

    public function previousRotation() : Void {
        super.previousRotation();
        this.updateImage();
    }

    private function updateImage() : Void {
        final canvasSurface : Canvas = this.canvasSurfaceArray[this.bufferedImageIndex];
        canvasSurface.save();
        this.imageRotationUtil.rotateImageCanvasSurfaceClear(this.originalImage, this.twoImages[this.bufferedImageIndex], canvasSurface, this.angleInfo.getAngle() + 90);
        this.alphaProcessor.setAlpha(this.imageModifierUtil, this.originalImage, this.twoImages[this.bufferedImageIndex], this.alphaP);
        this.imageRotationUtil.drawImage(this.originalImage, imageToShow, canvasSurface);
        canvasSurface.restore();
        this.swap();
    }

    public function setFrame(index : Int) : Void {
        super.setFrame(index);
        this.updateImage();
    }

    public function swap() : Void {
        this.imageToShow = this.twoImages[this.bufferedImageIndex];
        if (this.bufferedImageIndex == 0) {
            this.bufferedImageIndex = 1;
        } else {
            this.bufferedImageIndex = 0;
        }
    }

    public function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        graphics.drawImage(this.imageToShow, x, y, this.anchor);
    }

}

