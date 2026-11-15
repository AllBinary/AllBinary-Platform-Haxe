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
package org.allbinary.game.combat.destroy;

import org.allbinary.string.CommonStrings;

class DestroyableBaseBehavior implements DestroyableInterface {
    private static final instance : DestroyableBaseBehavior = new DestroyableBaseBehavior();
    public static function getInstance() : DestroyableBaseBehavior {
        return DestroyableBaseBehavior.instance;
    }

    public function getName() : String {
        return Type.getClassName(Type.getClass(this));
    }

    // throws Exception
    public function isDestroyed() : Bool {
        throw new haxe.Exception(CommonStrings.getInstance().NOT_IMPLEMENTED);
    }

    public function setDestroyed(destroyed : Bool) : Void {
    }

    public function new() {
    }
}

