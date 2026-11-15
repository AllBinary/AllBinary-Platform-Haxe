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
package org.allbinary.graphics;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

class RelativeRelationship {
    public static final NULL_RELATIVE_RELATIONSHIP : RelativeRelationship = new RelativeRelationship(PointFactory.getInstance().ZERO_ZERO, BasicArrayListUtil.getInstance().getImmutableInstance());
    private var typesAllowedList : BasicArrayList;
    private var x : Int;
    private var y : Int;
    private var z : Int;
    public function new(point : GPoint, typesAllowedList : BasicArrayList) {
        this.x = point.getX();
        this.y = point.getY();
        this.z = point.getZ();
        this.typesAllowedList = typesAllowedList;
    }

    public function getX() : Int {
        return this.x;
    }

    public function getY() : Int {
        return this.y;
    }

    public function getZ() : Int {
        return this.z;
    }

    public function getTypesAllowedList() : BasicArrayList {
        return this.typesAllowedList;
    }

    public function setTypesAllowedList(typesAllowedList : BasicArrayList) : Void {
        this.typesAllowedList = typesAllowedList;
    }

}

