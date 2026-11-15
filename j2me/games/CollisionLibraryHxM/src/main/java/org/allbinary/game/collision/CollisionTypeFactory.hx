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


class CollisionTypeFactory {
    private static var SINGLETON : CollisionTypeFactory = new CollisionTypeFactory();
    public var NONE : CollisionType = new CollisionType("None");
    public var DAMAGE : CollisionType = new CollisionType("Damage");
    public var PICKUP : CollisionType = new CollisionType("Pickup");
    public var COLLISION : CollisionType = new CollisionType("Collision");
    public static function getInstance() : CollisionTypeFactory {
        return CollisionTypeFactory.SINGLETON;
    }

    public function new() {
    }
}

