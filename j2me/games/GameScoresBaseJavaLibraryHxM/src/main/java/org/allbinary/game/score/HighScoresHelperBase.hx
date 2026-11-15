/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

class HighScoresHelperBase implements HighScoresHelperBaseInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public var highScoresArrayP : haxe.ds.Vector<HighScores> = LastFetchHighScoresFactory.getInstance().highScoresArray;
    public function setHighScoresArray(highScoresArrayP : haxe.ds.Vector<HighScores>) : Void {
        if (highScoresArrayP != null) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF(Std.string(new StringMaker().append(commonStrings.START).appendint(highScoresArrayP.length)), this, "setHighScoresArray");
        } else {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF(commonStrings.START, this, "setHighScoresArray");
        }
        this.highScoresArrayP = highScoresArrayP;
    }

    public function getNextHighScores() : HighScores {
        return NullHighScoresSingletonFactory.getInstance();
    }

    public function isAnyHighScores() : Bool {
        throw new jre.lang.JavaException();
    }

    public function setSelectedHighScores(selectedHighScores : HighScores) : Void {
    }

    public function getSelectedHighScores() : HighScores {
        return NullHighScoresSingletonFactory.getInstance();
    }

    public function getHighScoresArray() : haxe.ds.Vector<HighScores> {
        return this.highScoresArrayP;
    }

    public function selectHighScores() : Void {
    }

    public function new() {
    }
}

