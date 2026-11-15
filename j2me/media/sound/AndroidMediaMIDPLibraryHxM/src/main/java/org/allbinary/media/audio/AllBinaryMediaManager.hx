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

//import java.io.IOException;
//import java.io.InputStream;
//import javax.microedition.media.MediaException;
//import javax.microedition.media.Player;
import org.allbinary.TsUtil;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.logic.ABSystemWrapper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;

//AndroidMediaMIDPLibrary
class AllBinaryMediaManager {
    private static final THIS : String = "AllBinaryMediaManagerAndroid";
    private static var mostUsedTotal : Int = 0;
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
        AllBinaryMediaManager.shutdown(soundsFactoryInterface);
        ProgressCanvasFactory.getInstance().addNormalPortion(50, "Media Manager");
        TsUtil.getInstance().gc();
        new Sounds(soundsFactoryInterface).init();
        logUtil.putF(commonString.END, AllBinaryMediaManager.THIS, commonString.INIT);
    }

    // throws Exception
    public static function shutdown(soundsFactoryInterface : SoundsFactoryInterface) : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonString : CommonStrings = CommonStrings.getInstance();
        logUtil.putF(commonString.START, AllBinaryMediaManager.THIS, "shutdown");
        if (soundsFactoryInterface.isInitialized()) {
            new Sounds(soundsFactoryInterface).stopAll();
            var soundInterfaceArray : haxe.ds.Vector<Sound> = soundsFactoryInterface.getSoundInterfaceArray();
            var player : Player = null;
            var player2 : Player = null;
            var androidMediaPlayerWrapper : AndroidMediaPlayerWrapper = null;
            for (i in 0...soundInterfaceArray.length) {
                if (soundInterfaceArray[i] != null) {
                    player = soundInterfaceArray[i].getPlayerP();
                    if (player != null) {
                        player2 = ((cast player : PlayerComposite)).getPlayerP();
                        if (Std.isOfType(player2, AndroidMediaPlayerWrapper)) {
                            androidMediaPlayerWrapper = (cast player2 : AndroidMediaPlayerWrapper);
                            MediaPlayerUtil.getInstance().waitForMediaPlayer(androidMediaPlayerWrapper.getMediaPlayer());
                        } else {
                            throw new haxe.Exception("Unknown Property Player: " + Type.getClassName(Type.getClass(player)));
                        }
                    }
                }
            }
            new Sounds(soundsFactoryInterface).closeAll();
            TsUtil.getInstance().gc();
            soundsFactoryInterface.setInitialized(false);
            AllBinaryMediaManager.mostUsedTotal = 0;
        }
        logUtil.putF(commonString.START, AllBinaryMediaManager.THIS, "shutdown");
    }

    // throws Exception
    public static function createPlayer(resource : String) : Player {
        AllBinaryMediaManager.mostUsedTotal++;
        final logUtil : LogUtil = LogUtil.getInstance();
        if (Features.getInstance().isFeature(GameFeatureFactory.getInstance().SOUND)) {
            try {
                return new AndroidMediaPlayerWrapper(resource);
            } catch (e : haxe.Exception) {
                logUtil.put("Could not create AndroidMediaPlayerWrapper using NoPlayer at " + CommonLabels.getInstance().TOTAL_LABEL + AllBinaryMediaManager.mostUsedTotal, AllBinaryMediaManager.THIS, "createPlayer", e);
                return NoPlayer.NO_PLAYER;
            }
        } else {
            return NoPlayer.NO_PLAYER;
        }
    }

    // throws IOException, MediaException
    public static function createPlayerFromInputStream(stream : InputStream, type : String) : Player {
        throw new MediaException("No Input Stream Player");
    }

    // throws MediaException
    // synchronized
    public static function playTone(frequency : Int, time : Int, volume : Int) : Void {
        throw new MediaException("No Tone Player");
    }

    public static function isInitialized() : Bool {
        return true;
    }

}

