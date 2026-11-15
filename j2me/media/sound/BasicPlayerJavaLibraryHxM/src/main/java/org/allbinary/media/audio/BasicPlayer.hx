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
package org.allbinary.media.audio;

//import javax.microedition.media.Control;
//import javax.microedition.media.MediaException;
//import javax.microedition.media.Player;
//import javax.microedition.media.PlayerListener;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

//BasicPlayerJavaLibrary
class BasicPlayer implements Player implements Controllable2 {
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public static var CONTROL_TYPE : String = "ToneControl";
    public final listenersList : BasicArrayList = new BasicArrayListD();
    public var stateP : Int = 0;
    public var loopCountP : Int = 0;
    public function new() {
        this.setLoopCount(0);
        this.setState(Player.UNREALIZED);
    }

    public function getContentType() : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    public function getControl(controlType : String) : Control {
        return new NullControl();
    }

    public function getControls() : haxe.ds.Vector<Control> {
        return haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    }

    public function close() : Void {
    }

    // synchronized
    public function addPlayerListener(playerListener : PlayerListener) : Void {
        if (!this.listenersList.contains(playerListener)) {
            this.listenersList.add(playerListener);
        }
    }

    public function removePlayerListener(playerListener : PlayerListener) : Void {
        this.listenersList.remove(playerListener);
    }

    public function getState() : Int {
        return this.stateP;
    }

    // synchronized
    public function setState(state : Int) : Void {
        this.stateP = state;
    }

    public function getDuration() : haxe.Int64 {
        return 0;
    }

    public function getMediaTime() : haxe.Int64 {
        return 0;
    }

    public function deallocate() : Void {
    }

    // throws MediaException
    public function prefetch() : Void {
    }

    // throws MediaException
    public function realize() : Void {
    }

    // synchronized
    public function setLoopCount(count : Int) : Void {
        this.loopCountP = count;
    }

    public function getLoopCount() : Int {
        return this.loopCountP;
    }

    // throws MediaException
    // synchronized
    public function setMediaTime(now : haxe.Int64) : haxe.Int64 {
        return 0;
    }

    // throws MediaException
    // synchronized
    public function start() : Void {
        this.setState(Player.STARTED);
    }

    // throws MediaException
    // synchronized
    public function stop() : Void {
        this.setState(Player.PREFETCHED);
    }

    public function setVolume(leftVolume : Int, rightVolume : Int) : Void {
    }

}

