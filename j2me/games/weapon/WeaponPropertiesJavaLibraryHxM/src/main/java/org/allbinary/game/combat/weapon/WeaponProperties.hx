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

import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.math.BasicDecimal;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class WeaponProperties extends SimpleWeaponProperties {
    public static final NULL_WEAPON_PROPERTIES : WeaponProperties = new WeaponProperties(haxe.Int64.ofInt(0), haxe.Int64.ofInt(0), haxe.Int64.ofInt(0), 0, 0);
    private var reloadTime : haxe.Int64 = haxe.Int64.ofInt(0);
    private var targetingTime : haxe.Int64 = haxe.Int64.ofInt(0);
    private var speed : BasicDecimal = BasicDecimal.ZERO_BIGDECIMAL;
    private static var messageSent : Bool = false;
    private final MAX : haxe.Int64 = haxe.Int64.ofInt(10240);
    private final ZERO : Int = 0;
    public function new(reloadTime : haxe.Int64, targetingTime : haxe.Int64, speed : haxe.Int64, damage : Int, dissipation : Int) {
        super();
        if (speed < this.MAX && speed != haxe.Int64.ofInt(0) && !WeaponProperties.messageSent) {
            final MESSAGE : String = "Danger Danger Danger: Speed probably to slow if using 1 degree calculations as velocity for a single axis could be below 1024: ";
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            PreLogUtil.put(Std.string(new StringMaker().append(MESSAGE).appendlong(speed)), this, commonStrings.CONSTRUCTOR);
            WeaponProperties.messageSent = true;
        }
        this.setReloadTime(reloadTime);
        this.setTargetingTime(targetingTime);
        this.setDamage(damage);
        this.setDissipation(dissipation);
        this.setSpeed(new BasicDecimal(speed));
        if (dissipation != this.ZERO) {
            final unscaledDamage : haxe.Int64 = this.speed.getUnscaled() * damage;
            final scaledDissipation : Int = dissipation * this.speed.getScaledFactorValue();
            final value : haxe.Int64 = (unscaledDamage / haxe.Int64.ofInt(scaledDissipation));
            this.setRange(Std.int(haxe.Int64.toInt((value * 9)) / 10));
        }
    }

    private function setReloadTime(reloadTime : haxe.Int64) : Void {
        this.reloadTime = reloadTime;
    }

    public function getReloadTime() : haxe.Int64 {
        return this.reloadTime;
    }

    private function setTargetingTime(targetingTime : haxe.Int64) : Void {
        this.targetingTime = targetingTime;
    }

    public function getTargetingTime() : haxe.Int64 {
        return this.targetingTime;
    }

    public function getSpeed() : BasicDecimal {
        return this.speed;
    }

    public function setSpeed(speed : BasicDecimal) : Void {
        this.speed = speed;
    }

    public function getDamageI(range : Int) : Int {
        return this.getDamage() - ((this.getDissipation() * range) / this.speed.getScaled());
    }

    private static final DAMAGE : String = "Damage: ";
    private static final RANGE : String = "Range: ";
    private static final RELOAD : String = "Reload: ";
    public function toStringArray() : haxe.ds.Vector<String> {
        var index : Int = 0;
        final stringArray : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy([for (index in 0...3) null]);
        final stringBuffer : StringMaker = new StringMaker();
        stringArray[index++] = Std.string(stringBuffer.append(WeaponProperties.DAMAGE).appendint(Std.int(this.getDamage())));
        stringBuffer.delete(0, stringBuffer.length());
        stringArray[index++] = Std.string(stringBuffer.append(WeaponProperties.RANGE).appendint(Std.int(this.getRange())));
        stringBuffer.delete(0, stringBuffer.length());
        stringArray[index++] = Std.string(stringBuffer.append(WeaponProperties.RELOAD).appendlong(this.getReloadTime()));
        return stringArray;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(WeaponProperties.DAMAGE).appendint(Std.int(this.getDamage()));
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(WeaponProperties.RANGE).appendint(Std.int(this.getRange()));
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(WeaponProperties.RELOAD).appendlong(this.getReloadTime());
        return Std.string(stringBuffer);
    }

}

