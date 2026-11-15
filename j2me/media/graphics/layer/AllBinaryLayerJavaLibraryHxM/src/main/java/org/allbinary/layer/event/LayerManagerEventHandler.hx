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
package org.allbinary.layer.event;

import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class LayerManagerEventHandler extends BasicEventHandler {
    private static var instance : LayerManagerEventHandler = new LayerManagerEventHandler();
    public static function getInstance() : LayerManagerEventHandler {
        return LayerManagerEventHandler.instance;
    }

    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
        super();
    }

    public function addListener(layerManagerEventListener : LayerManagerEventListener) : Void {
        if (!this.list.contains(layerManagerEventListener)) {
            this.list.add(layerManagerEventListener);
        }
    }

    public override function removeAllListeners() : Void {
        this.list.clear();
        super.removeAllListeners();
    }

    public override function removeListener(eventListenerInterface : EventListenerInterface) : Void {
        this.list.remove(eventListenerInterface);
        super.removeListener(eventListenerInterface);
    }

    // throws Exception
    public override function fireEvent(eventObject : AllBinaryEventObject) : Void {
        {
            var index : Int = this.list.size();
            while (--index >= 0) {
            try {
                final layerManagerEventListener : LayerManagerEventListener = (cast this.list.objectArray[index] : LayerManagerEventListener);
                layerManagerEventListener.onCreateLayerManagerEvent((cast eventObject : LayerManagerEvent));
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            }
        }
        super.fireEvent(eventObject);
    }

    public final CREATE : String = "Create";
    public final DELETE : String = "Delete";
    // throws Exception
    // synchronized
    public function fireDeleteEvent(eventObject : AllBinaryEventObject) : Void {
        {
            var index : Int = this.list.size();
            while (--index >= 0) {
            try {
                final layerManagerEventListener : LayerManagerEventListener = (cast this.list.objectArray[index] : LayerManagerEventListener);
                layerManagerEventListener.onDeleteLayerManagerEvent((cast eventObject : LayerManagerEvent));
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            }
        }
        final eventListenerInterfaceList : BasicArrayList = this.eventListenerInterfaceList;
        var eventListenerInterface : EventListenerInterface = null;
        var layerManagerEventListenerInterface : LayerManagerEventListenerInterface = null;
        var index : Int = 0;
        while (index < eventListenerInterfaceList.size()) {
            try {
                eventListenerInterface = (cast eventListenerInterfaceList.objectArray[index] : EventListenerInterface);
                layerManagerEventListenerInterface = ((cast eventListenerInterface : LayerManagerEventListenerInterface));
                layerManagerEventListenerInterface.onDeleteLayerManagerEvent((cast eventObject : LayerManagerEvent));
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            index++;
        }
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        final layerManagerEventListenerInterface : LayerManagerEventListenerInterface = ((cast eventListenerInterface : LayerManagerEventListenerInterface));
        layerManagerEventListenerInterface.onCreateLayerManagerEvent((cast eventObject : LayerManagerEvent));
    }

}

