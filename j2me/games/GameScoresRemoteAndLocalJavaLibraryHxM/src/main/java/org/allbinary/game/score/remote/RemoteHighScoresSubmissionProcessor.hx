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

import org.allbinary.game.GameInfoData;
import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.game.score.HighScore;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.system.security.crypt.jcehelper.NoCrypt;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.HashtableUtil;

class RemoteHighScoresSubmissionProcessor implements RemoteHighScoresSubmissionProcessorInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final noCrypt : NoCrypt = new NoCrypt();
    public function new() {
    }

    // synchronized
    public function process(remoteHighScores : RemoteHighScores, abeClientInformation : AbeClientInformationInterface, highScore : HighScore) : Void {
        try {
            this.logUtil.putF("Begin Remote HighScores Submission", this, this.commonStrings.PROCESS);
            final gameInfoData : GameInfoData = GameInfoData.getInstance();
            final hashtable : ABHashtable<Any, Any> = abeClientInformation.toHashtable();
            HashtableUtil.getInstance().putAll(highScore.getGameInfo().toHashtable(), hashtable);
            hashtable.put(RemoteHighScoresData.getInstance().CUSTOMER_USER_NAME, "None");
            hashtable.put(RemoteHighScoresData.getInstance().DISPLAY_NAME, highScore.getName());
            hashtable.put(gameInfoData.SOFTWARE_INFORMATION, remoteHighScores.getSoftwareInformation().toString());
            hashtable.put(remoteHighScores.ASCENDING, remoteHighScores.getAscending().toString());
            final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
            hashtable.put(displayInfoSingleton.ORIENTATION, BooleanFactory.getInstance().toStringb(displayInfoSingleton.isPortrait()));
            hashtable.put(RemoteHighScoresData.getInstance().GAME_CONFIGURATION, GameConfigurationCentral.getInstance().toString());
            hashtable.put(RemoteHighScoresData.getInstance().SCORE, Std.string(highScore.getScore()));
            if (XmlRpcAbeClient.isOnline) {
                final resultHashtable : ABHashtable<Any, Any> = (cast new XmlRpcRemoteHighScoresClient(abeClientInformation, "highscoresubmissionservicessl.php", "HighScoreSubmissionService.process").get(hashtable, this.noCrypt) : ABHashtable<Any, Any>);
                remoteHighScores.update(resultHashtable);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e);
        }
    }

}

