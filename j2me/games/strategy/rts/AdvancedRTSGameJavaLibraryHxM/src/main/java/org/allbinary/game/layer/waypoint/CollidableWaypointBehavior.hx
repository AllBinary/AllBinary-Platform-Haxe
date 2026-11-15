/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.layer.waypoint;

import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.game.layer.CollidableRTSBehavior;
import org.allbinary.game.collision.CollidableInterfaceCompositeInterface;

class CollidableWaypointBehavior extends CollidableRTSBehavior {
    public function new(collidable : Bool) {
        super(collidable);
    }

    public override function isCollision(ownerLayer : CollidableCompositeLayer, collisionLayer : CollidableCompositeLayer) : Bool {
        return false;
    }

    // throws Exception
    public override function collide(ownerLayer : CollidableCompositeLayer, collisionLayer : CollidableCompositeLayer) : Void {
    }

    public override function isCollisionInterface(ownerLayer : CollidableCompositeLayer, collidableInterface : CollidableInterfaceCompositeInterface) : Bool {
        return false;
    }

    // throws Exception
    public override function collideInterface(ownerLayer : CollidableCompositeLayer, collidableInterface : CollidableInterfaceCompositeInterface) : Void {
    }

}

