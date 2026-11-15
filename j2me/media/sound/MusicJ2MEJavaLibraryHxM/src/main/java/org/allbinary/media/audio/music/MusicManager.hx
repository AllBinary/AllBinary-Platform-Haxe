// Generated Code Do Not Modify
package org.allbinary.media.audio.music;

import org.allbinary.thread.ARunnable;
//import javax.microedition.media.Player;
//import javax.microedition.media.PlayerListener;
import org.allbinary.AvianUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.media.audio.NoSound;
import org.allbinary.media.audio.PlayerStateUtil;
import org.allbinary.media.audio.Sound;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.GameTickTimeDelayHelper;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

class MusicManager {
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    private final basicArrayListUtil : BasicArrayListUtil = BasicArrayListUtil.getInstance();
    private final gameTickTimeDelayHelper : GameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance();
    private final playerStateUtil : PlayerStateUtil = PlayerStateUtil.getInstance();
    private final timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(0);
    //Handle Media ending for Avian
    // Java inner class: Haxe does not nest classes so move this to its own module
    class MusicManagerPlayerListener implements PlayerListener {
        public function playerUpdate(player : Player, event : String, eventData : Any) : Void {
            PreLogUtil.put(event, this, commonStrings.PROCESS);
            if (event == PlayerListener.END_OF_MEDIA || event == PlayerListener.STOPPED || event == PlayerListener.CLOSED) {
                reset();
            }
        }

        public function new() {
        }
    }
    private final playerListener : PlayerListener = new MusicManagerPlayerListener();
    private final PLAY : String = "Play ";
    private final SONG : String = " for: ";
    private final NEXT_SONG : String = CommonLabels.getInstance().NEXT + " Song: ";
    private final STOPPING : String = "Stopping Current Song: ";
    private final ENDING : String = "Ending Current Song: ";
    private final WAITING_FOR_MEDIA_TO_END : String = "Waiting for media to end";
    private final ALREADY_PLAYING : String = "Already Playing: ";
    private final ALREADY_ENDED : String = "Last Song already ended: ";
    private final songList : BasicArrayList;
    private var currentSongSound : Sound = NoSound.getInstance();
    private var nextSongSound : Sound = NoSound.getInstance();
    private var reset : Bool = false;
    private var noDuration : Bool = false;
    private var stopped : Bool = true;
    public function new(musicServiceClass : Class<Dynamic>, songList : BasicArrayList) {
        this.songList = songList;
    }

    public function startNewSong() : Void {
        if (this.nextSongSound == NoSound.getInstance()) {
            final randomSongSound : Sound = (cast this.basicArrayListUtil.getRandom(this.songList) : Sound);
            this.nextSong(randomSongSound, 0, 0);
        }
        this.process();
    }

    public function nextSong(nextSongSound : Sound, leftVolume : Int, rightVolume : Int) : Void {
        PreLogUtil.put(new StringMaker().append(NEXT_SONG).append(nextSongSound.getResource()).toString(), this, this.commonStrings.PROCESS);
        this.nextSongSound = nextSongSound;
        this.reset();
        this.stopped = false;
    }

    public function reset() : Void {
        this.reset = true;
    }

    public function process() : Void {
        try {
            if (this.stopped) {
                return;
            }
            if (this.songList.size() == 0) {
                return;
            }
            if ((this.timeDelayHelper.isTime(this.gameTickTimeDelayHelper.startTime) && !this.noDuration) || this.reset) {
                this.reset = false;
                this.noDuration = false;
                final endingCurrentSongSound : Sound = this.currentSongSound;
                final nextSongSound : Sound = this.nextSongSound;
                this.nextSongSound = NoSound.getInstance();
                if (nextSongSound == NoSound.getInstance()) {
                    this.currentSongSound = (cast BasicArrayListUtil.getInstance().getRandom(this.songList) : Sound);
                } else {
                    this.currentSongSound = nextSongSound;
                }
                final startingCurrentSongSound : Sound = this.currentSongSound;
                final duration : haxe.Int64 = haxe.Int64.ofInt(this.currentSongSound.getDuration());
                this.timeDelayHelper.delay = haxe.Int64.toInt(duration);
                if (duration <= 0) {
                    final NO_DURATION_FOR : String = "No Duration for: ";
                    PreLogUtil.put(new StringMaker().append(NO_DURATION_FOR).append(this.currentSongSound.getResource()).toString(), this, this.commonStrings.PROCESS);
                    this.currentSongSound.getPlayerP().addPlayerListener(playerListener);
                    this.noDuration = true;
                }
                if (endingCurrentSongSound != NoSound.getInstance()) {
                    if (endingCurrentSongSound == startingCurrentSongSound && endingCurrentSongSound.getPlayerP().getState() == Player.STARTED) {
                        PreLogUtil.put(new StringMaker().append(this.ALREADY_PLAYING).append(endingCurrentSongSound.getResource()).toString(), this, this.commonStrings.PROCESS);
                        PreLogUtil.put(new StringMaker().append(this.STOPPING).append(endingCurrentSongSound.getResource()).append(this.SONG).appendlong(duration).toString(), this, this.commonStrings.PROCESS);
                        endingCurrentSongSound.getPlayerP().stop();
                        this.waitForStateChange(endingCurrentSongSound, startingCurrentSongSound);
                    } else {
                        if (endingCurrentSongSound.getPlayerP().getState() == Player.STARTED) {
                            PreLogUtil.put(new StringMaker().append(this.STOPPING).append(endingCurrentSongSound.getResource()).append(this.SONG).appendlong(duration).toString(), this, this.commonStrings.PROCESS);
                            endingCurrentSongSound.getPlayerP().stop();
                            this.waitForStateChange(endingCurrentSongSound, startingCurrentSongSound);
                        } else {
                            PreLogUtil.put(new StringMaker().append(this.ALREADY_ENDED).append(this.PLAY).append(startingCurrentSongSound.getResource()).toString(), this, this.commonStrings.PROCESS);
                            if (AvianUtil.isAvian()) {
                                endingCurrentSongSound.getPlayerP().stop();
                                startingCurrentSongSound.getPlayerP().stop();
                            }
                            startingCurrentSongSound.getPlayerP().start();
                        }
                    }
                } else {
                    PreLogUtil.put(new StringMaker().append(this.PLAY).append(this.currentSongSound.getResource()).append(this.SONG).appendlong(duration).toString(), this, this.commonStrings.PROCESS);
                    this.currentSongSound.getPlayerP().start();
                }
            }
        } catch (e : haxe.Exception) {
            var resource : String = StringUtil.getInstance().EMPTY_STRING;
            if (this.currentSongSound != NoSound.getInstance()) {
                resource = this.currentSongSound.getResource();
            }
            PreLogUtil.putOE(this.commonStrings.EXCEPTION_LABEL + resource, this, this.commonStrings.PROCESS, e);
        }
    }

    // throws Exception
    private function waitForStateChange(endingCurrentSongSound : Sound, startingCurrentSongSound : Sound) : Void {
        while (endingCurrentSongSound.getPlayerP().getState() == Player.STARTED) {
            PreLogUtil.put(this.WAITING_FOR_MEDIA_TO_END, this, this.commonStrings.PROCESS);
            Sys.sleep(haxe.Int64.toInt(100) / 1000);
        }
        PreLogUtil.put(new StringMaker().append(this.playerStateUtil.convert(endingCurrentSongSound.getPlayerP().getState())).append(this.commonSeps.SPACE).append(this.PLAY).append(startingCurrentSongSound.getResource()).toString(), this, this.commonStrings.PROCESS);
        startingCurrentSongSound.getPlayerP().start();
    }

    // throws Exception
    public function stop() : Void {
        try {
            final currentSongSound : Sound = this.currentSongSound;
            if (currentSongSound != NoSound.getInstance()) {
                this.stopped = true;
                PreLogUtil.put(new StringMaker().append(this.ENDING).append(currentSongSound.getResource()).toString(), this, this.commonStrings.PROCESS);
                currentSongSound.getPlayerP().stop();
            }
            this.timeDelayHelper.setStartTime(0);
            PreLogUtil.put(new StringMaker().append(this.commonStrings.END).append(StringUtil.getInstance().toString(currentSongSound)).toString(), this, this.commonStrings.END);
        } catch (e : haxe.Exception) {
            var resource : String = StringUtil.getInstance().EMPTY_STRING;
            if (currentSongSound != NoSound.getInstance()) {
                resource = currentSongSound.getResource();
            }
            PreLogUtil.putOE(this.commonStrings.EXCEPTION_LABEL + resource, this, this.commonStrings.END, e);
        }
    }

}

