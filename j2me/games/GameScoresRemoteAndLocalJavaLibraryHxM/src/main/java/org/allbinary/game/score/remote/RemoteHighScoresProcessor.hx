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
package org.allbinary.game.score.remote;

import org.allbinary.game.GameInfo;
import org.allbinary.game.GameInfoData;
import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.system.security.crypt.jcehelper.NoCrypt;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.HashtableUtil;

class RemoteHighScoresProcessor implements RemoteHighScoresProcessorInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final noCrypt : NoCrypt = new NoCrypt();
    public function new() {
    }

    // throws Exception
    // synchronized
    public function process(remoteHighScores : RemoteHighScores, abeClientInformation : AbeClientInformationInterface, gameInfo : GameInfo) : Void {
        this.logUtil.putF("Begin Remote HighScores Retrieval", this, this.commonStrings.PROCESS);
        final gameInfoData : GameInfoData = GameInfoData.getInstance();
        final hashtable : ABHashtable<Any, Any> = abeClientInformation.toHashtable();
        HashtableUtil.getInstance().putAll(gameInfo.toHashtable(), hashtable);
        hashtable.put(gameInfoData.SOFTWARE_INFORMATION, Std.string(remoteHighScores.getSoftwareInformation()));
        hashtable.put(remoteHighScores.ASCENDING, Std.string(remoteHighScores.getAscending()));
        final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        hashtable.put(displayInfoSingleton.ORIENTATION, BooleanFactory.getInstance().toStringb(displayInfoSingleton.isPortrait()));
        hashtable.put(RemoteHighScoresData.getInstance().GAME_CONFIGURATION, Std.string(GameConfigurationCentral.getInstance()));
        if (XmlRpcAbeClient.isOnline) {
            var resultHashtable : ABHashtable<Any, Any> = (cast new XmlRpcRemoteHighScoresClient(abeClientInformation, "highscoresservicessl.php", "HighScoresService.process").get(hashtable, this.noCrypt) : ABHashtable<Any, Any>);
            remoteHighScores.update(resultHashtable);
        }
    }

}

