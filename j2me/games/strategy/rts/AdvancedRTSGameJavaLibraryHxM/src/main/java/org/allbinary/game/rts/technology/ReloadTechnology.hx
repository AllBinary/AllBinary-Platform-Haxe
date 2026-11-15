/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.rts.technology;

import org.allbinary.game.layer.RTSInterface;

class ReloadTechnology implements RTSInterface {
    private var level : Int = 0;
    private var maxLevel : Int;
    public function new(maxLevel : Int) {
        this.maxLevel = maxLevel;
    }

    public function isCompleted() : Bool {
        return false;
    }

    public function getPercentComplete() : Int {
        return 0;
    }

    public function getLevel() : Int {
        return this.level;
    }

    public function getMaxLevel() : Int {
        return this.maxLevel;
    }

    public function getCost() : Int {
        return 0;
    }

    public function downgrade() : Void {
    }

    public function getDowngradeCost() : Int {
        return 0;
    }

    public function isDowngradeable() : Bool {
        return false;
    }

    public function getUpgradeCost() : Int {
        return (this.getLevel() * this.getLevel()) * 1000;
    }

    public function isUpgradeable() : Bool {
        if (this.getLevel() < this.getMaxLevel()) {
            return true;
        } else {
            return false;
        }
    }

    public function upgrade() : Void {
        this.level++;
        var unitTechnologySingletonFactory : UnitTechnologySingletonFactory = UnitTechnologySingletonFactory.getInstance();
        unitTechnologySingletonFactory.setReload(unitTechnologySingletonFactory.getReload() + (this.getLevel() * 10));
    }

    public function isSelfUpgradeable() : Bool {
        return false;
    }

}

