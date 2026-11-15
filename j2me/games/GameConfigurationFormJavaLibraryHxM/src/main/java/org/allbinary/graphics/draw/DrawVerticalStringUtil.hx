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
package org.allbinary.graphics.draw;

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.AndroidUtil;
import org.allbinary.J2MEUtil;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.opengles.OpenGLFeatureUtil;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class DrawVerticalStringUtil {
    private static final instance : DrawVerticalStringUtil = new DrawVerticalStringUtil();
    public static function getInstance() : DrawVerticalStringUtil {
        return DrawVerticalStringUtil.instance;
    }

    private final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
    private var anchor : Int = Anchor.TOP_LEFT;
    private var charHeight : Int = 0;
    private var offsetY : Int = 0;
    private var offsetXArray : haxe.ds.Vector<Int> = NullUtil.getInstance().NULL_INT_ARRAY;
    public function updateMeasurement(graphics : Graphics, string : String) : Void {
        final openGLFeatureUtil : OpenGLFeatureUtil = OpenGLFeatureUtil.getInstance();
        final font : Font = graphics.getFont();
        this.charHeight = font.getHeight();
        this.offsetY = 0;
        if (J2MEUtil.isHTML()) {
            this.charHeight += 1;
        } else if (openGLFeatureUtil.isAnyThreed()) {
            this.charHeight += 2;
            if (AndroidUtil.isAndroid()) {
            } else {
                this.offsetY = 2 + (Std.int(this.charHeight * 2 / 3));
            }
        }
        final size : Int = string.length;
        var aChar : Int = 0;
        var offsetXArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) 0]);
        {
            var index : Int = size - 1;
            while (index >= 0) {
            aChar = string.charCodeAt(index);
            if (openGLFeatureUtil.isAnyThreed()) {
                offsetXArray[index] = font.charWidth(aChar) / 2;
            }
                index--;
            }
        }
        this.offsetXArray = offsetXArray;
    }

    public function paintVerticle(graphics : Graphics, string : String, x : Int, y : Int, anchor : Int) : Void {
        final size : Int = string.length;
        var aChar : Int = 0;
        {
            var index : Int = size - 1;
            while (index >= 0) {
            aChar = string.charCodeAt(index);
            graphics.drawChar(aChar, x + this.offsetXArray[index], y + (this.charHeight * index) + this.offsetY, anchor);
                index--;
            }
        }
    }

    public function drawCenterString(graphics : Graphics, string : String, offset : Int, length : Int, x : Int, y : Int) : Void {
        final width : Int = (graphics.getFont().substringWidth(string, offset, length) >> 1);
        try {
            graphics.drawSubstring(string, offset, length, x - width, y, this.anchor);
        } catch (e : haxe.Exception) {
            PreLogUtil.put(new StringMaker().append("Exception: stringLength: ").appendint(string.length).append(" offset: ").appendint(offset).append(" currentLength: ").appendint(length).toString(), this, "drawCenterString");
        }
    }

    public function drawCenterStrings(graphics : Graphics, stringArray : haxe.ds.Vector<String>, maxWidth : Int, x : Int, y : Int) : Void {
        var extraLines : Int = 0;
        for (index in 0...stringArray.length) {
            var string : String = stringArray[index];
            if (string != this.EMPTY_STRING) {
                var width : Int = graphics.getFont().stringWidth(string);
                var minTotalLines : Int = 1;
                if (width > maxWidth) {
                    minTotalLines = (Std.int(width / maxWidth)) + 1;
                }
                var linePortion : Int = Std.int(string.length / minTotalLines);
                var offset : Int = 0;
                var currentLength : Int = linePortion;
                var size : Int = string.length;
                while (offset < size) {
                    if (offset + currentLength > size) {
                        currentLength = size - offset;
                    }
                    if (offset + currentLength != size) {
                        while (currentLength > 0 && stringArray[index].charAt(offset + currentLength) != " ".code) {
                            currentLength--;
                        }
                        if (currentLength <= 4) {
                            currentLength = linePortion;
                        }
                    }
                    this.drawCenterString(graphics, string, offset, currentLength, x, y + ((index + extraLines++) * this.charHeight));
                    offset = offset + currentLength;
                    currentLength = linePortion;
                }
                extraLines--;
            }
        }
    }

    public function new() {
    }
}

