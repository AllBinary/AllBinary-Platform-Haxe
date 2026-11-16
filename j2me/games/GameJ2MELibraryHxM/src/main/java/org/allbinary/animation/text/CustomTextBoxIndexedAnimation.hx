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
package org.allbinary.animation.text;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.game.input.event.RawKeyEventListener;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.form.item.CustomTextBox;
import org.allbinary.logic.string.StringUtil;

class CustomTextBoxIndexedAnimation extends IndexedAnimation implements RawKeyEventListener implements UpdateMyFontInterface implements TextInterface {
    private final customTextBox : CustomTextBox;
    private var lastText : String = StringUtil.getInstance().INIT_STRING;
    public var hasChanged : Bool = true;
    private var textChangeListener : TextChangeListener = TextChangeListener.getInstance();
    public function new(customTextBox : CustomTextBox) {
        super(AnimationBehavior.getInstance());
        this.customTextBox = customTextBox;
    }

    public override function setBasicColorP(basicColor : BasicColor) : Void {
        this.customTextBox.getTextFieldItem().setForegroundBasicColorP(basicColor);
    }

    public override function setBackgroundBasicColorP(basicColor : BasicColor) : Void {
        this.customTextBox.getTextFieldItem().setBackgroundBasicColorP(basicColor);
    }

    public function setTextWithOnMeasure(text : String, textChangeListener : TextChangeListener) : Void {
        this.setText(text);
        this.textChangeListener = textChangeListener;
    }

    public function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.textChangeListener.onMeasure();
        this.textChangeListener = TextChangeListener.getInstance();
    }

    public function setText(text : String) : Void {
        if (this.lastText != text) {
            this.hasChanged = true;
            this.lastText = text;
            this.customTextBox.getTextFieldItem().setString(text);
        }
    }

    public function getText() : String {
        return this.customTextBox.getTextFieldItem().getString();
    }

    public function onEventRaw(keyCode : Int, deviceId : Int, repeated : Bool) : Void {
        this.customTextBox.onEventRaw(keyCode, deviceId, repeated);
    }

    public function getFontHeight() : Int {
        return this.customTextBox.getTextFieldItem().getFontHeight();
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.customTextBox.paintXY(graphics, x, y);
    }

    public override function paintThreedXYZ(graphics : Graphics, x : Int, y : Int, z : Int) : Void {
    }

    public override function getWidth() : Int {
        return super.getWidth();
    }

}

