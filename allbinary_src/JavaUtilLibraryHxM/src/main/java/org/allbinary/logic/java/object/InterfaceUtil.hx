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
package org.allbinary.logic.java.anyType;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class InterfaceUtil {
    public function new() {
    }

    public static function viewAll(myClass : Class<Dynamic>, lineBreak : String) : String {
        final stringBuffer : StringMaker = new StringMaker();
        final interfaces : haxe.ds.Vector<Class<Dynamic>> = myClass.getInterfaces();
        stringBuffer.append(lineBreak);
        stringBuffer.append("Interfaces: ");
        stringBuffer.append(lineBreak);
        for (index in 0...interfaces.length) {
            stringBuffer.append("Interface: ");
            stringBuffer.append(interfaces[index].getName());
            stringBuffer.append(lineBreak);
        }
        return stringBuffer.toString();
    }

    public static function getClass(interfaceName : String, interfaces : haxe.ds.Vector<Class<Dynamic>>) : Class<Dynamic> {
        if (interfaceName != null && interfaces != null && interfaces.length > 0) {
            for (index in 0...interfaces.length) {
                if (interfaces[index].getName().indexOf(interfaceName) >= 0) {
                    return interfaces[index];
                }
            }
        }
        return null;
    }

    public static function isImplemented(clazz : Class<Dynamic>, anyType : Any) : Bool {
        var classes : haxe.ds.Vector<Class<Dynamic>> = Type.getClass(anyType).getInterfaces();
        for (index in 0...classes.length) {
            if (clazz.getName().compareTo(classes[index].getName()) == 0) {
                return true;
            }
        }
        return false;
    }

    public static function isImplemented(className : String, anyType : Any) : Bool {
        var classes : haxe.ds.Vector<Class<Dynamic>> = Type.getClass(anyType).getInterfaces();
        for (index in 0...classes.length) {
            if (classes[index].getName().indexOf(className) == 0) {
                return true;
            }
        }
        return false;
    }

    public static function isImplementedView(clazz : Class<Dynamic>, anyType : Any) : String {
        var stringBuffer : StringMaker = new StringMaker();
        var classes : haxe.ds.Vector<Class<Dynamic>> = Type.getClass(anyType).getInterfaces();
        stringBuffer.append("isImplementedView: \n");
        for (index in 0...classes.length) {
            stringBuffer.append(clazz.getName());
            stringBuffer.append(" should be = ");
            stringBuffer.append(classes[index].getName());
            stringBuffer.append(classes[index].getName());
            stringBuffer.append(CommonSeps.getInstance().NEW_LINE);
        }
        return stringBuffer.toString();
    }

}

