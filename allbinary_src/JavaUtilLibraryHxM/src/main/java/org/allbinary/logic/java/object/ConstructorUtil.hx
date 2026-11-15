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

//import java.lang.reflect.Constructor;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class ConstructorUtil {
    public function new() {
    }

    public static function viewAll(myClass : Class<Dynamic>, lineBreak : String) : String {
        final stringBuffer : StringMaker = new StringMaker();
        final constructor : haxe.ds.Vector<Constructor> = myClass.getConstructors();
        stringBuffer.append("Constructors: ");
        stringBuffer.append(lineBreak);
        for (index in 0...constructor.length) {
            stringBuffer.append(ConstructorUtil.view(constructor[index], lineBreak));
        }
        return stringBuffer.toString();
    }

    public static function view(constructor : Constructor, lineBreak : String) : String {
        if (constructor != null) {
            final commonSeps : CommonSeps = CommonSeps.getInstance();
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(constructor.getName());
            final classes : haxe.ds.Vector<Class<Dynamic>> = constructor.getParameterTypes();
            for (index in 0...classes.length) {
                stringBuffer.append(commonSeps.SPACE);
                stringBuffer.append(classes[index].getName());
                stringBuffer.append(commonSeps.COLON);
                stringBuffer.appendint(index);
            }
            stringBuffer.append(lineBreak);
            return stringBuffer.toString();
        } else {
            return "Constructor Null";
        }
    }

}

