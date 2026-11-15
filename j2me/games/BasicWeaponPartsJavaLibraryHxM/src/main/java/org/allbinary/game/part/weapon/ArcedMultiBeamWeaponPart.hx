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
import org.allbinary.game.score.ScoreableInterface;
import org.allbinary.graphics.RelativeRelationship;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.math.AngleFactory;

class ArcedMultiBeamWeaponPart extends BasicWeaponPart {
    private final weaponLayerCircularStaticPool : WeaponLayerCircularPool;
    private final total : Int;
    public function new(animationInterface : Animation, sourceLayerInterface : AllBinaryLayer, weaponLayerCircularStaticPool : WeaponLayerCircularPool, total : Int, weaponProperties : WeaponProperties, scoreableInterface : ScoreableInterface, relativeRelationship : RelativeRelationship) {
        super(animationInterface, sourceLayerInterface, weaponProperties, scoreableInterface, relativeRelationship);
        this.total = total;
        this.weaponLayerCircularStaticPool = weaponLayerCircularStaticPool;
    }

    private final TOTAL_ANGLE : Int = Std.int(AngleFactory.getInstance().TOTAL_ANGLE);
    // throws Exception
    public override function processScore(allbinaryLayerManager : AllBinaryLayerManager, angle : Int, otherAngle : Int, weaponProperties : WeaponProperties, scoreableInterface : ScoreableInterface) : Void {
        final increment : Int = (Std.int((this.total - 1) / this.TOTAL_ANGLE));
        final minAngle : Int = (angle - ((increment * this.total) >> 1));
        var next : Int = 0;
        var weaponLayer : WeaponLayer = null;
        for (index in 0...this.total) {
            weaponLayer = this.weaponLayerCircularStaticPool.getInstanceWeaponLayer(this.getOwnerLayerInterface(), this.relativeRelationship.getX(), this.relativeRelationship.getY(), 0, (minAngle + increment), otherAngle, weaponProperties, scoreableInterface);
            allbinaryLayerManager.append(weaponLayer);
            next += increment;
        }
    }

}

