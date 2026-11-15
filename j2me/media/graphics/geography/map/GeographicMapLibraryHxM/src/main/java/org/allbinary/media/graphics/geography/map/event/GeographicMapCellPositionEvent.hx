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

import org.allbinary.graphics.CellPosition;
import org.allbinary.graphics.CellPositionFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;

class GeographicMapCellPositionEvent extends AllBinaryEventObject {
    private var geographicMapCellPosition : CellPosition = CellPositionFactory.getInstance().NONE;
    public function new(anyType : Any, geographicMapCellPosition : CellPosition) {
        super(anyType);
        this.geographicMapCellPosition = geographicMapCellPosition;
    }

    public function init(anyType : Any) : Void {
        this.setSource(anyType);
    }

    public function setGeographicMapCellPosition(geographicMapCellPosition : GeographicMapCellPosition) : Void {
        this.geographicMapCellPosition = geographicMapCellPosition;
    }

    public function getGeographicMapCellPosition() : GeographicMapCellPosition {
        return (cast this.geographicMapCellPosition : GeographicMapCellPosition);
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("CellPositionEvent: ");
        stringBuffer.append("\nGeographicMapCellPosition: ");
        stringBuffer.append(StringUtil.getInstance().toString(this.getGeographicMapCellPosition()));
        return stringBuffer.toString();
    }

}

