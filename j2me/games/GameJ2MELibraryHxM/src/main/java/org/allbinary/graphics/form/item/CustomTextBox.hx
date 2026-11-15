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
package org.allbinary.graphics.form.item;

//import javax.microedition.lcdui.CommandListener;
//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.J2MEUtil;
import org.allbinary.game.displayable.canvas.GameCommandCanvas;
import org.allbinary.game.input.Input;
import org.allbinary.game.input.InputFactory;
import org.allbinary.game.input.PlatformKeyFactory;
import org.allbinary.game.input.event.RawKeyEventListener;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.form.item.validation.TextItemVisitor;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;

class CustomTextBox extends GameCommandCanvas implements RawKeyEventListener {
    private final textFieldItem : ABTextFieldItem;
    public function new(cmdListener : CommandListener, label : String, text : String, maxSize : Int, constraints : Int, font : Font, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(cmdListener, label, backgroundBasicColor, foregroundBasicColor);
        final stringUtil : StringUtil = StringUtil.getInstance();
        final textFieldItem : ABTextFieldItem = new ABTextFieldItem(this, new TextItemVisitor(), stringUtil.EMPTY_STRING, stringUtil.EMPTY_STRING, maxSize, 0, stringUtil.EMPTY_STRING, font, backgroundBasicColor, foregroundBasicColor);
        textFieldItem.setString(text);
        this.textFieldItem = textFieldItem;
        this.setTitle(label);
    }

    public function submit() : Void {
    }

    private final inputFactory : InputFactory = InputFactory.getInstance();
    public override function onEventRaw(keyCode : Int, deviceId : Int, repeated : Bool) : Void {
        this.logUtil.putF(new StringMaker().append(this.commonStrings.START).appendint(keyCode).toString(), this, "onEvent");
        this.keyPressedByDevice(keyCode, deviceId);
    }

    public override function keyPressed(keyCode : Int) : Void {
        this.keyPressedByDevice(keyCode, 0);
    }

    public override function keyReleased(keyCode : Int) : Void {
        this.keyReleasedByDevice(keyCode, 0);
    }

    public override function keyRepeated(keyCode : Int) : Void {
        this.keyRepeatedByDevice(keyCode, 0);
    }

    public override function keyPressedByDevice(keyCode : Int, deviceId : Int) : Void {
        try {
            this.logUtil.putF(new StringMaker().append(CommonSeps.getInstance().SPACE).appendint(keyCode).toString(), this, this.gameInputStrings.KEY_PRESSED);
            final platformKeyFactory : PlatformKeyFactory = PlatformKeyFactory.getInstance();
            final input : Input = this.inputFactory.getInstanceById(keyCode);
            if (platformKeyFactory.isSubmission(input)) {
                this.submit();
            } else {
                this.textFieldItem.keyPressed(keyCode);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.gameInputStrings.KEY_PRESSED, e);
        }
    }

    public override function keyReleasedByDevice(keyCode : Int, deviceId : Int) : Void {
    }

    public override function paint(graphics : Graphics) : Void {
        graphics.setColor(this.backgroundColor);
        graphics.fillRect(0, 0, this.displayInfo.getLastWidth(), this.displayInfo.getLastHeight());
        graphics.setColor(this.foregroundColor);
        if (!J2MEUtil.isJ2ME()) {
            graphics.drawString(this.getTitle(), 8, 1, 0);
        }
        this.paintXY(graphics, 8, graphics.getFont().getHeight() + 2);
        super.paint(graphics);
    }

    public function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.textFieldItem.paintXY(graphics, x, y);
    }

    public function getTextFieldItem() : ABTextFieldItem {
        return this.textFieldItem;
    }

}

