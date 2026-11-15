/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.layer.geological.resources;


class GeologicalResource {
    private var total : Int = 0;
    private var initTotal : Int;
    public function new(initTotal : Int) {
        this.initTotal = initTotal;
        this.init();
    }

    public function init() : Void {
        this.setTotal(this.initTotal);
    }

    public function add(value : Int) : Void {
        final max : Int = Integer.MAX_VALUE;
        if (this.getTotal() + value > max) {
            this.setTotal(max);
        } else {
            this.setTotal(this.getTotal() + value);
        }
    }

    public function remove(value : Int) : Void {
        if (this.getTotal() - value < 0) {
            this.setTotal(0);
        } else {
            this.setTotal(this.getTotal() - value);
        }
    }

    public function getTotal() : Int {
        return this.total;
    }

    public function setTotal(total : Int) : Void {
        this.total = total;
    }

}

