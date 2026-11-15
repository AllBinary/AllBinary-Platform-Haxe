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

class ScrollMapEvent extends AllBinaryEventObject {
    private var dx : Int = 0;
    private var dy : Int = 0;
    public function new(anyType : Any) {
        super(anyType);
    }

    public function setDx(dx : Int) : Void {
        this.dx = dx;
    }

    public function getDx() : Int {
        return this.dx;
    }

    public function setDy(dy : Int) : Void {
        this.dy = dy;
    }

    public function getDy() : Int {
        return this.dy;
    }

    public function setDxDy(dx : Int, dy : Int) : Void {
        this.dx = dx;
        this.dy = dy;
    }

}

