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

class HighScoresHelper2 extends HighScoresHelperBase {
    private final circularIndexUtil : CircularIndexUtil = CircularIndexUtil.createInstanceAt(0, 0);
    private var selectedHighScores : HighScores = NullHighScoresSingletonFactory.getInstance();
    public override function setSelectedHighScores(selectedHighScores : HighScores) : Void {
        this.selectedHighScores = selectedHighScores;
    }

    public override function getSelectedHighScores() : HighScores {
        return this.selectedHighScores;
    }

    public override function setHighScoresArray(highScoresArrayP : haxe.ds.Vector<HighScores>) : Void {
        super.setHighScoresArray(highScoresArrayP);
        this.circularIndexUtil.setSize(this.highScoresArrayP.length);
        this.selectHighScores();
    }

    public override function selectHighScores() : Void {
        if (this.highScoresArrayP.length == 0) {
            this.setSelectedHighScores(NullHighScoresSingletonFactory.getInstance());
            return;
        }
        this.circularIndexUtil.next();
        var highScores : HighScores = this.highScoresArrayP[this.circularIndexUtil.getIndex()];
        var index : Int = 0;
        while (highScores.getTotal() < 1 && index < this.highScoresArrayP.length) {
            highScores = this.highScoresArrayP[this.circularIndexUtil.next()];
            index++;
        }
        this.setSelectedHighScores(highScores);
    }

    public function new() {
        super();
    }
}

