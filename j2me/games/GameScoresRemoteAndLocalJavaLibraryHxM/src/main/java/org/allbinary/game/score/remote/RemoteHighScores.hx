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

import jre.util.Enumeration;
import org.allbinary.util.BasicArrayList;
import org.allbinary.game.GameInfo;
import org.allbinary.game.score.HighScore;
import org.allbinary.game.score.HighScores;
import org.allbinary.game.score.RemoteErrorHighScoresSingletonFactory;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.SoftwareInformation;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.EnumerationUtil;

class RemoteHighScores extends HighScores {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final enumerationUtil : EnumerationUtil = EnumerationUtil.getInstance();
    private static final hashTable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    private final abeClientInformation : AbeClientInformationInterface;
    private final softwareInformation : SoftwareInformation;
    private var ascending : Null<Bool> = null;
    public final ASCENDING : String = "ASCENDING";
    public function new(abeClientInformation : AbeClientInformationInterface, softwareInformation : SoftwareInformation, gameInfo : GameInfo, heading : String, columnTwoHeading : String, ascending : Null<Bool>, preload : Bool) {
        super(Std.string(gameInfo), heading, columnTwoHeading);
        this.abeClientInformation = abeClientInformation;
        this.softwareInformation = softwareInformation;
        this.setAscending(ascending);
        if (preload) {
            RemoteHighScoresProcessorFactory.getInstance().process(this, this.abeClientInformation, gameInfo);
        }
    }

    // synchronized
    public static function getInstance(abeClientInformation : AbeClientInformationInterface, softwareInformation : SoftwareInformation, gameInfo : GameInfo, heading : String, columnTwoHeading : String, isAscending : Null<Bool>) : HighScores {
        return RemoteHighScores.getInstancePreload(abeClientInformation, softwareInformation, gameInfo, heading, columnTwoHeading, isAscending, true);
    }

    // synchronized
    public static function getInstancePreload(abeClientInformation : AbeClientInformationInterface, softwareInformation : SoftwareInformation, gameInfo : GameInfo, heading : String, columnTwoHeading : String, isAscending : Null<Bool>, preload : Bool) : HighScores {
        final logUtil : LogUtil = LogUtil.getInstance();
        try {
            var highScores : HighScores = (cast RemoteHighScores.hashTable.get(gameInfo) : HighScores);
            if (highScores == null) {
                highScores = new RemoteHighScores(abeClientInformation, softwareInformation, gameInfo, heading, columnTwoHeading, isAscending, preload);
                RemoteHighScores.hashTable.put(gameInfo, highScores);
            }
            return highScores;
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            logUtil.put(commonStrings.EXCEPTION, RemoteErrorHighScoresSingletonFactory.getInstance(), commonStrings.GET_INSTANCE, e);
            return RemoteErrorHighScoresSingletonFactory.getInstance();
        }
    }

    public function addHighScore(newHighScore : HighScore) : Void {
        RemoteHighScoresSubmissionProcessorFactory.getInstance().process(this, this.abeClientInformation, newHighScore);
    }

    public function update(hashtable : ABHashtable<Any, Any>) : Void {
        this.getList().clear();
        final vector : BasicArrayList = (cast hashtable.get((cast RemoteHighScoresData.getInstance().HIGH_SCORES : Any)) : BasicArrayList);
        if (vector != null) {
            final size : Int = vector.size();
            for (index in 0...size) {
                final highScoreVector : BasicArrayList = (cast vector.get(index) : BasicArrayList);
                final displayName : String = (cast highScoreVector.get(0) : String);
                final score : String = (cast highScoreVector.get(1) : String);
                final longScore : haxe.Int64 = haxe.Int64.parseString(score);
                final highScore : HighScore = new HighScore(-1, displayName, null, longScore);
                this.getList().add(highScore);
            }
        } else {
            final NEXT_ELEMENT : String = Std.string(new StringMaker().append(CommonLabels.getInstance().NEXT).append("Element: "));
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            final enumeration : Enumeration<Dynamic> = hashtable.elements();
            var nextElement : Any = null;
            while (this.enumerationUtil.hasMoreElements(enumeration)) {
                nextElement = this.enumerationUtil.nextElement(enumeration);
                this.logUtil.putF(NEXT_ELEMENT + nextElement, this, commonStrings.PROCESS);
            }
        }
    }

    private function setAscending(ascending : Null<Bool>) : Void {
        this.ascending = ascending;
    }

    public function getAscending() : Null<Bool> {
        return this.ascending;
    }

    public function getSoftwareInformation() : SoftwareInformation {
        return this.softwareInformation;
    }

}

