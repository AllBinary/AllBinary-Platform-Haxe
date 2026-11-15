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


class CollidableAlwaysPickupNeverCollideBehaviorFactory extends CollidableBaseBehaviorFactory {
    private static final instanceC : CollidableAlwaysPickupNeverCollideBehaviorFactory = new CollidableAlwaysPickupNeverCollideBehaviorFactory();
    public static function getInstance() : CollidableAlwaysPickupNeverCollideBehaviorFactory {
        return CollidableAlwaysPickupNeverCollideBehaviorFactory.instanceC;
    }

    private final instance : CollidableAlwaysPickupNeverCollideBehavior = new CollidableAlwaysPickupNeverCollideBehavior();
    public override function createBehavior() : CollidableBaseBehavior {
        return this.instance;
    }

    public function new() {
        super();
    }
}

