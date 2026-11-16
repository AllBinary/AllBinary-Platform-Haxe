// Generated Code Do Not Modify
package org.allbinary.media.audio;

import javax.microedition.media.PlayerListener;
import android.media.MediaPlayer;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;

class AndroidMediaPlayerWrapperListener {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var androidMediaPlayerWrapper : AndroidMediaPlayerWrapper = AndroidMediaPlayerWrapper.NULL_ANDROID_MEDIA_PLAYER_WRAPPER;
    public function new(androidMediaPlayerWrapper : AndroidMediaPlayerWrapper) {
        this.mOnBufferingUpdateListener = new AndroidMediaPlayerOnBufferingUpdateListener(this);
        this.mOnPreparedListener = new AndroidMediaPlayerOnPreparedListener(this);
        this.mOnErrorListener = new AndroidMediaPlayerOnErrorListener(this);
        this.mOnCompletionListener = new AndroidMediaPlayerOnCompletionListener(this);
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
            this.androidMediaPlayerWrapper = androidMediaPlayerWrapper;
            final mediaPlayer : MediaPlayer = androidMediaPlayerWrapper.getMediaPlayer();
            mediaPlayer.setOnCompletionListener(this.mOnCompletionListener);
            mediaPlayer.setOnBufferingUpdateListener(this.mOnBufferingUpdateListener);
            mediaPlayer.setOnPreparedListener(this.mOnPreparedListener);
            mediaPlayer.setOnErrorListener(this.mOnErrorListener);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
        }
    }

    // Java inner class: Haxe does not nest classes so move this to its own module
    class MediaPlayerOnBufferingUpdateListener implements MediaPlayer.OnBufferingUpdateListener {
        public function onBufferingUpdate(mediaPlayer : MediaPlayer, i : Int) : Void {
        }

        public function new() {
        }
    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class MediaPlayerOnPreparedListener implements MediaPlayer.OnPreparedListener {
        public function onPrepared(mp : MediaPlayer) : Void {
        }

        public function new() {
        }
    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class MediaPlayerOnErrorListener implements MediaPlayer.OnErrorListener {
        public function onError(mp : MediaPlayer, what : Int, extra : Int) : Bool {
            return false;
        }

        public function new() {
        }
    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class MediaPlayerOnCompletionListener implements MediaPlayer.OnCompletionListener {
        public function onCompletion(mp : MediaPlayer) : Void {
        }

        public function new() {
        }
    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class AndroidMediaPlayerOnBufferingUpdateListener extends MediaPlayerOnBufferingUpdateListener {
        private final ON_BUFFERING_UPDATE : String = "onBufferingUpdate()";
        private final androidMediaPlayerWrapperListener : AndroidMediaPlayerWrapperListener;
        public function new(androidMediaPlayerWrapperListener : AndroidMediaPlayerWrapperListener) {
            super();
            this.androidMediaPlayerWrapperListener = androidMediaPlayerWrapperListener;
        }

        public override function onBufferingUpdate(mediaPlayer : MediaPlayer, i : Int) : Void {
            final logUtil : LogUtil = LogUtil.getInstance();
            logUtil.putF(Std.string(new StringMaker().append("Update buffer: ").appendint(i).append("%")), this, this.ON_BUFFERING_UPDATE);
            this.androidMediaPlayerWrapperListener.androidMediaPlayerWrapper.update(javax.microedition.media.PlayerListener.PlayerListenerFields.DEVICE_UNAVAILABLE);
        }

    }
    private var mOnBufferingUpdateListener : MediaPlayer.OnBufferingUpdateListener;
    // Java inner class: Haxe does not nest classes so move this to its own module
    class AndroidMediaPlayerOnPreparedListener extends MediaPlayerOnPreparedListener {
        private final ON_PREPARE : String = "onPrepare()";
        private final androidMediaPlayerWrapperListener : AndroidMediaPlayerWrapperListener;
        public function new(androidMediaPlayerWrapperListener : AndroidMediaPlayerWrapperListener) {
            super();
            this.androidMediaPlayerWrapperListener = androidMediaPlayerWrapperListener;
        }

        public override function onPrepared(mp : MediaPlayer) : Void {
            final logUtil : LogUtil = LogUtil.getInstance();
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            logUtil.putF(commonStrings.START, this, this.ON_PREPARE);
            this.androidMediaPlayerWrapperListener.androidMediaPlayerWrapper.update(javax.microedition.media.PlayerListener.PlayerListenerFields.DEVICE_AVAILABLE);
        }

    }
    private var mOnPreparedListener : MediaPlayer.OnPreparedListener;
    // Java inner class: Haxe does not nest classes so move this to its own module
    class AndroidMediaPlayerOnErrorListener extends MediaPlayerOnErrorListener {
        private final ON_ERROR : String = "onError()";
        private final androidMediaPlayerWrapperListener : AndroidMediaPlayerWrapperListener;
        public function new(androidMediaPlayerWrapperListener : AndroidMediaPlayerWrapperListener) {
            super();
            this.androidMediaPlayerWrapperListener = androidMediaPlayerWrapperListener;
        }

        public override function onError(mp : MediaPlayer, what : Int, extra : Int) : Bool {
            final logUtil : LogUtil = LogUtil.getInstance();
            logUtil.putF(Std.string(new StringMaker().append(CommonLabels.getInstance().START_LABEL).append("What: ").appendint(what).append(" Extra: ").appendint(extra)), this, this.ON_ERROR);
            this.androidMediaPlayerWrapperListener.androidMediaPlayerWrapper.update(javax.microedition.media.PlayerListener.PlayerListenerFields.ERROR);
            return true;
        }

    }
    private var mOnErrorListener : MediaPlayer.OnErrorListener;
    // Java inner class: Haxe does not nest classes so move this to its own module
    class AndroidMediaPlayerOnCompletionListener extends MediaPlayerOnCompletionListener {
        private final ON_COMPLETE : String = "onComplete()";
        private final androidMediaPlayerWrapperListener : AndroidMediaPlayerWrapperListener;
        public function new(androidMediaPlayerWrapperListener : AndroidMediaPlayerWrapperListener) {
            super();
            this.androidMediaPlayerWrapperListener = androidMediaPlayerWrapperListener;
        }

        public override function onCompletion(mp : MediaPlayer) : Void {
            final logUtil : LogUtil = LogUtil.getInstance();
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            logUtil.putF(commonStrings.START, this, this.ON_COMPLETE);
            this.androidMediaPlayerWrapperListener.androidMediaPlayerWrapper.update(javax.microedition.media.PlayerListener.PlayerListenerFields.END_OF_MEDIA);
        }

    }
    private var mOnCompletionListener : MediaPlayer.OnCompletionListener;
}

