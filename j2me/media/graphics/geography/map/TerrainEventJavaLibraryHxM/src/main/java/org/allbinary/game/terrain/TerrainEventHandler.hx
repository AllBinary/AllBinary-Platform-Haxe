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
package org.allbinary.game.terrain;

import org.allbinary.logic.StdUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class TerrainEventHandler extends BasicEventHandler {
    private static var hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().NULL_TABLE;
    public static function init() : Void {
        TerrainEventHandler.hashtable = StdUtil.getInstance().createHashtable();
    }

    public static function getInstance(anyType : Any) : TerrainEventHandler {
        var eventHandlerCanBeNull : Any = TerrainEventHandler.hashtable.get(anyType);
        if (eventHandlerCanBeNull == null) {
            eventHandlerCanBeNull = new TerrainEventHandler();
            TerrainEventHandler.hashtable.put(anyType, eventHandlerCanBeNull);
        }
        return (cast eventHandlerCanBeNull : TerrainEventHandler);
    }

    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
        super();
    }

    public function addListener(terrainEventListener : TerrainEventListener) : Void {
        if (!this.list.contains(terrainEventListener)) {
            this.list.add(terrainEventListener);
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
                final terrainEventListener : TerrainEventListener = (cast this.list.get(index) : TerrainEventListener);
                terrainEventListener.onTerrainEvent((cast eventObject : TerrainEvent));
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            }
        }
        super.fireEvent(eventObject);
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        final terrainEventListenerInterface : TerrainEventListenerInterface = (cast eventListenerInterface : TerrainEventListenerInterface);
        terrainEventListenerInterface.onTerrainEvent((cast eventObject : TerrainEvent));
    }

}

