// Generated Code Do Not Modify
package org.allbinary.media.audio.music;

import android.app.Service;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.IBinder;
import org.allbinary.android.NullAndroidCanvas;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStateStrings;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.ARunnable;

class BaseMusicService extends Service {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final commonStateStrings : CommonStateStrings = CommonStateStrings.getInstance();
    private final ALREADY_PLAYING : String = "This is one song per music service";
    private final WAITING_FOR_MUSIC_TO_END : String = "Waiting for music to end";
    private var player : MediaPlayer = NullAndroidCanvas.NULL_MEDIA_PLAYER;
    private var songId : Int = -1;
    private var leftVolume : Int = -1;
    private var rightVolume : Int = -1;
    public override function onBind(intent : Intent) : IBinder {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStateStrings.BIND);
        return null;
    }

    public override function onCreate() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStateStrings.CREATE);
    }

    public override function onDestroy() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStateStrings.DESTROY);
        if (this.player != NullAndroidCanvas.NULL_MEDIA_PLAYER) {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStateStrings.PAUSE);
            this.player.stop();
            this.player.reset();
            this.player.release();
        }
    }

    public function pause() : Void {
        if (this.player != NullAndroidCanvas.NULL_MEDIA_PLAYER) {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStateStrings.PAUSE);
            this.player.pause();
        }
    }

    public function resume() : Void {
        if (this.player != NullAndroidCanvas.NULL_MEDIA_PLAYER && !this.player.isPlaying()) {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStateStrings.RESUME);
            this.player.start();
        }
    }

    public function start() : Void {
        this.player = MediaPlayer.create(this, this.songId);
        this.player.setVolume((this.leftVolume) / 100.0, (this.rightVolume) / 100.0);
        this.player.setLooping(false);
        this.player.start();
    }

    public override function onStart(intent : Intent, startid : Int) : Void {
        this.onStartCommandIntent(intent);
        this.logUtil.putF(this.commonStrings.START, this, this.commonStateStrings.START);
    }

    public override function onStartCommand(intent : Intent, flags : Int, startId : Int) : Int {
        this.onStartCommandIntent(intent);
        return Service.START_STICKY;
    }

    public function onStartCommandIntent(intent : Intent) : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStateStrings.ON_START_COMMAND);
        final musicStrings : MusicStrings = MusicStrings.getInstance();
        if (intent != null) {
            final command : Int = intent.getIntExtra(this.commonStateStrings.ON_START_COMMAND, -1);
            this.logUtil.putF(CommonLabels.getInstance().COMMAND_LABEL + command, this, this.commonStateStrings.ON_START_COMMAND);
            if (command == 1) {
                this.pause();
                return;
            } else if (command == 2) {
                this.resume();
                return;
            } else {
                this.songId = intent.getIntExtra(musicStrings.SONG_EXTRA, -1);
                this.leftVolume = intent.getIntExtra(musicStrings.LEFT_VOLUME, -1);
                this.rightVolume = intent.getIntExtra(musicStrings.RIGHT_VOLUME, -1);
            }
        } else {
            throw new haxe.Exception("Started service without intent");
        }
        if (this.songId != -1) {
            null;
            if (this.player != NullAndroidCanvas.NULL_MEDIA_PLAYER && this.player.isPlaying()) {
                final player : MediaPlayer = this.player;
                this.logUtil.putF(this.ALREADY_PLAYING, this, this.commonStateStrings.ON_START_COMMAND);
                // Java inner class: Haxe does not nest classes so move this to its own module
                class MusicRunnable extends ARunnable {
                    private final baseMusicService : BaseMusicService;
                    public function new(baseMusicService : BaseMusicService) {
                        super();
                        this.baseMusicService = baseMusicService;
                    }

                    public override function run() : Void {
                        final logUtil : LogUtil = LogUtil.getInstance();
                        final commonStrings : CommonStrings = CommonStrings.getInstance();
                        final commonStateStrings : CommonStateStrings = CommonStateStrings.getInstance();
                        try {
                            while (player.isPlaying()) {
                                logUtil.putF(this.baseMusicService.WAITING_FOR_MUSIC_TO_END, this, commonStateStrings.ON_START_COMMAND);
                                Sys.sleep(haxe.Int64.toInt(1200) / 1000);
                            }
                            this.baseMusicService.onStartCommandIntent(intent);
                        } catch (e : haxe.Exception) {
                            logUtil.put(commonStrings.EXCEPTION, this, commonStateStrings.ON_START_COMMAND, e);
                        }
                    }

                }
                final runnable : Runnable = new MusicRunnable(this);
                final thread : Thread = new Thread(runnable);
                thread.start();
                return;
            }
            this.start();
        }
    }

    public function new() {
        super();
    }
}

