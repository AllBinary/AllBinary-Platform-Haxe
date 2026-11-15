// Generated Code Do Not Modify
package org.allbinary.game.score;

import org.allbinary.game.GameInfo;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.SoftwareInformation;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;

class BasicHighScoresFactory extends HighScoresBase {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final abeClientInformation : AbeClientInformationInterface;
    public function new(abeClientInformation : AbeClientInformationInterface, softwareInformation : SoftwareInformation) {
        super();
        this.abeClientInformation = abeClientInformation;
    }

    private final highScoresArray : haxe.ds.Vector<HighScores> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
    private final TOP : String = "Top";
    private final SCORES : String = "Scores";
    private final PERSONAL_HIGH_SCORES : String = "Personal Top Scores";
    private final FETCH : String = "fetchHighScores";
    public override function fetchHighScores(gameInfo : GameInfo, highScoresResultsListener : HighScoresResultsListener) : Void {
        this.logUtil.putF("Getting Local HighScores", this, this.FETCH);
        this.fetchHighScoresPreload(gameInfo, highScoresResultsListener, true);
    }

    public override function fetchHighScoresPreload(gameInfo : GameInfo, highScoresResultsListener : HighScoresResultsListener, preload : Bool) : Void {
        try {
            this.highScoresArray[0] = RecordStoreHighScores.getInstance(this.abeClientInformation, gameInfo, this.TOP, this.PERSONAL_HIGH_SCORES, this.SCORES, new ScoreComparator(true));
            highScoresResultsListener.setHighScoresArray(this.highScoresArray);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.FETCH, e);
        }
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

