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
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.NamedInterface;

interface CollidableInterface extends NamedInterface {
    // throws Exception
    function isCollidable(ownerLayer : CollidableCompositeLayer) : Bool;

    // throws Exception
    function isCollision(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableCompositeLayer) : Bool;

    // throws Exception
    function collide(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableCompositeLayer) : Void;

    function getCollisionTypeWith(layerInterface : AllBinaryLayer) : CollisionType;

}

