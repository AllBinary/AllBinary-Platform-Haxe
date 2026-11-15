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
package org.allbinary.logic.control.contraints.size;

import org.w3c.dom.Node;

class TwoDimensionalConstraint implements TwoDimensionalConstraintInterface {
    private var widthSizeConstraintInterface : SizeConstraintInterface = null;
    private var heightSizeConstraintInterface : SizeConstraintInterface = null;
    public function new(node : Node) {
    }

    public function getHeight() : SizeConstraintInterface {
        return this.heightSizeConstraintInterface;
    }

    public function getWidth() : SizeConstraintInterface {
        return this.widthSizeConstraintInterface;
    }

    public function setHeight(heightSizeConstraintInterface : SizeConstraintInterface) : Void {
        this.heightSizeConstraintInterface = heightSizeConstraintInterface;
    }

    public function setWidth(widthSizeConstraintInterface : SizeConstraintInterface) : Void {
        this.widthSizeConstraintInterface = widthSizeConstraintInterface;
    }

}

