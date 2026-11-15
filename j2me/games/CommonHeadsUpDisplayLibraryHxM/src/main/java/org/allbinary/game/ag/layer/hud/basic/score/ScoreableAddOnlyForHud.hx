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
package org.allbinary.game.ag.layer.hud.basic.score;

import org.allbinary.game.score.Scoreable;

class ScoreableAddOnlyForHud extends Scoreable {
    private final scoreHudWidget : ScoreHudWidget;
    public function new(scoreVectorGraphic : ScoreHudWidget) {
        super(0);
        this.scoreHudWidget = scoreVectorGraphic;
        this.getScoreHudWidget().set(0);
    }

    public override function removePoints(points : Int) : Void {
    }

    public override function addPoints(points : Int) : Void {
        super.addPoints(points);
        this.getScoreHudWidget().add(points);
    }

    public function getScoreHudWidget() : ScoreHudWidget {
        return this.scoreHudWidget;
    }

}

