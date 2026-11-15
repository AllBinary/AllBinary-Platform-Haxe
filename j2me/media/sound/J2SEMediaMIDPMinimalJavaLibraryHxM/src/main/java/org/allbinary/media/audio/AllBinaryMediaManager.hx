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

//import java.io.BufferedInputStream;
//import java.io.ByteArrayInputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import javax.microedition.media.Manager;
//import javax.microedition.media.MediaException;
//import javax.microedition.media.Player;
import org.allbinary.TsUtil;
import org.allbinary.audio.AudioContentTypeDataFactory;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

//J2SEMediaMIDPMinimalJavaLibrary
class AllBinaryMediaManager {
    private static final THIS : String = "AllBinaryMediaManagerPC";
    public function new() {
    }

    public static function isMuted() : Bool {
        return false;
    }

    public static function setMuted(aMuted : Bool) : Void {
    }

    public static function update() : Bool {
        return true;
    }

    // throws Exception
    public static function init(soundsFactoryInterface : SoundsFactoryInterface) : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonString : CommonStrings = CommonStrings.getInstance();
        logUtil.putF(commonString.START, AllBinaryMediaManager.THIS, commonString.INIT);
        ProgressCanvasFactory.getInstance().addNormalPortion(50, "Media Manager");
        new Sounds(soundsFactoryInterface).init();
    }

    // throws Exception
    public static function shutdown(soundsFactoryInterface : SoundsFactoryInterface) : Void {
        new Sounds(soundsFactoryInterface).stopAll();
        new Sounds(soundsFactoryInterface).closeAll();
        TsUtil.getInstance().gc();
    }

    private static final CREATE_PLAYER : String = "createPlayer";
    // throws Exception
    public static function createPlayer(resource : String) : Player {
        if (StringTools.startsWith(resource, Manager.TONE_DEVICE_LOCATOR)) {
            return AllBinaryMediaManager.createPlayerFromInputStream(new ByteArrayInputStream(NullUtil.getInstance().NULL_BYTE_ARRAY), AudioContentTypeDataFactory.getInstance().MIME_AUDIO_TONE.getName());
        } else if (Features.getInstance().isFeature(GameFeatureFactory.getInstance().SOUND)) {
            try {
                final inputStream : InputStream = ResourceUtil.getInstance().getResourceAsStream(resource);
                final bufferedInputStream : BufferedInputStream = new BufferedInputStream(inputStream);
                return new PCClipWavPlayer(bufferedInputStream);
            } catch (e : haxe.Exception) {
                final logUtil : LogUtil = LogUtil.getInstance();
                final commonString : CommonStrings = CommonStrings.getInstance();
                logUtil.put(commonString.EXCEPTION, AllBinaryMediaManager.THIS, CREATE_PLAYER, e);
                return NoPlayer.NO_PLAYER;
            }
        } else {
            return NoPlayer.NO_PLAYER;
        }
    }

    // throws IOException, MediaException
    public static function createPlayerFromInputStream(stream : InputStream, type : String) : Player {
        throw new MediaException("No Impl");
    }

    // throws MediaException
    // synchronized
    public static function playTone(frequency : Int, time : Int, volume : Int) : Void {
        throw new MediaException("No Impl");
    }

    public static function isInitialized() : Bool {
        return true;
    }

}

