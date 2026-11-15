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
package org.allbinary.game.combat.damage;


class ExplosionResources {
    private static final instance : ExplosionResources = new ExplosionResources();
    public static function getInstance() : ExplosionResources {
        return ExplosionResources.instance;
    }

    public function new() {
    }

    public final EXPLOSION_90_RESOURCE : String = "/explosion_sprite_90_by_90.png";
    public final EXPLOSION_60_RESOURCE : String = "/explosion_sprite_60_by_60.png";
    public final HALF_EXPLOSION_RESOURCE : String = "/explosion_sprite_30_by_30.png";
    public final THIRD_EXPLOSION_RESOURCE : String = "/explosion_sprite_15_by_15.png";
}

