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

//import javax.microedition.media.Manager;
//import javax.microedition.media.MediaException;
//import javax.microedition.media.Player;
import org.allbinary.TsUtil;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

//MediaMIDP2ForHTMLJavaLibrary
class AllBinaryMediaManager {
    private static final THIS : String = "AllBinaryMediaManagerHTML5";
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

    // throws Exception
    public static function createPlayer(resource : String) : Player {
        if (Features.getInstance().isFeature(GameFeatureFactory.getInstance().SOUND)) {
            if (TsUtil.getInstance().compareTo(resource, Manager.TONE_DEVICE_LOCATOR) == 0) {
                return Manager.createPlayer(resource);
            } else {
                return Manager.createPlayer(resource.substring(0, resource.length - 4));
            }
        } else {
            return NoPlayer.NO_PLAYER;
        }
    }

    // throws MediaException
    // synchronized
    public static function playTone(frequency : Int, time : Int, volume : Int) : Void {
        if (Features.getInstance().isFeature(GameFeatureFactory.getInstance().SOUND)) {
            Manager.playTone(frequency, time, volume);
        }
    }

}

