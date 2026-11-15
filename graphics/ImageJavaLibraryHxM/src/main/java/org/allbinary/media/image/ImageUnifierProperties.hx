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
package org.allbinary.media.image;


class ImageUnifierProperties {
    private var rows : Null<Int> = null;
    private var columns : Null<Int> = null;
    private var imageUnifierCell : ImageUnifierCell = null;
    public function new() {
    }

    public function getWidth() : Int {
        return Std.int(this.getColumns()) * Std.int(this.getImageUnifierCell().getWidth());
    }

    public function getHeight() : Int {
        return Std.int(this.getRows()) * Std.int(this.getImageUnifierCell().getHeight());
    }

    public function getRows() : Null<Int> {
        return this.rows;
    }

    public function setRows(rows : Null<Int>) : Void {
        this.rows = rows;
    }

    public function getColumns() : Null<Int> {
        return this.columns;
    }

    public function setColumns(columns : Null<Int>) : Void {
        this.columns = columns;
    }

    public function getImageUnifierCell() : ImageUnifierCell {
        return this.imageUnifierCell;
    }

    public function setImageUnifierCell(imageUnifierCell : ImageUnifierCell) : Void {
        this.imageUnifierCell = imageUnifierCell;
    }

}

