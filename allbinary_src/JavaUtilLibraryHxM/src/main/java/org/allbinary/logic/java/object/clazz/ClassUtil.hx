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
package org.allbinary.logic.java.anyType.clazz;

import org.allbinary.logic.java.anyType.ConstructorUtil;
import org.allbinary.logic.java.anyType.InterfaceUtil;
import org.allbinary.logic.java.anyType.MethodUtil;
import org.allbinary.logic.string.StringMaker;

class ClassUtil {
    public function new() {
    }

    public static function viewAll(...args : Dynamic) : Dynamic {
        if (args.length == 2 && Std.isOfType(args[0], String)) {
            return ClassUtil.viewAll_Any_String(args[0], args[1]);
        }
        if (args.length == 2) {
            return ClassUtil.viewAll_Class_String(args[0], args[1]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: viewAll");
    }

    public static function viewAll_Any_String(anyType : Any, lineBreak : String) : String {
        if (anyType != null) {
            return ClassUtil.viewAll(Type.getClass(anyType), lineBreak);
        } else {
            return "Object Null";
        }
    }

    public static function viewAll_Class_String(myClass : Class<Dynamic>, lineBreak : String) : String {
        if (myClass != null) {
            var stringBuffer : StringMaker = new StringMaker();
            var classes : haxe.ds.Vector<Class<Dynamic>> = myClass.getClasses();
            stringBuffer.append(lineBreak);
            stringBuffer.append("Class: ");
            stringBuffer.append(Type.getClassName(myClass));
            stringBuffer.append(" uses ");
            stringBuffer.appendint(classes.length);
            stringBuffer.append(" other classes");
            stringBuffer.append(lineBreak);
            stringBuffer.append(lineBreak);
            stringBuffer.append("Classes: ");
            stringBuffer.append(lineBreak);
            for (index in 0...classes.length) {
                stringBuffer.append("Class: ");
                stringBuffer.append(classes[index].getName());
                stringBuffer.append(lineBreak);
            }
            stringBuffer.append(InterfaceUtil.viewAll(myClass, lineBreak));
            stringBuffer.append(lineBreak);
            stringBuffer.append(ConstructorUtil.viewAll(myClass, lineBreak));
            stringBuffer.append(lineBreak);
            stringBuffer.append(MethodUtil.viewAll(myClass, lineBreak));
            return Std.string(stringBuffer);
        } else {
            return "Class Null";
        }
    }

}

