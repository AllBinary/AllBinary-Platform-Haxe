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
package org.allbinary.game.physics.acceleration;


class BasicAccelerationProperties {
    private var forward : Int = 0;
    private var reverse : Int = 0;
    public function new(forward : Int, reverse : Int) {
        this.setForward(forward);
        this.setReverse(reverse);
    }

    public function setReverse(reverse : Int) : Void {
        this.reverse = reverse;
    }

    public function getReverse() : Int {
        return this.reverse;
    }

    public function setForward(forward : Int) : Void {
        this.forward = forward;
    }

    public function getForward() : Int {
        return this.forward;
    }

}

