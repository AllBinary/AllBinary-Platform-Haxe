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

import org.allbinary.graphics.CellPositionFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionTracking;

class GeographicMapCellPositionEventUtil {
    private final geographicMapCellPositionEvent : GeographicMapCellPositionEvent;
    private final geographicMapCellPositionEventHandler : GeographicMapCellPositionEventHandler = GeographicMapCellPositionEventHandler.getInstance();
    public function new(anyType : Any) {
        this.geographicMapCellPositionEvent = new GeographicMapCellPositionEvent(anyType, CellPositionFactory.getInstance().NONE);
    }

    // throws Exception
    public function update(geographicMapCellPositionTracking : GeographicMapCellPositionTracking) : Void {
        this.geographicMapCellPositionEvent.setGeographicMapCellPosition(geographicMapCellPositionTracking.getCurrentGeographicMapCellPosition());
        this.geographicMapCellPositionEventHandler.fireEvent(this.geographicMapCellPositionEvent);
    }

    // throws Exception
    public function remove(geographicMapCellPositionTracking : GeographicMapCellPositionTracking) : Void {
        this.geographicMapCellPositionEvent.setGeographicMapCellPosition(geographicMapCellPositionTracking.getCurrentGeographicMapCellPosition());
        this.geographicMapCellPositionEventHandler.fireRemoveEvent(this.geographicMapCellPositionEvent);
    }

}

