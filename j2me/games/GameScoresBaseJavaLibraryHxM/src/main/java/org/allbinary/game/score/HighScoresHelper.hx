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

import org.allbinary.util.CircularIndexUtil;

class HighScoresHelper extends HighScoresHelperBase {
    private final circularIndexUtil : CircularIndexUtil = CircularIndexUtil.createInstanceAt(0, 0);
    public override function setHighScoresArray(highScoresArrayP : haxe.ds.Vector<HighScores>) : Void {
        super.setHighScoresArray(highScoresArrayP);
        this.circularIndexUtil.setSize(this.highScoresArrayP.length);
    }

    public var lastIndex : Int = -1;
    public override function getNextHighScores() : HighScores {
        var highScores : HighScores = this.highScoresArrayP[this.circularIndexUtil.getIndex()];
        var index : Int = 0;
        while ((highScores.getTotal() < 1 || this.lastIndex == this.circularIndexUtil.getIndex()) && index < this.highScoresArrayP.length) {
            this.circularIndexUtil.next();
            highScores = this.highScoresArrayP[this.circularIndexUtil.getIndex()];
            index++;
        }
        this.lastIndex = this.circularIndexUtil.getIndex();
        return highScores;
    }

    public override function isAnyHighScores() : Bool {
        if (this.highScoresArrayP.length < 1) {
            return false;
        }
        var anyScores : Bool = false;
        var highScores : HighScores = null;
        {
            var index : Int = this.highScoresArrayP.length - 1;
            while (index >= 0) {
            highScores = this.highScoresArrayP[index];
            if (highScores.getTotal() > 0) {
                anyScores = true;
            }
                index--;
            }
        }
        return anyScores;
    }

    public function new() {
        super();
    }
}

