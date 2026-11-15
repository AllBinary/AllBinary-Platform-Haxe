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
package org.allbinary.graphics.color;

import jsinterop.annotations.JsType;
import org.allbinary.util.CircularIndexUtil;
import jsinterop.annotations.JsMethod;
import jsinterop.annotations.JsConstructor;

class BasicColorArrayIndexer {
    private var basicColorArray : haxe.ds.Vector<BasicColor>;
    private var circularIndexUtil : CircularIndexUtil;
    public function new(basicColorArray : haxe.ds.Vector<BasicColor>) {
        this.basicColorArray = basicColorArray;
        this.circularIndexUtil = CircularIndexUtil.createInstance(this.basicColorArray.length);
    }

    public function next() : Void {
        this.circularIndexUtil.next();
    }

    public function get() : BasicColor {
        return this.basicColorArray[this.circularIndexUtil.getIndex()];
    }

    public function getBasicColorArray() : haxe.ds.Vector<BasicColor> {
        return this.basicColorArray;
    }

}

