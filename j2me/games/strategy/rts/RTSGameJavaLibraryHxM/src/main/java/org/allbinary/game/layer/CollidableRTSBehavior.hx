/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2003 AllBinary 
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
package org.allbinary.game.layer;

import org.allbinary.game.collision.CollisionType;
import org.allbinary.game.collision.CollisionTypeFactory;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableBehavior;

class CollidableRTSBehavior extends CollidableDestroyableDamageableBehavior {
    public function new(collidable : Bool) {
        super(collidable);
    }

    public override function isCollision(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableCompositeLayer) : Bool {
        final collisionTypeFactory : CollisionTypeFactory = CollisionTypeFactory.getInstance();
        final collisionType : CollisionType = collidableInterfaceCompositeInterface.getCollidableInferface().getCollisionTypeWith(ownerLayer);
        if (collisionType == collisionTypeFactory.PICKUP) {
        } else if (collisionType == collisionTypeFactory.COLLISION) {
            return super.isCollision(ownerLayer, collidableInterfaceCompositeInterface);
        } else {
            if (collidableInterfaceCompositeInterface.getX2() <= ownerLayer.getXP() || collidableInterfaceCompositeInterface.getY2() <= ownerLayer.getYP() || collidableInterfaceCompositeInterface.getYP() >= ownerLayer.getY2() || collidableInterfaceCompositeInterface.getXP() >= ownerLayer.getX2()) {
                return false;
            } else {
                return true;
            }
        }
        return false;
    }

    // throws Exception
    public override function collide(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableCompositeLayer) : Void {
        final collisionTypeFactory : CollisionTypeFactory = CollisionTypeFactory.getInstance();
        final collisionType : CollisionType = collidableInterfaceCompositeInterface.getCollidableInferface().getCollisionTypeWith(ownerLayer);
        if (collisionType == collisionTypeFactory.PICKUP) {
        } else if (collisionType == collisionTypeFactory.COLLISION) {
            super.collide(ownerLayer, collidableInterfaceCompositeInterface);
        } else {
            this.collideNone(ownerLayer, collidableInterfaceCompositeInterface);
        }
    }

    // throws Exception
    public function collideNone(ownerLayer : CollidableCompositeLayer, collidableInterface : CollidableCompositeLayer) : Void {
    }

}

