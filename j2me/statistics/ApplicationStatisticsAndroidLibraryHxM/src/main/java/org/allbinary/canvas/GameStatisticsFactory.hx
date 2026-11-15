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
package org.allbinary.canvas;

import org.allbinary.logic.string.StringMaker;

//ActualPlatform
class GameStatisticsFactory extends AndroidGameStatistics {
    private static final SINGLETON : AndroidGameStatistics = new GameStatisticsFactory();
    public static function getInstance() : AndroidGameStatistics {
        return GameStatisticsFactory.SINGLETON;
    }

    private var stringBuffer : StringMaker = new StringMaker();
    public override function add(string : String) : Void {
        if (this.stringBuffer.length() > 12000) {
            this.stringBuffer.delete(0, this.stringBuffer.length());
            this.stringBuffer.append("Old Stats Cleared");
        }
        this.stringBuffer.append(string);
    }

    public function toString() : String {
        return new StringMaker().append(super.toString()).append(this.stringBuffer.toString()).toString();
    }

    public function new() {
        super();
    }
}

