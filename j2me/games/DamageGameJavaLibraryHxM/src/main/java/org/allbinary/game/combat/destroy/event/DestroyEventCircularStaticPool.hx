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
package org.allbinary.game.combat.destroy.event;

import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.util.event.AllBinaryEventCircularPool;

class DestroyEventCircularStaticPool {
    private static final instance : DestroyEventCircularStaticPool = new DestroyEventCircularStaticPool();
    public static function getInstance() : DestroyEventCircularStaticPool {
        return DestroyEventCircularStaticPool.instance;
    }

    private var EVENT_POOL : AllBinaryEventCircularPool = new AllBinaryEventCircularPool(20);
    public function new() {
    }

    public function init(combatGameCanvas : AllBinaryGameCanvas) : Void {
        this.EVENT_POOL.initAllBinaryEventCircularPool(new DestroyEventFactory(combatGameCanvas));
    }

    // throws Exception
    public function getInstanceForLayer(layerInterface : AllBinaryLayer) : DestroyedEvent {
        var destroyedEvent : DestroyedEvent = (cast this.EVENT_POOL.getNextInstance() : DestroyedEvent);
        destroyedEvent.setLayerInterfaceForCircularStaticPool(layerInterface);
        return destroyedEvent;
    }

}

