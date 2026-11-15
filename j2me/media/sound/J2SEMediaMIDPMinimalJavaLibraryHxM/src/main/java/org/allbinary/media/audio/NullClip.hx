/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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

//import java.io.IOException;
//import javax.sound.sampled.AudioFormat;
//import javax.sound.sampled.AudioInputStream;
//import javax.sound.sampled.BooleanControl;
//import javax.sound.sampled.Clip;
//import javax.sound.sampled.Control;
//import javax.sound.sampled.Control.Type;
//import javax.sound.sampled.Line.Info;
//import javax.sound.sampled.LineListener;
//import javax.sound.sampled.LineUnavailableException;

class NullClip implements Clip {
    public static final NULL_CONTROL : NullJ2SEControl = new NullJ2SEControl(BooleanControl.Type.MUTE);
    // throws LineUnavailableException
    public function open(format : AudioFormat, data : haxe.ds.Vector<Int>, offset : Int, bufferSize : Int) : Void {
    }

    // throws LineUnavailableException, IOException
    public function open(stream : AudioInputStream) : Void {
    }

    public function getFrameLength() : Int {
        return 0;
    }

    public function getMicrosecondLength() : haxe.Int64 {
        return 0;
    }

    public function setFramePosition(frames : Int) : Void {
    }

    public function setMicrosecondPosition(microseconds : haxe.Int64) : Void {
    }

    public function setLoopPoints(start : Int, end : Int) : Void {
    }

    public function loop(count : Int) : Void {
    }

    public function drain() : Void {
    }

    public function flush() : Void {
    }

    public function start() : Void {
    }

    public function stop() : Void {
    }

    public function isRunning() : Bool {
        return false;
    }

    public function isActive() : Bool {
        return false;
    }

    public function getFormat() : AudioFormat {
        return NullAudioFormat.NULL_AUDIO_FORMAT;
    }

    public function getBufferSize() : Int {
        return 0;
    }

    public function available() : Int {
        return 0;
    }

    public function getFramePosition() : Int {
        return 0;
    }

    public function getLongFramePosition() : haxe.Int64 {
        return haxe.Int64.ofInt(0);
    }

    public function getMicrosecondPosition() : haxe.Int64 {
        return haxe.Int64.ofInt(0);
    }

    public function getLevel() : Float {
        return 0.0;
    }

    public function getLineInfo() : Info {
        return new Info(Type.getClass(this), NullAudioFormat.NULL_AUDIO_FORMAT);
    }

    // throws LineUnavailableException
    public function open() : Void {
    }

    public function close() : Void {
    }

    public function isOpen() : Bool {
        return false;
    }

    public function getControls() : haxe.ds.Vector<Control> {
        return haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    }

    public function isControlSupported(control : Type) : Bool {
        return false;
    }

    public function getControl(control : Type) : Control {
        return NullClip.NULL_CONTROL;
    }

    public function addLineListener(listener : LineListener) : Void {
    }

    public function removeLineListener(listener : LineListener) : Void {
    }

    public function new() {
    }
}

