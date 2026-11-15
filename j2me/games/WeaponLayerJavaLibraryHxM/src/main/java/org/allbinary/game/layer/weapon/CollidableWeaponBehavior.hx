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
package org.allbinary.game.layer.weapon;

import org.allbinary.game.collision.CollidableHelperFactory;
import org.allbinary.game.collision.CollidableInterfaceCompositeInterface;
import org.allbinary.game.collision.CollisionHelper;
import org.allbinary.game.collision.CollisionType;
import org.allbinary.game.collision.CollisionTypeFactory;
import org.allbinary.game.combat.damage.DamageableInterface;
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableBehavior;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.NullUtil;

class CollidableWeaponBehavior extends CollidableDestroyableDamageableBehavior {
    private static var NULL_COLLIDABLE_WEAPON_BEHAVIOR : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getNullInstance() : CollidableWeaponBehavior {
        if (CollidableWeaponBehavior.NULL_COLLIDABLE_WEAPON_BEHAVIOR == NullUtil.getInstance().NULL_OBJECT) {
            CollidableWeaponBehavior.NULL_COLLIDABLE_WEAPON_BEHAVIOR = new CollidableWeaponBehavior(false);
        }
        return (cast CollidableWeaponBehavior.NULL_COLLIDABLE_WEAPON_BEHAVIOR : CollidableWeaponBehavior);
    }

    private var collided : Bool = false;
    public var collisionHelper : CollisionHelper;
    public function new(collidable : Bool) {
        super(collidable);
        this.setCollided(false);
        this.setCollidable(true);
        this.collisionHelper = CollidableHelperFactory.getInstance();
    }

    public function init(sourceLayerInterface : AllBinaryLayer) : Void {
        this.setCollided(false);
        this.collisionHelper.setOwnerLayerInterface(sourceLayerInterface);
    }

    public override function isCollision(ownerLayer : CollidableCompositeLayer, collisionLayer : CollidableCompositeLayer) : Bool {
        if (this.collisionHelper.isCollidable(collisionLayer)) {
            if (ownerLayer.getGroupInterface()[0] != collisionLayer.getGroupInterface()[0]) {
                return super.isCollision(ownerLayer, collisionLayer);
            }
        }
        return false;
    }

    // throws Exception
    public override function collide(ownerLayer : CollidableCompositeLayer, collisionLayer : CollidableCompositeLayer) : Void {
        super.collide(ownerLayer, collisionLayer);
        this.collided = true;
    }

    public override function isCollisionInterface(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableInterfaceCompositeInterface) : Bool {
        if (this.collisionHelper.isCollidable((cast collidableInterfaceCompositeInterface : CollidableCompositeLayer))) {
            final layerInterface : AllBinaryLayer = (cast collidableInterfaceCompositeInterface : AllBinaryLayer);
            if (ownerLayer.getGroupInterface()[0] != layerInterface.getGroupInterface()[0]) {
                if (this.layerCollisionUtil.isCollision(ownerLayer, layerInterface)) {
                    return true;
                }
            }
        }
        return false;
    }

    // throws Exception
    public override function collideInterface(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableInterfaceCompositeInterface) : Void {
        final ownerDamageableInterface : DamageableInterface = (cast ownerLayer : DamageableInterface);
        final damageableInterface : DamageableInterface = (cast collidableInterfaceCompositeInterface : DamageableInterface);
        this.damageUtil.process(ownerDamageableInterface, damageableInterface);
        this.collided = true;
    }

    public override function getCollisionTypeWith(layerInterface : AllBinaryLayer) : CollisionType {
        return CollisionTypeFactory.getInstance().COLLISION;
    }

    public function isCollided() : Bool {
        return this.collided;
    }

    private function setCollided(collided : Bool) : Void {
        this.collided = collided;
    }

}

