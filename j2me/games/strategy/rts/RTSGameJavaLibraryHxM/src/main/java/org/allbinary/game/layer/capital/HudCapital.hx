/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2002 AllBinary 
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
package org.allbinary.game.layer.capital;

import org.allbinary.game.ag.layer.hud.basic.NumberStringHud;

class HudCapital extends Capital {
    private var capitalGraphic : NumberStringHud;
    public function new(moneyGraphic : NumberStringHud) {
        super();
        this.capitalGraphic = moneyGraphic;
    }

    public override function removeMoney(points : Int) : Void {
        super.removeMoney(points);
        this.capitalGraphic.reduce(points);
    }

    public override function getTotalMoney() : Int {
        return this.capitalGraphic.get();
    }

    public override function addMoney(points : Int) : Void {
        super.addMoney(points);
        this.capitalGraphic.add(points);
    }

}

