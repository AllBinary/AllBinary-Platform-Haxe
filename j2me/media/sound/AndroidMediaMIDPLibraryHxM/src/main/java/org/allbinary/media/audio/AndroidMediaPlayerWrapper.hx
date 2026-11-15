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

import javax.microedition.media.MediaException;
import javax.microedition.media.Player;
import javax.microedition.media.PlayerListener;
import android.media.MediaPlayer;
import org.allbinary.android.NullAndroidCanvas;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class AndroidMediaPlayerWrapper extends BasicPlayer {
    public static function createPlayerWrapper() : AndroidMediaPlayerWrapper {
        try {
            return new AndroidMediaPlayerWrapper(StringUtil.getInstance().EMPTY_STRING);
        } catch (e : haxe.Exception) {
            throw new jre.lang.JavaException();
        }
    }

    public static final NULL_ANDROID_MEDIA_PLAYER_WRAPPER : AndroidMediaPlayerWrapper = AndroidMediaPlayerWrapper.createPlayerWrapper();
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var mediaPlayer : MediaPlayer = NullAndroidCanvas.NULL_MEDIA_PLAYER;
    public function new(resource : String) {
        super();
        try {
            if (resource == StringUtil.getInstance().EMPTY_STRING) {
            } else {
                final resourceUtil : ResourceUtil = ResourceUtil.getInstance();
                final mediaPlayer : MediaPlayer = MediaPlayer.create(resourceUtil.getContext(), Std.int(resourceUtil.getResourceId(resource)));
                if (mediaPlayer == null) {
                    throw new jre.lang.JavaException(Std.string(new StringMaker().append("Failed to create media player for: ").append(resource).append(" with id: ").append(Std.string(resourceUtil.getResourceId(resource)))));
                }
                this.setMediaPlayer(mediaPlayer);
                this.mediaPlayer.setLooping(false);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + resource, this, this.commonStrings.CONSTRUCTOR, e);
            throw e;
        }
    }

    public override function setLoopCount(count : Int) : Void {
        super.setLoopCount(count);
        if (this.mediaPlayer != NullAndroidCanvas.NULL_MEDIA_PLAYER && this.mediaPlayer != null) {
            if (count == 0) {
                this.mediaPlayer.setLooping(false);
            } else {
            }
        }
    }

    // synchronized
    public override function addPlayerListener(playerListener : PlayerListener) : Void {
        super.addPlayerListener(playerListener);
    }

    public override function removePlayerListener(playerListener : PlayerListener) : Void {
        super.removePlayerListener(playerListener);
    }

    public override function getState() : Int {
        if (this.mediaPlayer.isPlaying()) {
            return Player.STARTED;
        } else {
            return Player.PREFETCHED;
        }
    }

    public override function close() : Void {
        try {
            this.mediaPlayer.release();
            this.mediaPlayer = NullAndroidCanvas.NULL_MEDIA_PLAYER;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CLOSE, e);
        }
    }

    // throws MediaException
    // synchronized
    public override function start() : Void {
        try {
            if (this.mediaPlayer.isPlaying()) {
                this.mediaPlayer.pause();
                this.mediaPlayer.seekTo(0);
            }
            this.mediaPlayer.start();
            super.start();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.START_METHOD_NAME, e);
        }
    }

    // throws MediaException
    // synchronized
    public override function stop() : Void {
        try {
            this.mediaPlayer.stop();
            this.mediaPlayer.prepare();
            super.stop();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "stop", e);
        }
    }

    public function update(event : String) : Void {
        this.logUtil.putF("LineEvent: " + event, this, this.commonStrings.UPDATE);
        var size : Int = this.listenersList.size();
        for (index in 0...size) {
            var listener : PlayerListener = (cast this.listenersList.objectArray[index] : PlayerListener);
            listener.playerUpdate(this, event, NullUtil.getInstance().NULL_OBJECT);
        }
    }

    public override function setVolume(leftVolume : Int, rightVolume : Int) : Void {
        this.mediaPlayer.setVolume((leftVolume) / 100.0, (rightVolume) / 100.0);
    }

    public override function getDuration() : haxe.Int64 {
        return haxe.Int64.ofInt(this.mediaPlayer.getDuration());
    }

    public function setMediaPlayer(mediaPlayer : MediaPlayer) : Void {
        this.mediaPlayer = mediaPlayer;
    }

    public function getMediaPlayer() : MediaPlayer {
        return this.mediaPlayer;
    }

}

