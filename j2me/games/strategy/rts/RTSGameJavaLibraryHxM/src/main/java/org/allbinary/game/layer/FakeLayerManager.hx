/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2002 AllBinary 
 *  
 * By agreeing to this license you and any business entity you represent are 
 * legally bound to the AllBinary Open License Version 1 legal agreement. 
 *  
 * You may obtain the AllBinary Open License Version 1 legal agreement from 
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
 *  
 * Created By: Travis Berthelot  
 */
// Generated Code Do Not Modify
package org.allbinary.game.layer;

import org.allbinary.game.GameInfo;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;

class FakeLayerManager extends AllBinaryGameLayerManager implements GeographicMapCompositeInterface {
    private var geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap> = BasicGeographicMap.NULL_BASIC_GEOGRAPHIC_MAP_ARRAY;
    private var geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType> = GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE_ARRAY;
    public function new(gameInfo : GameInfo) {
        super(BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE, gameInfo);
    }

    public override function getGeographicMapInterface() : haxe.ds.Vector<BasicGeographicMap> {
        return this.geographicMapInterfaceArray;
    }

    public override function setGeographicMapInterface(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>) : Void {
        this.geographicMapInterfaceArray = geographicMapInterfaceArray;
        this.geographicMapCellTypeArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.geographicMapInterfaceArray.length) null]);
    }

    public override function geographicMapCellTypeArray() : haxe.ds.Vector<GeographicMapCellType> {
        return this.geographicMapCellTypeArray;
    }

}

