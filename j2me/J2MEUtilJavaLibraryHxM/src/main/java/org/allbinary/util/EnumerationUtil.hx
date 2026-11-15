/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.util;

//import jsinterop.annotations.JsType;
import jre.util.Enumeration;
//import jsinterop.annotations.JsMethod;

//ArkTs does not have this.  So this is for the ArkTs build.
class EnumerationUtil {
    private static final instance : EnumerationUtil = new EnumerationUtil();
    public static function getInstance() : EnumerationUtil {
        return EnumerationUtil.instance;
    }

    public function hasMoreElements(enumeration : Enumeration<Dynamic>) : Bool {
        return enumeration.hasMoreElements();
    }

    public function nextElement(enumeration : Enumeration<Dynamic>) : Any {
        return enumeration.nextElement();
    }

    public function getAsArray(enumeration : Enumeration<Dynamic>) : haxe.ds.Vector<Any> {
        final basicArrayList : BasicArrayList = new BasicArrayListD();
        while (this.hasMoreElements(enumeration)) {
            basicArrayList.add(this.nextElement(enumeration));
        }
        return basicArrayList.toArray();
    }

    public function new() {
    }
}

