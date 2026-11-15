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
//import javax.microedition.media.Controllable;
//import javax.microedition.media.MediaException;
//import javax.microedition.media.Player;
//import javax.microedition.media.PlayerListener;
//import javax.microedition.media.TimeBase;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.GameTickTimeDelayHelper;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;

//BasicPlayerMIDP2
class PlayerComposite implements Controllable implements Player {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final player : Player;
    private final timeElapsedHelper : TimeDelayHelper = new TimeDelayHelper(0);
    public function new(player : Player, repeatTime : Int) {
        this.player = player;
        this.timeElapsedHelper.delay = repeatTime;
    }

    // synchronized
    public function addPlayerListener(playerListener : PlayerListener) : Void {
        this.player.addPlayerListener(playerListener);
    }

    public function removePlayerListener(playerListener : PlayerListener) : Void {
        this.player.removePlayerListener(playerListener);
    }

    public function close() : Void {
        this.player.close();
    }

    public function deallocate() : Void {
        this.player.deallocate();
    }

    public function getContentType() : String {
        return this.player.getContentType();
    }

    public function getDuration() : haxe.Int64 {
        return this.player.getDuration();
    }

    public function getMediaTime() : haxe.Int64 {
        return this.player.getMediaTime();
    }

    public function getTimeBase() : TimeBase {
        return ((cast this.player : TimeBaseInterface)).getTimeBase();
    }

    // throws MediaException
    // synchronized
    public function setTimeBase(timeBase : TimeBase) : Void {
        ((cast this.player : TimeBaseInterface)).setTimeBase(timeBase);
    }

    public function prefetch() : Void {
        try {
            this.player.prefetch();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "prefetch", e);
        }
    }

    public function realize() : Void {
        try {
            this.player.realize();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "realize", e);
        }
    }

    public function getState() : Int {
        return this.player.getState();
    }

    public function setLoopCount(count : Int) : Void {
        this.player.setLoopCount(count);
    }

    public function setMediaTime(now : haxe.Int64) : haxe.Int64 {
        try {
            return this.player.setMediaTime(now);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "setMediaTime", e);
            return haxe.Int64.ofInt(-1);
        }
    }

    private final gameTickTimeDelayHelper : GameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance();
    public function start() : Void {
        try {
            if (this.timeElapsedHelper.isTime(this.gameTickTimeDelayHelper.startTime)) {
                this.player.start();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.START_METHOD_NAME, e);
        }
    }

    public function stop() : Void {
        try {
            this.player.stop();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "stop", e);
        }
    }

    public function getControl(controlType : String) : Control {
        return this.player.getControl(controlType);
    }

    public function getControls() : haxe.ds.Vector<Control> {
        throw new haxe.Exception();
    }

    public function setVolume(leftVolume : Int, rightVolume : Int) : Void {
        final controllable2 : Controllable2 = ((cast this.player : Controllable2));
        controllable2.setVolume(leftVolume, rightVolume);
    }

    public function getPlayerP() : Player {
        return this.player;
    }

}

