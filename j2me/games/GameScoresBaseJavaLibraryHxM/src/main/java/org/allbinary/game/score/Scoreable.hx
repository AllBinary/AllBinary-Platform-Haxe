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

import org.allbinary.logic.math.SmallIntegerSingletonFactory;

class Scoreable implements ScoreableInterface {
    public static var ID : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(3);
    private var points : Int;
    public function new(points : Int) {
        this.points = points;
    }

    public function addPoints(points : Int) : Void {
        this.points += points;
    }

    public function removePoints(points : Int) : Void {
        this.points -= points;
    }

    public function setPoints(points : Int) : Void {
        this.points = points;
    }

    public function getPoints() : Int {
        return this.points;
    }

}

