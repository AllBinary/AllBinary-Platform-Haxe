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

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.graphics.font.FontDebugFactory;
import org.allbinary.logic.string.StringUtil;

class CustomTextAnimation extends TextAnimation implements TextInterface {
    public final fontDebugFactory : FontDebugFactory = FontDebugFactory.getInstance();
    public final fontSize : Int;
    public var font : Font;
    private var lastText : String = StringUtil.getInstance().INIT_STRING;
    public var hasChanged : Bool = true;
    public function new(text : String, fontSize : Int, animationBehavior : AnimationBehavior) {
        super(text, animationBehavior);
        this.fontSize = fontSize;
        this.font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, fontSize);
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.myFontProcessor.process(graphics);
        final existingFont : Font = graphics.getFont();
        this.fontDebugFactory.setFont(this.font, graphics);
        super.paintXYNoUpdate(graphics, x, y);
        this.fontDebugFactory.setFont(existingFont, graphics);
    }

    public override function setScale(scaleX : Float, scaleY : Float) : Void {
        if (scaleX != scaleY) {
            throw new haxe.Exception();
        }
        this.hasChanged = true;
        this.font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, Std.int((this.fontSize * scaleX)));
    }

    public override function setText(text : String) : Void {
        if (this.lastText != text) {
            this.hasChanged = true;
            this.lastText = text;
            super.setText(text);
        }
    }

    public override function getText() : String {
        return this.lastText;
    }

    private var textWidth : Int = 0;
    public override function getWidth() : Int {
        if (this.hasChanged) {
            this.textWidth = this.font.stringWidth(this.textArrayP[0]);
            this.hasChanged = false;
        }
        return this.textWidth;
    }

    public override function getFontHeight() : Int {
        return this.font.getHeight();
    }

}

