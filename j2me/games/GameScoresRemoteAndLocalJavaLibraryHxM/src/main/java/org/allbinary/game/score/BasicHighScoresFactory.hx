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
package org.allbinary.game.score;

import org.allbinary.thread.ARunnable;
import org.allbinary.game.BasicHighScoresGameInfoFactory;
import org.allbinary.game.GameInfo;
import org.allbinary.game.GameType;
import org.allbinary.game.GameTypeFactory;
import org.allbinary.game.score.remote.RemoteHighScores;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.system.SoftwareInformation;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.thread.SecondaryThreadPool;

class BasicHighScoresFactory extends HighScoresBase {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final abeClientInformation : AbeClientInformationInterface;
    private final softwareInformation : SoftwareInformation;
    public function new(abeClientInformation : AbeClientInformationInterface, softwareInformation : SoftwareInformation) {
        super();
        this.abeClientInformation = abeClientInformation;
        this.softwareInformation = softwareInformation;
    }

    private final highScoresArray : haxe.ds.Vector<HighScores> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
    private final TOP : String = "Top";
    private final SCORES : String = "Scores";
    private final PERSONAL_HIGH_SCORES : String = "Personal Top Scores";
    private final WORLD_TOP_SCORES : String = "World Top Scores";
    private final FETCH : String = "fetchHighScores";
    public override function fetchHighScores(gameInfo : GameInfo, highScoresResultsListener : HighScoresResultsListener) : Void {
        this.logUtil.putF("Getting Remote/Local HighScores", this, this.FETCH);
        this.fetchHighScoresPreload(gameInfo, highScoresResultsListener, true);
    }

    public override function fetchHighScoresPreload(gameInfo : GameInfo, highScoresResultsListener : HighScoresResultsListener, preload : Bool) : Void {
        SecondaryThreadPool.getInstance().runTask(/* anonymous class body:
            public function run() : Void {
                final logUtil : LogUtil = LogUtil.getInstance();
                try {
                    logUtil.putF(this.commonStrings.START, this, FETCH);
                    highScoresArray[0] = RecordStoreHighScores.getInstance(abeClientInformation, gameInfo, TOP, PERSONAL_HIGH_SCORES, SCORES, new ScoreComparator(true));
                    final gameType : GameType = gameInfo.getGameType();
                    final gameTypeFactory : GameTypeFactory = GameTypeFactory.getInstance();
                    var gameInfo2 : GameInfo = gameInfo;
                    if (gameType == gameTypeFactory.SINGLE_PLAYER || gameType == gameTypeFactory.BOT) {
                        gameInfo2 = BasicHighScoresGameInfoFactory.getInstance().SINGLE_PLAYER_SERVER;
                    } else if (gameType == gameTypeFactory.MULTI_PLAYER) {
                        gameInfo2 = BasicHighScoresGameInfoFactory.getInstance().MULTI_PLAYER_SERVER;
                    }
                    highScoresArray[1] = RemoteHighScores.getInstancePreload(abeClientInformation, softwareInformation, gameInfo2, WORLD_TOP_SCORES, SCORES, BooleanFactory.getInstance().FALSE, preload);
                    logUtil.putF(this.commonStrings.END, this, FETCH);
                    LastFetchHighScoresFactory.getInstance().highScoresArray = highScoresArray;
                    highScoresResultsListener.setHighScoresArray(highScoresArray);
                } catch (e : haxe.Exception) {
                    logUtil.put(commonStrings.EXCEPTION, this, FETCH, e);
                }
            }

*/ new ARunnable());
    }

    public override function createHighScoresHelper() : HighScoresHelperBaseInterface {
        return new HighScoresHelper2();
    }

    public static function loaded(index2 : Int) : Bool {
        if (index2 >= 0) {
            return true;
        }
        return false;
    }

}

