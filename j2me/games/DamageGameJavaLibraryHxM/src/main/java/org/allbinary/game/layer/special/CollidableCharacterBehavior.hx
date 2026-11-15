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

import org.allbinary.game.collision.CollidableInterfaceCompositeInterface;
import org.allbinary.game.collision.CollisionType;
import org.allbinary.game.collision.CollisionTypeFactory;
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.game.layer.pickup.PickedUpLayerInterface;
import org.allbinary.logic.communication.log.ForcedLogUtil;

class CollidableCharacterBehavior extends CollidableDestroyableDamageableBehavior {
    public function new(collidable : Bool) {
        super(collidable);
    }

    // throws Exception
    public override function collide(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableCompositeLayer) : Void {
        final collisionTypeFactory : CollisionTypeFactory = CollisionTypeFactory.getInstance();
        final collisionType : CollisionType = collidableInterfaceCompositeInterface.getCollidableInferface().getCollisionTypeWith(ownerLayer);
        if (collisionType == collisionTypeFactory.PICKUP) {
            final collidableDestroyableDamageableLayer : CollidableDestroyableDamageableLayer = (cast ownerLayer : CollidableDestroyableDamageableLayer);
            collidableDestroyableDamageableLayer.getPickupBehavior().doPickupLayer((cast collidableInterfaceCompositeInterface : PickedUpLayerInterface));
        } else {
            super.collide(ownerLayer, collidableInterfaceCompositeInterface);
        }
    }

    // throws Exception
    public override function collideInterface(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableInterfaceCompositeInterface) : Void {
        ForcedLogUtil.log(this.commonStrings.NOT_IMPLEMENTED, this);
    }

}

