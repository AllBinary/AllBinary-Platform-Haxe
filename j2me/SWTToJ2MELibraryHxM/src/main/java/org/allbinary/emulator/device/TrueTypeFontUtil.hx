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
package org.allbinary.emulator.device;

//import javax.microedition.khronos.opengles.GL10;
//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.ImageData;
import org.eclipse.swt.graphics.ImageLoader;
import org.microemu.device.swt.SwtMutableImage;
import org.allbinary.AvianUtil;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.graphics.opengles.OpenGLCapabilities;
import org.allbinary.image.PreResourceImageUtil;
import org.allbinary.image.opengles.OpenGLESImage;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

//TTF
class TrueTypeFontUtil extends TrueTypeFontUtilBase {
    private static final instance : TrueTypeFontUtil = new TrueTypeFontUtil();
    public static function getInstance() : TrueTypeFontUtil {
        return TrueTypeFontUtil.instance;
    }

    private final preResourceImageUtil : PreResourceImageUtil = PreResourceImageUtil.getInstance();
    private final widthFloatArray : haxe.ds.Vector<Float> = null;
    public var fontImage : OpenGLESImage = OpenGLESImage.NULL_OPENGL_IMAGE;
    private final widthScale : Float;
    public function new() {
        super(2);
        if (AvianUtil.isAvian()) {
            this.widthFloatArray = haxe.ds.Vector.fromArrayCopy([1504.0, 967.0, 527.0, 961.0, 957.0, 1087.0, 920.0, 954.0, 973.0, 961.0, 955.0, 1296.0, 1013.0, 1106.0, 1167.0, 815.0, 815.0, 1216.0, 1110.0, 170.0, 520.0, 1056.0, 815.0, 1448.0, 1142.0, 1345.0, 927.0, 1345.0, 1030.0, 920.0, 1096.0, 1119.0, 1219.0, 1841.0, 1166.0, 1147.0, 1005.0, 879.0, 965.0, 792.0, 964.0, 927.0, 753.0, 1034.0, 916.0, 196.0, 469.0, 877.0, 166.0, 1563.0, 916.0, 1007.0, 965.0, 964.0, 631.0, 777.0, 649.0, 917.0, 1026.0, 1548.0, 993.0, 1028.0, 795.0, 241.0, 798.0, 241.0, 905.0, 1477.0, 393.0, 961.0, 961.0, 961.0, 961.0, 555.0, 1029.0, 1010.0, 1378.0, 952.0, 952.0, 952.0, 952.0, 463.0, 463.0, 926.0, 961.0, 491.0, 930.0, 457.0, 457.0, 644.0, 643.0, 326.0, 186.0, 1219.0, 241.0, 1599.0, 961.0, 302.0, 711.0, 961.0, 961.0, 710.0, 141.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0]);
        } else {
            this.widthFloatArray = haxe.ds.Vector.fromArrayCopy([1504.0, 967.0, 527.0, 961.0, 957.0, 1087.0, 920.0, 954.0, 973.0, 961.0, 955.0, 1296.0, 1013.0, 1106.0, 1167.0, 815.0, 815.0, 1216.0, 1110.0, 170.0, 520.0, 1056.0, 815.0, 1448.0, 1142.0, 1345.0, 927.0, 1345.0, 1030.0, 920.0, 1096.0, 1119.0, 1219.0, 1841.0, 1166.0, 1147.0, 1005.0, 879.0, 965.0, 792.0, 964.0, 927.0, 753.0, 1034.0, 916.0, 196.0, 469.0, 877.0, 166.0, 1563.0, 916.0, 1007.0, 965.0, 964.0, 631.0, 777.0, 649.0, 917.0, 1026.0, 1548.0, 993.0, 1028.0, 795.0, 241.0, 798.0, 241.0, 905.0, 1477.0, 393.0, 961.0, 555.0, 1029.0, 1010.0, 1378.0, 952.0, 463.0, 463.0, 926.0, 961.0, 491.0, 930.0, 457.0, 457.0, 644.0, 643.0, 326.0, 186.0, 1219.0, 241.0, 1599.0, 961.0, 302.0, 711.0, 961.0, 961.0, 710.0, 141.0, 1504.0, 1504.0]);
        }
        this.widthScale = ((this.scale == 2) ? 1.2 : 1.0);
    }

    public function getFontBitmapGL(gl : GL10, filename : String, cellSize : Int, basicColor : BasicColor) : Image {
        try {
            if (this.fontImage == OpenGLESImage.NULL_OPENGL_IMAGE) {
                final canvasStrings : CanvasStrings = CanvasStrings.getInstance();
                final openGLCapabilities : OpenGLCapabilities = OpenGLCapabilities.getInstance();
                if (openGLCapabilities.isTextureSizeValid(1024) && this.scale == 2) {
                    final FONT_ATLAS_1024 : String = "/font_1024.png";
                    final image : Image = Image.createImage(ResourceUtil.getInstance().getResourceAsStream(FONT_ATLAS_1024));
                    image.setName(canvasStrings.FONT_ATLAS);
                    this.fontImage = (cast this.preResourceImageUtil.encapsulate(image) : OpenGLESImage);
                } else if (openGLCapabilities.isTextureSizeValid(512)) {
                    final FONT_ATLAS_512 : String = "/font_512.png";
                    final image : Image = Image.createImage(ResourceUtil.getInstance().getResourceAsStream(FONT_ATLAS_512));
                    image.setName(canvasStrings.FONT_ATLAS);
                    this.fontImage = (cast this.preResourceImageUtil.encapsulate(image) : OpenGLESImage);
                } else {
                    final FONT_ATLAS_512 : String = "/font_512.png";
                    final image : Image = Image.createImage(ResourceUtil.getInstance().getResourceAsStream(FONT_ATLAS_512));
                    image.setName(canvasStrings.FONT_ATLAS);
                    this.fontImage = (cast this.preResourceImageUtil.encapsulate(image) : OpenGLESImage);
                }
                return this.fontImage;
            } else {
                return this.fontImage;
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            PreLogUtil.putOE(commonStrings.EXCEPTION, this, commonStrings.EXCEPTION, e);
            throw new haxe.Exception();
        }
    }

    public function saveFontAtlasAsFile() : Void {
        final image : Image = this.getFontBitmap(null, cellSize, BasicColorFactory.getInstance().WHITE);
        final imageLoader : ImageLoader = new ImageLoader();
        final imageData : ImageData = ((cast image : SwtMutableImage)).image.getImageData();
        imageData.transparentPixel = imageData.getPixel(0, 0);
        imageLoader.data = haxe.ds.Vector.fromArrayCopy([imageData]);
        imageLoader.save(CommonSeps.getInstance().PERIOD + CanvasStrings.getInstance().FONT_ATLAS, SWT.IMAGE_PNG);
    }

    public function getFontBitmap(filename : String, cellSize : Int, basicColor : BasicColor) : Image {
        final cellsPerRow2 : Int = this.CELLS_PER_ROW * 2;
        final cellsPerRow3 : Int = this.CELLS_PER_ROW * 3;
        final cellsPerRow4 : Int = this.CELLS_PER_ROW * 4;
        final cellsPerRow5 : Int = this.CELLS_PER_ROW * 5;
        final cellsPerRow6 : Int = this.CELLS_PER_ROW * 6;
        final cellsPerRow7 : Int = this.CELLS_PER_ROW * 7;
        final image : Image = Image.createImage(textureSize, textureSize);
        final graphics : Graphics = image.getGraphics();
        graphics.setColor(Std.int(basicColor));
        var biggestHeight : Int = 0;
        final bounds : Rectangle = new Rectangle(PointFactory.getInstance().createXY(0, 0), cellSize, cellSize);
        var x : Int = 0;
        var y : Int = 0;
        for (index in 0...size) {
            this.characterArray[0] = pattern.charAt(index);
            _characterWidth[index] = bounds.getMaxX();
            if (bounds.getMaxY() - bounds.getPoint().getX() > biggestHeight) {
                biggestHeight = bounds.getMaxY() - bounds.getPoint().getX();
            }
            x = (index % this.CELLS_PER_ROW) * cellSize;
            x += (cellSize >> 1);
            x -= (_characterWidth[index] >> 1);
            y = -(cellSize >> 1);
            if (index >= this.CELLS_PER_ROW) {
                y += cellSize;
            }
            if (index >= cellsPerRow2) {
                y += cellSize;
            }
            if (index >= cellsPerRow3) {
                y += cellSize;
            }
            if (index >= cellsPerRow4) {
                y += cellSize;
            }
            if (index >= cellsPerRow5) {
                y += cellSize;
            }
            if (index >= cellsPerRow6) {
                y += cellSize;
            }
            if (index >= cellsPerRow7) {
                y += cellSize;
            }
            y += cellSize;
            y -= (cellSize >> 2);
            graphics.drawChar(this.characterArray[0], x, y, 0);
        }
        return image;
    }

    public function getFontWidths(filename : String, fontSize : Int) : haxe.ds.Vector<Int> {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        for (index in 0...size) {
            this.characterArray[0] = pattern.charAt(index);
            if (this.characterArray[0] == " ".code) {
                _characterWidth[index] = (Std.int(fontSize / 4));
            } else {
                final shortPatternIndex : Int = this.shortPattern.indexOf(this.characterArray[0]);
                final w : Int = Std.int((this.widthFloatArray[shortPatternIndex] / 75.0)) + 19;
                _characterWidth[index] = w;
                if (this.characterArray[0] == ".".code || this.characterArray[0] == "1".code) {
                    _characterWidth[index] += 4;
                }
                if (this.characterArray[0] >= "a".code && this.characterArray[0] < "k".code) {
                    _characterWidth[index] -= 2;
                }
                if (this.characterArray[0] >= "k".code && this.characterArray[0] < "v".code) {
                    _characterWidth[index] -= 4;
                }
                if (this.characterArray[0] >= "v".code && this.characterArray[0] < "z".code) {
                    _characterWidth[index] -= 8;
                }
                if (this.characterArray[0] == "D".code) {
                    _characterWidth[index] -= 4;
                }
                if (this.characterArray[0] >= "A".code && this.characterArray[0] <= "Z".code) {
                    _characterWidth[index] -= 2;
                }
            }
            _characterWidth[index] *= this.widthScale;
        }
        return _characterWidth;
    }

}

