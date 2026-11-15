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

import org.allbinary.game.GameInfo;
import org.allbinary.logic.communication.log.LogUtil;

class NoHighScoresFactory extends HighScoresBase {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : NoHighScoresFactory = new NoHighScoresFactory();
    public static function getInstance() : NoHighScoresFactory {
        return NoHighScoresFactory.instance;
    }

    public final NO_HIGH_SCORES : haxe.ds.Vector<HighScores> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    public function new() {
        super();
    }

    public override function fetchHighScores(gameInfo : GameInfo, highScoresResultsListener : HighScoresResultsListener) : Void {
        this.logUtil.putF("Getting No HighScores", this, "fetchHighScores");
        highScoresResultsListener.setHighScoresArray(this.NO_HIGH_SCORES);
    }

    public override function createHighScoresHelper() : HighScoresHelperBaseInterface {
        return new HighScoresHelperBase();
    }

}

