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
package org.allbinary.animation.text;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.threed.SWTJOGLProcessor;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class TextAnimation extends IndexedAnimation implements UpdateMyFontInterface {
    private final updateMyFontProcessor : MyFontProcessor;
    public var myFontProcessor : MyFontProcessor;
    public var textArrayP : haxe.ds.Vector<String> = StringUtil.getInstance().ONE_EMPTY_STRING_ARRAY;
    private var anchor : Int = Anchor.TOP_LEFT;
    private var fontHeight : Int = 0;
    private var offsetY : Int = 0;
    private var textChangeListener : TextChangeListener = TextChangeListener.getInstance();
    public function new(text : String, animationBehavior : AnimationBehavior) {
        super(animationBehavior);
        this.updateMyFontProcessor = new UpdateMyFontProcessor(this);
        this.myFontProcessor = this.updateMyFontProcessor;
        this.setText(text);
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.fontHeight = font.getHeight();
        final adjustedFontHeight : Int = Std.int(-(this.fontHeight * 2.00));
        this.offsetY = (SWTJOGLProcessor.getInstance().isJOGL() ? adjustedFontHeight : 0);
        this.textChangeListener.onMeasure();
        this.textChangeListener = TextChangeListener.getInstance();
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    // throws Exception
    public override function nextFrame() : Void {
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.myFontProcessor.process(graphics);
        this.paintXYNoUpdate(graphics, x, y);
    }

    public function paintXYNoUpdate(graphics : Graphics, x : Int, y : Int) : Void {
        this.basicSetColorUtil.setBasicColorP3(graphics, this.getBasicColorP(), this.getColor());
        final size : Int = this.textArrayP.length;
        for (index in 0...size) {
            graphics.drawString(this.textArrayP[index], x, y + this.offsetY + (index * this.fontHeight), this.anchor);
        }
    }

    public function setTextWithOnMeasure(text : String, textChangeListener : TextChangeListener) : Void {
        this.setText(text);
        this.textChangeListener = textChangeListener;
    }

    public function setText(text : String) : Void {
        final list : BasicArrayList = new BasicArrayListD();
        if (text.length > 0) {
            var index : Int = 0;
            var startIndex : Int = 0;
            var endIndex : Int = 0;
            while (index >= 0) {
                startIndex = index;
                index = text.indexOf(String.fromCharCode("\n".code), startIndex);
                endIndex = index;
                if (index < 0) {
                    endIndex = text.length;
                }
                list.add(text.substring(startIndex, endIndex));
                if (index < 0) {
                    break;
                }
                index++;
            }
        }
        if (list.size() > 0) {
            final textArray : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy([for (index in 0...list.size()) null]);
            final size : Int = list.size();
            for (index in 0...size) {
                textArray[index] = (cast list.get(index) : String);
            }
            this.textArrayP = textArray;
        } else {
            this.textArrayP = StringUtil.getInstance().ONE_EMPTY_STRING_ARRAY;
        }
        this.myFontProcessor = this.updateMyFontProcessor;
    }

    public function getTextArray() : haxe.ds.Vector<String> {
        return this.textArrayP;
    }

    public function getFontHeight() : Int {
        return this.fontHeight;
    }

}

