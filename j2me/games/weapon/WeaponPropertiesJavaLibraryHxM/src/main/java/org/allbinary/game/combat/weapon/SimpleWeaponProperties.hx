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
package org.allbinary.game.combat.weapon;


class SimpleWeaponProperties {
    private var damage : Int = 0;
    private var dissipation : Int = 0;
    private var range : Int = 0;
    public function set(simpleWeaponProperties : SimpleWeaponProperties) : Void {
        this.setDamage(simpleWeaponProperties.getDamage());
        this.setDissipation(simpleWeaponProperties.getDissipation());
        this.setRange(simpleWeaponProperties.getRange());
    }

    public function setDamage(damage : Int) : Void {
        this.damage = damage;
    }

    public function getDamage() : Int {
        return this.damage;
    }

    public function setDissipation(dissipation : Int) : Void {
        this.dissipation = dissipation;
    }

    public function getDissipation() : Int {
        return this.dissipation;
    }

    public function getRange() : Int {
        return this.range;
    }

    public function setRange(range : Int) : Void {
        this.range = range;
    }

    public function new() {
    }
}

