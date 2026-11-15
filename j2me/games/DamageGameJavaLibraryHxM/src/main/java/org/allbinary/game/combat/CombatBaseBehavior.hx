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
package org.allbinary.game.combat;

import org.allbinary.game.combat.damage.DamageableBaseBehavior;
import org.allbinary.game.combat.destroy.DestroyableBaseBehavior;

class CombatBaseBehavior {
    public static final NULL_COMBAT_BEHAVIOR : CombatBaseBehavior = new CombatBaseBehavior(DamageableBaseBehavior.getInstance(), DestroyableBaseBehavior.getInstance());
    private final damageableBaseBehavior : DamageableBaseBehavior;
    private final destroyableBaseBehavior : DestroyableBaseBehavior;
    private var readyForExplosion : Bool = false;
    public function new(damageableBaseBehavior : DamageableBaseBehavior, destroyableBaseBehavior : DestroyableBaseBehavior) {
        this.damageableBaseBehavior = damageableBaseBehavior;
        this.destroyableBaseBehavior = destroyableBaseBehavior;
    }

    public function getDamageableBaseBehavior() : DamageableBaseBehavior {
        return this.damageableBaseBehavior;
    }

    public function getDestroyableBaseBehavior() : DestroyableBaseBehavior {
        return this.destroyableBaseBehavior;
    }

    public function isReadyForExplosion() : Bool {
        return this.readyForExplosion;
    }

    public function setReadyForExplosion(readyForExplosion : Bool) : Void {
        this.readyForExplosion = readyForExplosion;
    }

}

