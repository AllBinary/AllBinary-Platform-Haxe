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

import org.allbinary.thread.ARunnable;
//import java.io.ByteArrayInputStream;
//import java.io.InputStream;
//import javax.microedition.media.Control;
//import javax.microedition.media.MediaException;
//import javax.microedition.media.PlayerListener;
//import javax.sound.sampled.AudioInputStream;
//import javax.sound.sampled.AudioSystem;
//import javax.sound.sampled.Clip;
//import javax.sound.sampled.FloatControl;
//import javax.sound.sampled.LineEvent;
//import javax.sound.sampled.LineListener;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.thread.MusicThreadPool;

class PCClipWavPlayer extends BasicPlayer implements LineListener {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final audioInputStream : AudioInputStream;
    private final clip : Clip;
    public function new(inputStream : InputStream) {
        super();
        var audioInputStream : AudioInputStream = new AudioInputStream(new ByteArrayInputStream(NullUtil.getInstance().NULL_BYTE_ARRAY), NullAudioFormat.NULL_AUDIO_FORMAT, 0);
        var clip : Clip = new NullClip();
        try {
            audioInputStream = AudioSystem.getAudioInputStream(inputStream);
            clip = this.create(audioInputStream);
            if (clip == null) {
                this.logUtil.put("Clip was null", this, this.commonStrings.CONSTRUCTOR, new haxe.Exception());
                throw new haxe.Exception();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
        }
        this.audioInputStream = audioInputStream;
        this.clip = clip;
    }

    public override function close() : Void {
        MusicThreadPool.getInstance().runTask(/* anonymous class body:
            public function run() : Void {
                try {
                    close2();
                } catch (e : haxe.Exception) {
                    PreLogUtil.putOE(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e);
                }
            }

*/ new ARunnable());
    }

    // throws Exception
    private function close2() : Void {
        this.clip.drain();
        this.clip.flush();
        this.clip.close();
    }

    public override function getContentType() : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    // throws MediaException
    // synchronized
    public override function start() : Void {
        MusicThreadPool.getInstance().runTask(/* anonymous class body:
            public function run() : Void {
                try {
                    start2();
                } catch (e : haxe.Exception) {
                    PreLogUtil.putOE(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e);
                }
            }

*/ new ARunnable());
    }

    // throws Exception
    private function start2() : Void {
        this.clip.setFramePosition(0);
        this.clip.loop(this.getLoopCount());
        this.clip.start();
        super.start();
    }

    // throws Exception
    private function create(audioInputStream : AudioInputStream) : Clip {
        final clip : Clip = AudioSystem.getClip();
        clip.addLineListener(this);
        clip.open(audioInputStream);
        return clip;
    }

    // throws MediaException
    // synchronized
    public override function stop() : Void {
        MusicThreadPool.getInstance().runTask(/* anonymous class body:
            public function run() : Void {
                try {
                    stop2();
                } catch (e : haxe.Exception) {
                    PreLogUtil.putOE(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e);
                }
            }

*/ new ARunnable());
    }

    // throws Exception
    private function stop2() : Void {
        this.clip.stop();
        super.stop();
    }

    public override function getControl(controlType : String) : Control {
        return new NullControl();
    }

    public override function getControls() : haxe.ds.Vector<Control> {
        return haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    }

    public override function setVolume(leftVolume : Int, rightVolume : Int) : Void {
        this.setVolumeF((leftVolume) / 100.0);
    }

    private function getVolume() : Float {
        final masterGainFloatControl : FloatControl = (cast clip.getControl(FloatControl.Type.MASTER_GAIN) : FloatControl);
        return Math.pow(10.0, masterGainFloatControl.getValue() / 20.0);
    }

    private function setVolumeF(volume : Float) : Void {
        if (volume < 0.0 || volume > 1.0) {
            throw new IllegalArgumentException("Volume: " + volume);
        }
        final masterGainFloatControl : FloatControl = (cast this.clip.getControl(FloatControl.Type.MASTER_GAIN) : FloatControl);
        masterGainFloatControl.setValue(20.0 * Math.log10(volume));
    }

    public override function getDuration() : haxe.Int64 {
        return this.clip.getMicrosecondLength() / 1000;
    }

    public override function update(event : LineEvent) : Void {
        if (event.getType().equals(LineEvent.Type.STOP)) {
            final size : Int = this.listenersList.size();
            for (index in 0...size) {
                var listener : PlayerListener = (cast this.listenersList.get(size) : PlayerListener);
                listener.playerUpdate(this, PlayerListener.END_OF_MEDIA, null);
            }
        }
    }

}

