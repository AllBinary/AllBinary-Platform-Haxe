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
package org.allbinary.game.layer.special;

import org.allbinary.game.collision.CollidableBaseBehavior;
import org.allbinary.game.collision.CollidableInterfaceCompositeInterface;
import org.allbinary.game.combat.damage.DamageUtil;
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.logic.communication.log.ForcedLogUtil;

class CollidableDestroyableDamageableBehavior extends CollidableBaseBehavior {
    public final damageUtil : DamageUtil = DamageUtil.getInstance();
    public function new(collidable : Bool) {
        super(collidable);
    }

    public override function isCollision(ownerLayer : CollidableCompositeLayer, collisionLayer : CollidableCompositeLayer) : Bool {
        if (ownerLayer.getGroupInterface()[0] != collisionLayer.getGroupInterface()[0]) {
            return super.isCollision(ownerLayer, collisionLayer);
        }
        return false;
    }

    // throws Exception
    public override function collide(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableCompositeLayer) : Void {
        final ownerCollidableDestroyableDamageableLayer : CollidableDestroyableDamageableLayer = (cast ownerLayer : CollidableDestroyableDamageableLayer);
        final collidableDestroyableDamageableLayer : CollidableDestroyableDamageableLayer = (cast collidableInterfaceCompositeInterface : CollidableDestroyableDamageableLayer);
        ownerCollidableDestroyableDamageableLayer.damage(collidableDestroyableDamageableLayer.getDamage(0), 0);
    }

    public override function isCollisionInterface(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableInterfaceCompositeInterface) : Bool {
        ForcedLogUtil.log("No Longer Used", this);
        return false;
    }

    // throws Exception
    public override function collideInterface(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableInterfaceCompositeInterface) : Void {
        ForcedLogUtil.log("No Longer Used", this);
    }

}

