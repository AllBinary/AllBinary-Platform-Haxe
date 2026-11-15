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
package org.allbinary.midlet;

import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Displayable;
import javax.microedition.lcdui.NullCanvas;
import javax.microedition.midlet.MIDlet;
import javax.microedition.midlet.MIDletStateChangeException;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.system.Memory;
import org.allbinary.logic.NullUtil;
import org.allbinary.util.ABHashtable;

class AllBinaryMidlet extends MIDlet implements CommandListener {
    private static var NULL_ALLBINARY_MIDLET : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getNullInstance() : AllBinaryMidlet {
        if (AllBinaryMidlet.NULL_ALLBINARY_MIDLET == NullUtil.getInstance().NULL_OBJECT) {
            AllBinaryMidlet.NULL_ALLBINARY_MIDLET = new AllBinaryMidlet();
        }
        return (cast AllBinaryMidlet.NULL_ALLBINARY_MIDLET : AllBinaryMidlet);
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final SET_DISPLAY : String = "setDisplay";
    private final SETTING_ : String = "Setting: ";
    private final _DISPLAY_ : String = " Display: ";
    private final SETTING_NO_TITLE : String = "Setting: No Title, Display: ";
    private var hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    private var midletDestroyed : Bool = false;
    public function new() {
        super();
        this.logUtil.putF(this.commonStrings.CONSTRUCTOR, this, "AllBinaryMidlet::AllBinaryMidlet");
    }

    public function setDisplay(newDisplay : Displayable) : Void {
        var title : String = StringUtil.getInstance().EMPTY_STRING;
        if (newDisplay != NullCanvas.NULL_CANVAS) {
            title = newDisplay.getTitle();
            this.logUtil.putF(Std.string(new StringMaker().append(this.SETTING_).append(title).append(this._DISPLAY_).append(StringUtil.getInstance().toString(newDisplay))), this, this.SET_DISPLAY);
        }
        final display : Display = this.getDisplay();
        display.setCurrent(newDisplay);
    }

    public function getDisplay() : Display {
        return Display.getDisplay(this);
    }

    public function getCurrentDisplayable() : Displayable {
        return Display.getDisplay(this).getCurrent();
    }

    public function setDestroyed(destroyed : Bool) : Void {
        this.midletDestroyed = destroyed;
    }

    public function isDestroyed() : Bool {
        return this.midletDestroyed;
    }

    // throws MIDletStateChangeException
    public override function startApp() : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public override function pauseApp() : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public function destroyAppInRunnable(unconditional : Bool, isProgress : Bool) : Void {
    }

    public override function destroyApp(unconditional : Bool) : Void {
        final METHOD_NAME : String = "AllBinaryMidlet::destroyApp";
        try {
            this.logUtil.putF(this.commonStrings.START, this, METHOD_NAME);
            PreLogUtil.put(Memory.getInfo(), this, METHOD_NAME);
            this.setDestroyed(true);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, METHOD_NAME, e);
        }
    }

    // throws Exception
    public function setStartStateHashtable(hashtable : ABHashtable<Any, Any>) : Void {
        this.logUtil.putF(Std.string(new StringMaker().append(CommonLabels.getInstance().START_LABEL).append(StringUtil.getInstance().toString(hashtable))), this, "setStartStateHashtable");
        this.hashtable = hashtable;
    }

    // throws Exception
    public function getStartStateHashtable() : ABHashtable<Any, Any> {
        this.logUtil.putF(Std.string(new StringMaker().append(CommonLabels.getInstance().START_LABEL).append(StringUtil.getInstance().toString(this.hashtable))), this, "getStartStateHashtable");
        return this.hashtable;
    }

    // throws Exception
    public function getCurrentStateHashtable() : ABHashtable<Any, Any> {
        this.logUtil.putF(this.commonStrings.START, this, "getStateHashtable");
        return StdUtil.getInstance().NULL_TABLE;
    }

    public override function commandAction(command : Command, displayable : Displayable) : Void {
    }

}

