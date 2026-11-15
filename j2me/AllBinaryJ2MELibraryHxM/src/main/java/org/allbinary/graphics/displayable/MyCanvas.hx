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
package org.allbinary.graphics.displayable;

//import javax.microedition.lcdui.Canvas;
//import javax.microedition.lcdui.Command;
//import javax.microedition.lcdui.CommandListener;
//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.NullCommandListener;
import org.allbinary.graphics.displayable.command.MyCommandInterface;
import org.allbinary.graphics.displayable.command.MyCommandsFactory;
import org.allbinary.input.TouchJ2ME;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.media.audio.Sound;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABStack;

class MyCanvas extends Canvas implements DisplayableInterface implements MyCommandInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final canvasStrings : CanvasStrings = CanvasStrings.getInstance();
    public final stringUtil : StringUtil = StringUtil.getInstance();
    public final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private final name : String;
    private final childNameList : BasicArrayList;
    private final commandStack : ABStack<Any>;
    private var commandListener : CommandListener = NullCommandListener.NULL_COMMAND_LISTENER;
    private var paused : Bool = false;
    public function new(name : String, childNameList : BasicArrayList) {
        super();
        this.logUtil.putF(this.commonStrings.CONSTRUCTOR, this, this.commonStrings.CONSTRUCTOR);
        this.displayInfo.update(this, this.canvasStrings.CONSTRUCTOR);
        this.name = name;
        this.childNameList = childNameList;
        this.commandStack = StdUtil.getInstance().createStack();
    }

    public override function setFullScreenMode(mode : Bool) : Void {
        super.setFullScreenMode(mode);
        this.displayInfo.update(this, this.canvasStrings.SET_FULL_SCREEN_MODE);
    }

    public override function sizeChanged(w : Int, h : Int) : Void {
        this.displayInfo.update(this, this.canvasStrings.SIZE_CHANGED);
    }

    public function getCommandStack() : ABStack<Any> {
        return this.commandStack;
    }

    // synchronized
    public function isCommand(command : Command) : Bool {
        return this.commandStack.contains(command);
    }

    // synchronized
    public override function addCommand(command : Command) : Void {
        if (!this.commandStack.contains(command)) {
            this.commandStack.push(command);
            super.addCommand(command);
        }
    }

    // synchronized
    public override function removeCommand(command : Command) : Void {
        this.commandStack.removeElement(command);
        super.removeCommand(command);
    }

    // synchronized
    public override function removeAllCommands() : Void {
        var size : Int = this.commandStack.size();
        for (index in 0...size) {
            super.removeCommand((cast this.commandStack.pop() : Command));
        }
    }

    public override function setCommandListener(l : CommandListener) : Void {
        super.setCommandListener(l);
        this.commandListener = l;
    }

    public function getCustomCommandListener() : CommandListener {
        return this.commandListener;
    }

    // synchronized
    public function isPaused() : Bool {
        return this.paused;
    }

    public function removePauseCommand() : Void {
        this.removeCommand(MyCommandsFactory.getInstance().PAUSE_COMMAND);
    }

    // synchronized
    public function pause() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.canvasStrings.PAUSE);
        this.removePauseCommand();
        this.addCommand(MyCommandsFactory.getInstance().RESUME_COMMAND);
        this.setPaused(true);
    }

    // synchronized
    public function unPause() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.canvasStrings.UN_PAUSE);
        this.removeCommand(MyCommandsFactory.getInstance().RESUME_COMMAND);
        this.addCommand(MyCommandsFactory.getInstance().PAUSE_COMMAND);
        this.setPaused(false);
    }

    // throws Exception
    public function process() : Void {
        this.displayInfo.process();
    }

    public override function paint(graphics : Graphics) : Void {
    }

    public function draw(graphics : Graphics) : Void {
    }

    public function hasChild(displayable : MyCanvas) : Bool {
        return this.childNameList.contains(displayable.name);
    }

    public function destroy() : Void {
        this.logUtil.putF("Destroyed MyCanvas", this, "destroy");
    }

    public function setPaused(isPaused : Bool) : Void {
        this.paused = isPaused;
    }

    public function keyPressedByDevice(keyCode : Int, deviceId : Int) : Void {
    }

    public function keyRepeatedByDevice(keyCode : Int, deviceId : Int) : Void {
    }

    public function keyReleasedByDevice(keyCode : Int, deviceId : Int) : Void {
    }

    private final touchME : TouchJ2ME = new TouchJ2ME();
    public override function pointerDragged(x : Int, y : Int) : Void {
        this.touchME.pointerDragged(x, y);
    }

    public override function pointerPressed(x : Int, y : Int) : Void {
        this.touchME.pointerPressed(x, y);
    }

    public override function pointerReleased(x : Int, y : Int) : Void {
        this.touchME.pointerReleased(x, y);
    }

    public function nextSong(nextSongSound : Sound, leftVolume : Int, rightVolume : Int) : Void {
    }

}

