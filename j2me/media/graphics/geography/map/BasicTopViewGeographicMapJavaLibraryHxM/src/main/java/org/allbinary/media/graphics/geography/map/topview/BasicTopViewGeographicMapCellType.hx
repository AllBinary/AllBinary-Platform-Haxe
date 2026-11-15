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
package org.allbinary.media.graphics.geography.map.topview;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListS;

class BasicTopViewGeographicMapCellType {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final name : String;
    public final cost : Int;
    private final types : haxe.ds.Vector<Int>;
    public static function createType(name : String, type : Int, cost : Int) : BasicTopViewGeographicMapCellType {
        final types : BasicArrayList = new BasicArrayListS(1);
        types.add(type);
        return new BasicTopViewGeographicMapCellType(name, types, cost);
    }

    public function new(name : String, types : BasicArrayList, cost : Int) {
        final size : Int = types.size();
        final typeArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) 0]);
        var typeAsInteger : Null<Int> = null;
        var type : Int = 0;
        for (index in 0...size) {
            typeAsInteger = ((cast types.get(index) : Null<Int>));
            type = Std.int(typeAsInteger);
            if (GeographicMapCellTypeFactory.getInstance().getGeographicMapCellTypeArray()[type] == null) {
                new RaceTrackGeographicMapCellType(name, type, cost, 0);
            } else {
            }
            typeArray[index] = type;
        }
        this.name = name;
        this.cost = cost;
        this.types = typeArray;
    }

    public function isType(type : GeographicMapCellType) : Bool {
        return this.hasType(type.getType());
    }

    public function hasType(type : Int) : Bool {
        final size : Int = this.types.length;
        for (index in 0...size) {
            if (this.types[index] == type) {
                return true;
            }
        }
        return false;
    }

    public function getTypes() : haxe.ds.Vector<Int> {
        return this.types;
    }

    public function toString() : String {
        final stringMaker : StringMaker = new StringMaker();
        final size : Int = this.types.length;
        for (index in 0...size) {
            stringMaker.appendint(this.types[index]).append(CommonSeps.getInstance().COMMA);
        }
        return stringMaker.toString();
    }

}

