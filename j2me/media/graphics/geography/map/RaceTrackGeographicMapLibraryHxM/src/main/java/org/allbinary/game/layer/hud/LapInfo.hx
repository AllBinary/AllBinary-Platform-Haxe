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
package org.allbinary.game.layer.hud;

import org.allbinary.logic.string.StringMaker;

class LapInfo {
    public static var NULL_LAP_INFO : LapInfo = new LapInfo(-1);
    private var numberOfLaps : Int;
    private var totalLaps : Int;
    public function new(totalLaps : Int) {
        this.totalLaps = totalLaps;
        this.numberOfLaps = 1;
    }

    public function add() : Void {
        this.numberOfLaps++;
    }

    public function getCurrentLap() : Int {
        return this.numberOfLaps;
    }

    public function getTotalLaps() : Int {
        return this.totalLaps;
    }

    public function isDone() : Bool {
        if (this.numberOfLaps >= this.totalLaps) {
            return true;
        }
        return false;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("isDone: ");
        stringBuffer.appendboolean(this.isDone());
        stringBuffer.append(" CurrentLap: ");
        stringBuffer.appendint(this.getCurrentLap());
        stringBuffer.append(" Total Laps: ");
        stringBuffer.appendint(this.getTotalLaps());
        return stringBuffer.toString();
    }

}

