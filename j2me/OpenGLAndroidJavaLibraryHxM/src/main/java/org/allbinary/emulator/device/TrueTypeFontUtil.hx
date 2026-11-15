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

//import java.io.File;
//import java.io.FileOutputStream;
//import javax.microedition.khronos.opengles.GL10;
//import javax.microedition.lcdui.Image;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.image.PreResourceImageUtil;
import org.allbinary.image.opengles.OpenGLESImage;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.string.CommonStrings;
import org.microemu.android.device.AndroidImageInterface;
import org.microemu.android.device.AndroidImmutableImage;

//TTF
class TrueTypeFontUtil extends TrueTypeFontUtilBase {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : TrueTypeFontUtil = new TrueTypeFontUtil();
    public static function getInstance() : TrueTypeFontUtil {
        return TrueTypeFontUtil.instance;
    }

    public final preResourceImageUtil : PreResourceImageUtil = PreResourceImageUtil.getInstance();
    private final realFontSize : Int = 18;
    public var fontImage : OpenGLESImage = OpenGLESImage.NULL_OPENGL_IMAGE;
    public function new() {
        super(1);
    }

    public function saveFontAtlasAsFile() : Void {
        try {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            final file : File = ResourceUtil.getInstance().getContext().getFilesDir();
            final path : String = file.getAbsolutePath() + CanvasStrings.getInstance().FONT_ATLAS;
            this.logUtil.putF(path, this, commonStrings.CONSTRUCTOR);
            final fos : FileOutputStream = new FileOutputStream(path);
            final bitmap : Bitmap = ((cast this.fontImage.openGLBitmap.getImage() : AndroidImageInterface)).getBitmap();
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, fos);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            PreLogUtil.putOE(commonStrings.EXCEPTION, this, commonStrings.EXCEPTION, e);
        }
    }

    public function getFontBitmapGL(gl : GL10, filename : String, cellSize : Int, basicColor : BasicColor) : Image {
        if (this.fontImage == OpenGLESImage.NULL_OPENGL_IMAGE) {
            final cellsPerRow2 : Int = this.CELLS_PER_ROW * 2;
            final cellsPerRow3 : Int = this.CELLS_PER_ROW * 3;
            final cellsPerRow4 : Int = this.CELLS_PER_ROW * 4;
            final cellsPerRow5 : Int = this.CELLS_PER_ROW * 5;
            final cellsPerRow6 : Int = this.CELLS_PER_ROW * 6;
            final cellsPerRow7 : Int = this.CELLS_PER_ROW * 7;
            final typeface : Typeface = Typeface.DEFAULT;
            final textureSize : Int = this.getAsTextureSize(this.CELLS_PER_ROW * cellSize);
            final bitmap : Bitmap = Bitmap.createBitmap(textureSize, textureSize, Bitmap.Config.ARGB_8888);
            final canvas : Canvas = new Canvas(bitmap);
            final paint : Paint = new Paint();
            paint.setTypeface(typeface);
            paint.setTextSize(this.realFontSize);
            paint.setAlpha(Std.int(basicColor.alpha));
            paint.setColor(Std.int(basicColor));
            var biggestHeight : Int = 0;
            final bounds : Rect = new Rect();
            var x : Int = 0;
            var y : Int = 0;
            for (index in 0...this.size) {
                this.characterArray[0] = this.pattern.charAt(index);
                paint.getTextBounds(this.characterArray, 0, 1, bounds);
                this._characterWidth[index] = bounds.right;
                if (bounds.bottom - bounds.top > biggestHeight) {
                    biggestHeight = bounds.bottom - bounds.top;
                }
                x = (index % this.CELLS_PER_ROW) * cellSize;
                x += (cellSize >> 1);
                x -= (this._characterWidth[index] >> 1);
                y = 0;
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
                canvas.drawText(this.characterArray, 0, 1, x - 3.0, y - 6.0, paint);
            }
            canvas.save();
            final image : Image = AndroidImmutableImage.create(bitmap);
            this.fontImage = (cast this.preResourceImageUtil.encapsulate(image) : OpenGLESImage);
            return this.fontImage;
        } else {
            return this.fontImage;
        }
    }

    public function getFontWidths(filename : String, fontSize : Int) : haxe.ds.Vector<Int> {
        final typeface : Typeface = Typeface.DEFAULT;
        final paint : Paint = new Paint();
        paint.setTypeface(typeface);
        paint.setTextSize(fontSize);
        paint.setARGB(255, 255, 255, 255);
        final bounds : Rect = new Rect();
        for (index in 0...this.size) {
            this.characterArray[0] = this.pattern.charAt(index);
            paint.getTextBounds(this.characterArray, 0, 1, bounds);
            if (index < this.lastCapIndex) {
                if (this.characterArray[0] == "1".code) {
                    this._characterWidth[index] = bounds.right + 3;
                } else if (this.characterArray[0] == "J".code || this.characterArray[0] == "V".code || this.characterArray[0] == "2".code || this.characterArray[0] == "9".code || this.characterArray[0] == "I".code || this.characterArray[0] == "N".code || this.characterArray[0] == "U".code) {
                    this._characterWidth[index] = bounds.right + 1;
                } else if (this.characterArray[0] == "4".code || this.characterArray[0] == "C".code || this.characterArray[0] == "E".code || this.characterArray[0] == "O".code) {
                    this._characterWidth[index] = bounds.right - 2;
                } else if (this.characterArray[0] == "B".code || this.characterArray[0] == "D".code || this.characterArray[0] == "G".code || this.characterArray[0] == "H".code || this.characterArray[0] == "T".code || this.characterArray[0] == "W".code) {
                    this._characterWidth[index] = bounds.right - 3;
                } else if (this.characterArray[0] == "A".code || this.characterArray[0] == "Q".code || this.characterArray[0] == "R".code) {
                    this._characterWidth[index] = bounds.right - 5;
                } else if (this.characterArray[0] == "M".code) {
                    this._characterWidth[index] = bounds.right - 6;
                } else if (this.characterArray[0] == "m".code) {
                    this._characterWidth[index] = bounds.right - 8;
                } else {
                    this._characterWidth[index] = bounds.right;
                }
            } else {
                if (this.characterArray[0] == " ".code) {
                    this._characterWidth[index] = bounds.right + 10;
                } else if (this.characterArray[0] == "l".code || this.characterArray[0] == "i".code || this.characterArray[0] == "j".code || this.characterArray[0] == ".".code || this.characterArray[0] == "!".code || this.characterArray[0] == "|".code) {
                    this._characterWidth[index] = bounds.right + 6;
                } else if (this.characterArray[0] == "f".code || this.characterArray[0] == "t".code || this.characterArray[0] == "u".code || this.characterArray[0] == "v".code) {
                    this._characterWidth[index] = bounds.right + 1;
                } else if (this.characterArray[0] == "r".code) {
                    this._characterWidth[index] = bounds.right + 2;
                } else if (this.characterArray[0] == "a".code || this.characterArray[0] == "b".code || this.characterArray[0] == "g".code || this.characterArray[0] == "u".code) {
                    this._characterWidth[index] = bounds.right - 1;
                } else if (this.characterArray[0] == "o".code || this.characterArray[0] == "e".code) {
                    this._characterWidth[index] = bounds.right - 2;
                } else if (this.characterArray[0] == "m".code) {
                    this._characterWidth[index] = bounds.right - 7;
                } else {
                    this._characterWidth[index] = bounds.right;
                }
            }
        }
        this._characterWidth[0] = (fontSize >> 1) - 2;
        return this._characterWidth;
    }

}

