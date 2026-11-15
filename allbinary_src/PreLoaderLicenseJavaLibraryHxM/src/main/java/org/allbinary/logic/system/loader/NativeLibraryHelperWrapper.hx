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
package org.allbinary.logic.system.loader;

//import java.lang.reflect.Constructor;
//import java.lang.reflect.Method;
import org.allbinary.string.CommonStrings;

class NativeLibraryHelperWrapper {
    private var libraryName : String = null;
    private var loader : ClassLoader = null;
    private var anyType : Any = null;
    public function new(libraryName : String) {
        this.setLibraryName(libraryName);
    }

    // throws Exception
    public function load() : Void {
        var params : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
        params[0] = this.getLibraryName();
        var classes : haxe.ds.Vector<Class<Dynamic>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
        classes[0] = Type.getClass(this.getLibraryName());
        this.loader = new NativeLibraryClassLoader(Type.getClass(this).getClassLoader());
        var myClass : Class<Dynamic> = this.loader.loadClass("dynamic.NativeLibraryHelper");
        var constructor : Constructor = myClass.getConstructor(classes);
        this.anyType = constructor.newInstance(params);
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        var method : Method = Type.getClass(this.anyType).getMethod(commonStrings.LOAD, null);
        method.invoke(this.anyType, null);
    }

    public function unload() : Void {
        this.anyType = null;
        this.loader = null;
        null;
        null;
    }

    public function toString() : String {
        return "Library: " + this.getLibraryName();
    }

    public function getLibraryName() : String {
        return this.libraryName;
    }

    public function setLibraryName(libraryName : String) : Void {
        this.libraryName = libraryName;
    }

}

