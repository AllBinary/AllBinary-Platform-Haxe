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
package org.allbinary.media;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.time.TimeDelayHelper;

class AllBinaryVisualDebugVibration extends AllBinaryVibrationME implements UpdateMyFontInterface {
    private final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private final timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);
    private final VIBRATING : String = "Vibrating";
    private var myFontProcessor : MyFontProcessor;
    private var anchor : Int = Anchor.TOP_LEFT;
    private var width : Int = 0;
    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.width = font.stringWidth(this.VIBRATING);
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public override function vibrate(duration : Int, type : Int, volume : Int) : Void {
        this.timeDelayHelper.delay = duration;
    }

    public function paint(graphics : Graphics) : Void {
        if (this.timeDelayHelper.isTimeTNT()) {
            this.timeDelayHelper.delay = Integer.MAX_VALUE;
            this.myFontProcessor.process(graphics);
            graphics.drawString(this.VIBRATING, this.displayInfoSingleton.getLastHalfWidth() - (width >> 1), 0, this.anchor);
        }
    }

    public function new() {
        super();
        this.myFontProcessor = new UpdateMyFontProcessor(this);
    }
}

