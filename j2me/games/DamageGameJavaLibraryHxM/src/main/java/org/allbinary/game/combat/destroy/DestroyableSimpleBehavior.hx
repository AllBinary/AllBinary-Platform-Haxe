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

import org.allbinary.game.layer.CollidableCompositeLayer;

class DestroyableSimpleBehavior extends DestroyableBaseBehavior {
    public final ownerLayer : CollidableCompositeLayer;
    private var destroyed : Bool = false;
    public function new(ownerLayer : CollidableCompositeLayer) {
        super();
        this.ownerLayer = ownerLayer;
    }

    public override function isDestroyed() : Bool {
        return this.destroyed;
    }

    public override function setDestroyed(destroyed : Bool) : Void {
        this.destroyed = destroyed;
        if (this.isDestroyed()) {
            DestroyedLayerProcessor.getInstance().add(this.ownerLayer);
        }
    }

}

