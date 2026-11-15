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
package org.allbinary.logic.util.visitor;

import org.allbinary.logic.NullUtil;

class Visitor implements VisitorInterface {
    private static final instance : Visitor = new Visitor();
    public final nullUtil : NullUtil = NullUtil.getInstance();
    public function visit(anyType : Any) : Any {
        return this.nullUtil.NULL_OBJECT;
    }

    public static function getInstance() : Visitor {
        return Visitor.instance;
    }

    public function new() {
    }
}

