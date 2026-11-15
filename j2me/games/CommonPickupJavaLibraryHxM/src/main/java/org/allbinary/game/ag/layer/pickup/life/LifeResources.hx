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
package org.allbinary.game.ag.layer.pickup.life;


class LifeResources {
    private static final SINGLETON : LifeResources = new LifeResources();
    public var RESOURCE : String = "life_drop_20_by_20.png";
    public function new() {
    }

    public static function getInstance() : LifeResources {
        return LifeResources.SINGLETON;
    }

}

