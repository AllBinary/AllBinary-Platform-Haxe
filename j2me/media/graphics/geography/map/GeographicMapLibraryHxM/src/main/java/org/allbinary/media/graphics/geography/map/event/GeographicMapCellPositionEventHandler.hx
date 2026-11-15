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
package org.allbinary.media.graphics.geography.map.event;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.game.layer.geographic.map.MiniMapLayer;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.logic.util.event.handler.BasicEventHandler;

class GeographicMapCellPositionEventHandler extends BasicEventHandler {
    private static var instance : GeographicMapCellPositionEventHandler = new GeographicMapCellPositionEventHandler();
    public static function getInstance() : GeographicMapCellPositionEventHandler {
        return GeographicMapCellPositionEventHandler.instance;
    }

    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
        super();
    }

    public function addListener(miniMapLayer : MiniMapLayer) : Void {
        if (!this.list.contains(miniMapLayer)) {
            this.list.add(miniMapLayer);
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
                var miniMapLayer : MiniMapLayer = (cast this.list.get(index) : MiniMapLayer);
                miniMapLayer.onGeographicMapCellPositionEvent((cast eventObject : GeographicMapCellPositionEvent));
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            }
        }
        super.fireEvent(eventObject);
    }

    // throws Exception
    // synchronized
    public function fireRemoveEvent(eventObject : AllBinaryEventObject) : Void {
        var list : BasicArrayList = this.eventListenerInterfaceList;
        {
            var index : Int = this.list.size();
            while (--index >= 0) {
            try {
                var miniMapLayer : MiniMapLayer = (cast this.list.get(index) : MiniMapLayer);
                miniMapLayer.onRemoveGeographicMapCellPositionEvent((cast eventObject : GeographicMapCellPositionEvent));
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            }
        }
        var eventListenerInterface : EventListenerInterface = null;
        var geographicMapCellPositionEventListenerInterface : GeographicMapCellPositionEventListenerInterface = null;
        final size : Int = list.size();
        for (index in 0...size) {
            try {
                eventListenerInterface = (cast list.get(index) : EventListenerInterface);
                geographicMapCellPositionEventListenerInterface = ((cast eventListenerInterface : GeographicMapCellPositionEventListenerInterface));
                geographicMapCellPositionEventListenerInterface.onRemoveGeographicMapCellPositionEvent((cast eventObject : GeographicMapCellPositionEvent));
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
        }
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        var geographicMapCellPositionEventListenerInterface : GeographicMapCellPositionEventListenerInterface = ((cast eventListenerInterface : GeographicMapCellPositionEventListenerInterface));
        geographicMapCellPositionEventListenerInterface.onGeographicMapCellPositionEvent((cast eventObject : GeographicMapCellPositionEvent));
    }

}

