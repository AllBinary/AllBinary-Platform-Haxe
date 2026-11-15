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

import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;

class DamageUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : DamageUtil = new DamageUtil();
    public static function getInstance() : DamageUtil {
        return DamageUtil.instance;
    }

    public final COLLIDE : String = "collide";
    public function new() {
    }

    // throws Exception
    public function process(damageableInterface : DamageableInterface, damageableInterface2 : DamageableInterface) : Void {
        damageableInterface.damage(damageableInterface2.getDamage(0), 0);
    }

    // throws Exception
    public function debugDamage(collidableInterfaceCompositeInterface1 : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableCompositeLayer) : Void {
        final collidableDestroyableDamageableLayer : CollidableDestroyableDamageableLayer = (cast collidableInterfaceCompositeInterface : CollidableDestroyableDamageableLayer);
        var damage : Int = collidableDestroyableDamageableLayer.getDamage(0);
        if (damage > 20000) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Collision ");
            stringBuffer.append(collidableInterfaceCompositeInterface1.toString());
            stringBuffer.append(" with: ");
            stringBuffer.append(collidableInterfaceCompositeInterface.toString());
            stringBuffer.append(" damage: ");
            stringBuffer.appendint(damage);
            this.logUtil.putF(stringBuffer.toString(), collidableInterfaceCompositeInterface1, this.COLLIDE);
        }
    }

}

