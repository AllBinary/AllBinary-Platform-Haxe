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
package org.allbinary.graphics.j2me.workarea.tools;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class Points implements PointsInterface {
    private final pointVector : BasicArrayList;
    public function new() {
        this.pointVector = new BasicArrayListD();
    }

    public function init() : Void {
        this.pointVector.clear();
    }

    public function getPoints() : BasicArrayList {
        return this.pointVector;
    }

    public function addPoints(vector : BasicArrayList) : Void {
        this.pointVector.addAll2(vector);
    }

    public function isValid() : Bool {
        if (this.pointVector.size() > 1) {
            return true;
        } else {
            return false;
        }
    }

    public function getSize() : Int {
        return this.pointVector.size();
    }

}

