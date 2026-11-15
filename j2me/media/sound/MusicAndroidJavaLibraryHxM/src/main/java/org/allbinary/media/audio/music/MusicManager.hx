// Generated Code Do Not Modify
package org.allbinary.media.audio.music;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import org.allbinary.android.AndroidServicesUtil;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.media.audio.NoSound;
import org.allbinary.media.audio.Sound;
import org.allbinary.string.CommonStateStrings;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.GameTickTimeDelayHelper;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

class MusicManager {
    private final PLAY : String = "Play ";
    private final FOR : String = " for: ";
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final musicStrings : MusicStrings = MusicStrings.getInstance();
    private final commonStateStrings : CommonStateStrings = CommonStateStrings.getInstance();
    private final basicArrayListUtil : BasicArrayListUtil = BasicArrayListUtil.getInstance();
    private final resourceUtil : ResourceUtil = ResourceUtil.getInstance();
    private final androidServicesUtil : AndroidServicesUtil = AndroidServicesUtil.getInstance();
    private final gameTickTimeDelayHelper : GameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance();
    private final timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(0);
    private final timeDelayHelper2 : TimeDelayHelper = new TimeDelayHelper(1200);
    private final songList : BasicArrayList;
    private var currentSongSound : Sound = NoSound.getInstance();
    private var nextSongSound : Sound = NoSound.getInstance();
    private var leftVolume : Int = 100;
    private var rightVolume : Int = 100;
    private final musicServiceClass : Class<Dynamic>;
    private final currentIntent : Intent;
    public function new(musicServiceClass : Class<Dynamic>, songList : BasicArrayList) {
        PreLogUtil.put(this.commonStateStrings.CONTEXT + this.resourceUtil.getContext(), this, this.commonStrings.CONSTRUCTOR);
        this.musicServiceClass = musicServiceClass;
        this.currentIntent = new Intent(this.resourceUtil.getContext(), musicServiceClass);
        this.songList = songList;
    }

    public function nextSong(nextSongSound : Sound, leftVolume : Int, rightVolume : Int) : Void {
        if (nextSongSound == null) {
            nextSongSound = NoSound.getInstance();
        }
        this.nextSongSound = nextSongSound;
        this.leftVolume = leftVolume;
        this.rightVolume = rightVolume;
        this.reset();
    }

    public function reset() : Void {
        this.timeDelayHelper.delay = 0;
    }

    public function process() : Void {
        if (this.songList.size() == 0) {
            return;
        }
        if (this.timeDelayHelper.isTime(this.gameTickTimeDelayHelper.startTime)) {
            this.startNewSong();
            return;
        }
        if (this.timeDelayHelper2.isTime(this.gameTickTimeDelayHelper.startTime)) {
            if (this.androidServicesUtil.isServiceRunning(this.musicServiceClass.getName())) {
            } else {
                this.startNewSong();
            }
        }
    }

    public function show() : Void {
        {
            var index : Int = this.songList.size();
            while (--index >= 0) {
            final sound : Sound = (cast this.songList.get(index) : Sound);
            final duration : haxe.Int64 = haxe.Int64.ofInt(sound.getDuration());
            PreLogUtil.put(new StringMaker().append(this.PLAY).append(sound.getResource()).append(this.FOR).appendlong(duration).toString(), this, this.commonStrings.PROCESS);
            }
        }
    }

    public function startNewSong() : Void {
        try {
            this.resourceUtil.getContext().stopService(this.currentIntent);
            if (this.nextSongSound == NoSound.getInstance()) {
                this.currentSongSound = (cast this.basicArrayListUtil.getRandom(this.songList) : Sound);
            } else {
                this.currentSongSound = this.nextSongSound;
                this.nextSongSound = NoSound.getInstance();
            }
            final duration : haxe.Int64 = haxe.Int64.ofInt(this.currentSongSound.getDuration());
            PreLogUtil.put(new StringMaker().append(this.PLAY).append(this.currentSongSound.getResource()).append(this.FOR).appendlong(duration).toString(), this, this.commonStrings.PROCESS);
            this.timeDelayHelper.delay = haxe.Int64.toInt(duration);
            this.currentIntent.putExtra(this.musicStrings.SONG_EXTRA, Std.int(this.resourceUtil.getResourceId(this.currentSongSound.getResource())));
            this.currentIntent.putExtra(this.musicStrings.LEFT_VOLUME, this.leftVolume);
            this.currentIntent.putExtra(this.musicStrings.RIGHT_VOLUME, this.rightVolume);
            this.resourceUtil.getContext().startService(this.currentIntent);
        } catch (e : haxe.Exception) {
            var resource : String = StringUtil.getInstance().EMPTY_STRING;
            if (this.currentSongSound != null) {
                resource = this.currentSongSound.getResource();
            }
            PreLogUtil.putOE(this.commonStrings.EXCEPTION_LABEL + resource, this, this.commonStrings.PROCESS, e);
        }
    }

    // throws Exception
    public function stop() : Void {
        this.resourceUtil.getContext().stopService(this.currentIntent);
    }

    public static function pause(activity : Activity, musicServiceClass : Class<Dynamic>) : Void {
        final commonStateStrings : CommonStateStrings = CommonStateStrings.getInstance();
        final musicPauseIntent : Intent = new Intent((cast activity : Context), musicServiceClass);
        musicPauseIntent.putExtra(commonStateStrings.ON_START_COMMAND, 1);
        activity.startService(musicPauseIntent);
    }

    public static function resume(activity : Activity, musicServiceClass : Class<Dynamic>) : Void {
        if (AndroidServicesUtil.getInstance().isServiceRunning(musicServiceClass.getName())) {
            final commonStateStrings : CommonStateStrings = CommonStateStrings.getInstance();
            final musicResumeIntent : Intent = new Intent(activity, musicServiceClass);
            musicResumeIntent.putExtra(commonStateStrings.ON_START_COMMAND, 2);
            activity.startService(musicResumeIntent);
        }
    }

}

