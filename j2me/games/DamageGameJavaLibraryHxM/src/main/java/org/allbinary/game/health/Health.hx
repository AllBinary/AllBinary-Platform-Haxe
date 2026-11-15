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
package org.allbinary.game.health;

import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class Health implements HealthInterface {
    public static final NULL_HEALTH : Health = new Health(0);
    public static final NAME : String = "Health Resource";
    private var health : Int = 0;
    private var maxHealth : Int = 0;
    private var healthListenerInterface : HealthListenerInterface = NullHealthListener.NULL_HEALTH_LISTENER;
    public function new(maxHealth : Int) {
        this.setMaxHealth(maxHealth);
        this.setHealth(maxHealth);
    }

    public function heal(ahealth : Int) : Void {
        var newHealth : Int = this.getHealth() + ahealth;
        if (newHealth > this.getMaxHealth()) {
            this.setHealth(this.getMaxHealth());
        } else {
            this.setHealth(newHealth);
        }
    }

    public function healMax() : Void {
        this.setHealth(this.getMaxHealth());
    }

    public function isDamaged() : Bool {
        if (this.getHealth() != this.getMaxHealth()) {
            return true;
        } else {
            return false;
        }
    }

    public function damage(ahealth : Int) : Void {
        if (ahealth < 0) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("******* Trying to heal when damaging. Damage: ");
            stringBuffer.appendint(ahealth);
            stringBuffer.append(CommonSeps.getInstance().SPACE);
            stringBuffer.append(Std.string(this));
            ForcedLogUtil.log(Std.string(stringBuffer), this);
            return;
        }
        var health : Int = this.getHealth() - ahealth;
        this.setHealth(health);
    }

    public function isAlive() : Bool {
        if (this.getHealth() <= 0) {
            return false;
        } else {
            return true;
        }
    }

    public function getMaxHealth() : Int {
        return this.maxHealth;
    }

    public function setMaxHealth(maxHealth : Int) : Void {
        this.maxHealth = maxHealth;
    }

    public function setHealth(health : Int) : Void {
        if (health > this.getMaxHealth()) {
            this.health = this.getMaxHealth();
        } else if (health < 0) {
            this.health = 0;
        } else {
            this.health = health;
        }
        if (this.healthListenerInterface != null) {
            this.healthListenerInterface.onHealthChange();
        }
    }

    public function getHealth() : Int {
        return this.health;
    }

    public function addListener(healthGraphic : HealthListenerInterface) : Void {
        this.healthListenerInterface = healthGraphic;
    }

    private static final HEALTH_LABEL : String = "Health: ";
    private static final MAX_HEALTH_LABEL : String = " Max: ";
    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(Health.HEALTH_LABEL);
        stringBuffer.appendint(this.health);
        stringBuffer.append(Health.MAX_HEALTH_LABEL);
        stringBuffer.appendint(this.maxHealth);
        return Std.string(stringBuffer);
    }

}

