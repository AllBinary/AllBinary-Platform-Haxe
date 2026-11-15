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
package org.allbinary.game.part.weapon;

import org.allbinary.animation.Animation;
import org.allbinary.game.combat.weapon.WeaponProperties;
import org.allbinary.game.layer.weapon.WeaponLayer;
import org.allbinary.game.layer.weapon.WeaponLayerCircularPool;
import org.allbinary.game.score.NoScoreable;
import org.allbinary.game.score.ScoreableInterface;
import org.allbinary.graphics.RelativeRelationship;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.math.NoDecimalTrigTable;

class StraightMultiProjectileWeaponPart extends BasicWeaponPart {
    public static function createStraightMultiProjectileWeaponPart(animationInterface : Animation, weaponLayerCircularStaticPool : WeaponLayerCircularPool) : StraightMultiProjectileWeaponPart {
        return new StraightMultiProjectileWeaponPart(animationInterface, AllBinaryLayer.NULL_ALLBINARY_LAYER, weaponLayerCircularStaticPool, 2, WeaponProperties.NULL_WEAPON_PROPERTIES, NoScoreable.getInstance(), RelativeRelationship.NULL_RELATIVE_RELATIONSHIP);
    }

    private final weaponLayerCircularStaticPool : WeaponLayerCircularPool;
    private final total : Int;
    public function new(animationInterface : Animation, sourceLayerInterface : AllBinaryLayer, weaponLayerCircularStaticPool : WeaponLayerCircularPool, total : Int, weaponProperties : WeaponProperties, scoreableInterface : ScoreableInterface, relativeRelationship : RelativeRelationship) {
        super(animationInterface, sourceLayerInterface, weaponProperties, scoreableInterface, relativeRelationship);
        this.total = total;
        this.weaponLayerCircularStaticPool = weaponLayerCircularStaticPool;
    }

    private final noDecimalTrigTable : NoDecimalTrigTable = NoDecimalTrigTable.getInstance();
    // throws Exception
    public override function processScore(allbinaryLayerManager : AllBinaryLayerManager, angle : Int, otherAngle : Int, weaponProperties : WeaponProperties, scoreableInterface : ScoreableInterface) : Void {
        final sourceLayerInterface : AllBinaryLayer = this.getOwnerLayerInterface();
        final reducedWidth : Int = (sourceLayerInterface.getWidth() * 8 / 10);
        final halfWidth : Int = (reducedWidth >> 1);
        final x : Int = this.relativeRelationship.getX();
        final y : Int = this.relativeRelationship.getY();
        var sine : haxe.Int64 = haxe.Int64.ofInt(0);
        var beamX : Int = 0;
        var cosine : haxe.Int64 = haxe.Int64.ofInt(0);
        var beamY : Int = 0;
        var weaponLayer : WeaponLayer = null;
        final increment : Int = Std.int(reducedWidth / (this.total - 1));
        var next : Int = -halfWidth;
        for (index in 0...this.total) {
            sine = haxe.Int64.ofInt((next * this.noDecimalTrigTable.sin(angle)));
            beamX = Std.int((sine / this.noDecimalTrigTable.SCALE));
            cosine = haxe.Int64.ofInt((next * this.noDecimalTrigTable.cos(angle)));
            beamY = -Std.int((cosine / this.noDecimalTrigTable.SCALE));
            weaponLayer = this.weaponLayerCircularStaticPool.getInstanceWeaponLayer(sourceLayerInterface, x + beamX, y + beamY, 0, angle, otherAngle, weaponProperties, scoreableInterface);
            allbinaryLayerManager.append(weaponLayer);
            next += increment;
        }
    }

}

