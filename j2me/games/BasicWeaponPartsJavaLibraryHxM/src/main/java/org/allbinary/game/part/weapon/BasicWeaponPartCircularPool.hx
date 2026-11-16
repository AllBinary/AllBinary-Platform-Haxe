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

import org.allbinary.game.combat.weapon.WeaponProperties;
import org.allbinary.game.score.ScoreableInterface;
import org.allbinary.graphics.RelativeRelationship;
import org.allbinary.layer.AllBinaryLayer;

class BasicWeaponPartCircularPool {
    public static final NULL_BASIC_WEAPON_PART_CIRCULAR_POOL : BasicWeaponPartCircularPool = new BasicWeaponPartCircularPool();
    private var basicWeaponPart : BasicWeaponPart = BasicWeaponPart.NULL_BASIC_WEAPON_PART;
    // throws Exception
    public function init(basicWeaponPartFactoryInterface : BasicWeaponPartFactoryInterface) : Void {
        this.basicWeaponPart = basicWeaponPartFactoryInterface.getInstanceFor();
    }

    // throws Exception
    // synchronized
    public function getInstanceFor(sourceLayerInterface : AllBinaryLayer, weaponProperties : WeaponProperties, scoreableInterface : ScoreableInterface, relativeRelationship : RelativeRelationship) : BasicWeaponPart {
        this.basicWeaponPart.init(sourceLayerInterface, weaponProperties, scoreableInterface, relativeRelationship);
        return this.basicWeaponPart;
    }

    public function new() {
    }
}

