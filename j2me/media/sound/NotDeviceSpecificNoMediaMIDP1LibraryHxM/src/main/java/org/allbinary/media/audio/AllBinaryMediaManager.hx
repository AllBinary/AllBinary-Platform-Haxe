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

//import java.io.InputStream;
//import javax.microedition.media.Player;
import org.allbinary.TsUtil;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

//NotDeviceSpecificNoMediaMIDP1Library
class AllBinaryMediaManager {
    private static final THIS : String = "AllBinaryMediaManagerNoMediaMIDP1";
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

    public static function createPlayerFromInputStream(stream : InputStream, type : String) : Player {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonString : CommonStrings = CommonStrings.getInstance();
        logUtil.putF(commonString.START, AllBinaryMediaManager.THIS, "creatPlayer(InputStream)");
        return (cast NoPlayer.NO_PLAYER : Player);
    }

    public static function createPlayer(locator : String) : Player {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonString : CommonStrings = CommonStrings.getInstance();
        logUtil.putF(commonString.START, AllBinaryMediaManager.THIS, "creatPlayer(locator)");
        return (cast NoPlayer.NO_PLAYER : Player);
    }

    // synchronized
    public static function playTone(frequency : Int, time : Int, volume : Int) : Void {
    }

    public static function getSupportedContentTypes(protocol : String) : haxe.ds.Vector<String> {
        return StringUtil.getInstance().getArrayInstance();
    }

    public static function getSupportedProtocols(content_type : String) : haxe.ds.Vector<String> {
        return StringUtil.getInstance().getArrayInstance();
    }

}

