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

import org.allbinary.graphics.paint.Paintable;

class DamageFloaters extends Paintable {
    private static final SINGLETON : DamageFloaters = new DamageFloaters();
    public static function getInstance() : DamageFloaters {
        return DamageFloaters.SINGLETON;
    }

    public function add(damage : Int) : Void {
    }

    public function new() {
        super();
    }
}

