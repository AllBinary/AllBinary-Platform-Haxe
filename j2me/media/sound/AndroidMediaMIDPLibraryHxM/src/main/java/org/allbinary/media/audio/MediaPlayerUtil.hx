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

import android.media.MediaPlayer;
import org.allbinary.logic.communication.log.LogUtil;

class MediaPlayerUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : MediaPlayerUtil = new MediaPlayerUtil();
    public static function getInstance() : MediaPlayerUtil {
        return MediaPlayerUtil.instance;
    }

    // throws Exception
    public function waitForMediaPlayer(mediaPlayer : MediaPlayer) : Void {
        final MESSAGE : String = "Not Stopped Waiting";
        final METHOD_NAME : String = "wait";
        var index : Int = 0;
        while (mediaPlayer.isPlaying() && index < 50) {
            this.logUtil.putF(MESSAGE, this, METHOD_NAME);
            Sys.sleep(haxe.Int64.toInt(100) / 1000);
            index++;
        }
    }

    public function new() {
    }
}

