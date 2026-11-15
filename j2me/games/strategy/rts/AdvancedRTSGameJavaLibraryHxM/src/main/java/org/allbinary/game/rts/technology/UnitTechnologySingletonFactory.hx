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


class UnitTechnologySingletonFactory {
    private static final instance : UnitTechnologySingletonFactory = new UnitTechnologySingletonFactory();
    public static function getInstance() : UnitTechnologySingletonFactory {
        return UnitTechnologySingletonFactory.instance;
    }

    private var damage : Int = 0;
    private var health : Int = 0;
    private var reload : Int = 0;
    private var repair : Int = 0;
    private var speed : Int = 0;
    public function new() {
    }

    public function init() : Void {
        this.setDamage(0);
        this.setHealth(0);
        this.setReload(0);
        this.setRepair(0);
        this.setSpeed(0);
    }

    public function getDamage() : Int {
        return this.damage;
    }

    public function setDamage(damage : Int) : Void {
        this.damage = damage;
    }

    public function getHealth() : Int {
        return this.health;
    }

    public function setHealth(health : Int) : Void {
        this.health = health;
    }

    public function getReload() : Int {
        return this.reload;
    }

    public function setReload(reload : Int) : Void {
        this.reload = reload;
    }

    public function getRepair() : Int {
        return this.repair;
    }

    public function setRepair(repair : Int) : Void {
        this.repair = repair;
    }

    public function getSpeed() : Int {
        return this.speed;
    }

    public function setSpeed(speed : Int) : Void {
        this.speed = speed;
    }

}

