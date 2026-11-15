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


class DamageableBaseBehavior implements DamageableInterface {
    private static final instance : DamageableBaseBehavior = new DamageableBaseBehavior();
    public static function getInstance() : DamageableBaseBehavior {
        return DamageableBaseBehavior.instance;
    }

    public function getName() : String {
        return Type.getClassName(Type.getClass(this));
    }

    // throws Exception
    public function damage(damage : Int, damageType : Int) : Void {
    }

    // throws Exception
    public function getDamage(damageType : Int) : Int {
        return 6000;
    }

    public function new() {
    }
}

