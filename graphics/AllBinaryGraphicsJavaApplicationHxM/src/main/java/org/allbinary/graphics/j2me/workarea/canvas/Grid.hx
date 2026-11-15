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
package org.allbinary.graphics.j2me.workarea.canvas;

import org.allbinary.graphics.GPoint;

class Grid {
    public var grid : GPoint;
    public var isGridOn : Bool = true;
    public var isGridPossible : Bool = false;
    private var zoom : Int = 3;
    public var isChanged : Bool = true;
    public function new() {
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(grid : Grid) {
        this.grid = grid.grid;
        this.showGrid(grid.isGridOn);
        this.isGridPossible = grid.isGridPossible;
        this.setZoom(grid.getZoom());
    }

    public function isGridOn() : Bool {
        return this.isGridOn;
    }

    public function isGridPossible() : Bool {
        return this.isGridPossible;
    }

    public function getGrid() : GPoint {
        return this.grid;
    }

    public function getZoom() : Int {
        return this.zoom;
    }

    public function showGrid(value : Bool) : Void {
        this.isGridOn = value;
    }

    public function setZoom(zoom : Int) : Void {
        this.zoom = zoom;
        if (this.zoom < 1) {
            zoom = 1;
        }
        this.isChanged = true;
    }

}

