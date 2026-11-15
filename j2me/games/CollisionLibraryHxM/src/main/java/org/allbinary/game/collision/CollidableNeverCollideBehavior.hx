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
package org.allbinary.game.collision;

import org.allbinary.game.layer.CollidableCompositeLayer;

class CollidableNeverCollideBehavior extends CollidableBaseBehavior {
    public function new(isCollidable : Bool) {
        super(isCollidable);
    }

    public override function isCollision(ownerLayer : CollidableCompositeLayer, allbinaryCollidableLayer : CollidableCompositeLayer) : Bool {
        return false;
    }

    // throws Exception
    public override function collide(ownerLayer : CollidableCompositeLayer, allbinaryCollidableLayer : CollidableCompositeLayer) : Void {
    }

    public override function collideInterface(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableInterfaceCompositeInterface) : Void {
    }

    public override function isCollisionInterface(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableInterfaceCompositeInterface) : Bool {
        return false;
    }

}

