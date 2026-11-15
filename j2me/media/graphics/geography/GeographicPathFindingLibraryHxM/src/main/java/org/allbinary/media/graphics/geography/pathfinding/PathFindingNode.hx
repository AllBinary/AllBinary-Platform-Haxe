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
package org.allbinary.media.graphics.geography.pathfinding;

import org.allbinary.logic.NullUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;
import org.allbinary.string.CommonLabels;

class PathFindingNode {
    public var parent : Any = NullUtil.getInstance().NULL_OBJECT;
    public var geographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    public function new(parent : Any, geographicMapCellPosition : GeographicMapCellPosition) {
        this.parent = parent;
        this.setGeographicMapCellPositionP(geographicMapCellPosition);
        if (this.geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            throw new haxe.Exception("No GeographicMapCellPosition");
        }
    }

    public function getParentP() : PathFindingNode {
        return (cast this.parent : PathFindingNode);
    }

    public function setGeographicMapCellPositionP(geographicMapCellPosition : GeographicMapCellPosition) : Void {
        this.geographicMapCellPosition = geographicMapCellPosition;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(Type.getClassName(Type.getClass(this)));
        stringBuffer.append(CommonLabels.getInstance().COLON_SEP);
        stringBuffer.append(" Path: ");
        stringBuffer.append(this.geographicMapCellPosition.toString());
        var pathFindingNode : PathFindingNode = this.getParentP();
        while (pathFindingNode != null) {
            stringBuffer.append(pathFindingNode.geographicMapCellPosition.toString());
            stringBuffer.append(CommonSeps.getInstance().SPACE);
            pathFindingNode = pathFindingNode.getParentP();
        }
        return stringBuffer.toString();
    }

}

