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
package org.allbinary.audio;


class AudioContentTypeDataFactory {
    private static final instance : AudioContentTypeDataFactory = new AudioContentTypeDataFactory();
    public static function getInstance() : AudioContentTypeDataFactory {
        return AudioContentTypeDataFactory.instance;
    }

    public final MIME_AUDIO_TONE : AudioContentTypeData = new AudioContentTypeData("audio/x-tone-seq");
    public final MIME_AUDIO_AMR : AudioContentTypeData = new AudioContentTypeData("audio/amr");
    public final MIME_AUDIO_AMR_WB : AudioContentTypeData = new AudioContentTypeData("audio/amr-wb");
    public final MIME_AUDIO_WAV : AudioContentTypeData = new AudioContentTypeData("audio/x-wav");
    public final MIME_AUDIO_MIDI : AudioContentTypeData = new AudioContentTypeData("audio/midi");
    public final MIME_AUDIO_SP_MIDI : AudioContentTypeData = new AudioContentTypeData("audio/sp-midi");
    public function new() {
    }

}

