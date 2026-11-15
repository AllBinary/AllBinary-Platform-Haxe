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
package org.allbinary.logic.java.proxy;

//import java.lang.reflect.Method;
//import java.lang.reflect.Proxy;

class InterfaceCastProxy implements java.lang.reflect.InvocationHandler {
    private var anyType : Any;
    public function new(anyType : Any) {
        this.anyType = anyType;
    }

    public static function newInstance(anyType : Any) : Any {
        return Proxy.newProxyInstance(Type.getClass(anyType).getClassLoader(), Type.getClass(anyType).getInterfaces(), new InterfaceCastProxy(anyType));
    }

    // throws Throwable
    public function invoke(proxyObject : Any, proxyMethod : Method, proxyArgs : haxe.ds.Vector<Any>) : Any {
        var methodName : String = proxyMethod.getName();
        var realMethod : Method = Type.getClass(this.anyType).getMethod(methodName, proxyMethod.getParameterTypes());
        if (!realMethod.isAccessible()) {
            realMethod.setAccessible(true);
        }
        return proxyMethod.invoke(this.anyType, proxyArgs);
    }

}

