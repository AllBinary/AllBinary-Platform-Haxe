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
package org.allbinary.game.paint;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.AppletUtil;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.input.motion.button.TouchScreenFactory;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.time.TimeDelayHelper;

class PressStartMenuPaintable extends Paintable implements UpdateMyFontInterface {
    private final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private final PRESS_START : String = "Press Screen To Start";
    private final KEY_START : String = "Press or Click F2 To Begin";
    private final MENU_START : String = "Press Start From The Menu To Begin";
    private var myFontProcessor : MyFontProcessor;
    private var startString : String = StringUtil.getInstance().EMPTY_STRING;
    private var timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(1100);
    private var flash : Bool = false;
    public function new() {
        super();
        this.myFontProcessor = new UpdateMyFontProcessor(this);
        if (TouchScreenFactory.getInstance().isTouch()) {
            this.startString = this.PRESS_START;
        } else if (AppletUtil.isAppletLoader(this)) {
            this.startString = this.KEY_START;
        } else {
            this.startString = this.MENU_START;
        }
    }

    private var anchor : Int = Anchor.TOP_LEFT;
    private var beginWidth : Int = 0;
    private var line : Int = 0;
    public function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.beginWidth = (graphics.getFont().stringWidth(this.startString) >> 1);
        this.line = (4 * MyFontProcessor.defaultCharWidth(font)) + (font.getHeight() >> 1);
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public override function paint(graphics : Graphics) : Void {
        if (this.timeDelayHelper.isTimeTNT()) {
            if (this.isFlash()) {
                this.setFlash(false);
            } else {
                this.setFlash(true);
            }
        }
        if (this.isFlash()) {
            this.myFontProcessor.process(graphics);
            graphics.drawString(this.startString, displayInfo.getLastHalfWidth() - beginWidth, displayInfo.getLastHeight() - line, this.anchor);
        }
    }

    private function setFlash(flash : Bool) : Void {
        this.flash = flash;
    }

    private function isFlash() : Bool {
        return this.flash;
    }

}

