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

import org.allbinary.game.combat.destroy.event.DestroyEventCircularStaticPool;
import org.allbinary.game.combat.destroy.event.DestroyedEvent;
import org.allbinary.game.combat.destroy.event.DestroyedEventHandler;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.layer.BasicLayerProcessor;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

class DestroyedLayerProcessor extends BasicLayerProcessor {
    private static var DESTROYED_LAYER_PROCESSOR : BasicLayerProcessor = BasicLayerProcessor.NULL_LAYER_PROCESSOR;
    public function new() {
        super();
    }

    public static function init() : Void {
        DestroyedLayerProcessor.DESTROYED_LAYER_PROCESSOR = new DestroyedLayerProcessor();
    }

    public static function getInstance() : BasicLayerProcessor {
        return DestroyedLayerProcessor.DESTROYED_LAYER_PROCESSOR;
    }

    // throws Exception
    public override function process(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        var list : BasicArrayList = this.getList();
        var size : Int = list.size();
        final destroyedEventHandler : DestroyedEventHandler = DestroyedEventHandler.getInstance();
        final destroyEventCircularStaticPool : DestroyEventCircularStaticPool = DestroyEventCircularStaticPool.getInstance();
        var destroyedEvent : DestroyedEvent = null;
        var layerInterface : AllBinaryLayer = null;
        for (index in 0...size) {
            var layerInterfaceCanBeNull : Any = list.objectArray[index];
            if (layerInterfaceCanBeNull != null) {
                layerInterface = (cast layerInterfaceCanBeNull : AllBinaryLayer);
                allBinaryLayerManager.remove(layerInterface);
                destroyedEvent = destroyEventCircularStaticPool.getInstanceForLayer(layerInterface);
                destroyedEventHandler.fireEvent(destroyedEvent);
            } else {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
            }
        }
        list.clear();
    }

}

