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
package bundle.input.automation;

//import java.util.Collection;
//import java.util.Map;
//import java.util.Set;
import org.osgi.framework.ServiceReference;
import org.allbinary.logic.string.StringMaker;

class ServiceReferenceMap implements Map {
    private var serviceReference : ServiceReference;
    public function new(serviceReference : ServiceReference) {
        this.serviceReference = serviceReference;
    }

    public function size() : Int {
        return -1;
    }

    public function isEmpty() : Bool {
        return false;
    }

    public function containsKey(key : Any) : Bool {
        return false;
    }

    public function containsValue(value : Any) : Bool {
        return false;
    }

    public function get(key : Any) : Any {
        return this.serviceReference.getProperty((cast key : String));
    }

    public function put(key : Any, value : Any) : Any {
        return null;
    }

    public function remove(key : Any) : Any {
        return null;
    }

    public function putAll(m : Map) : Void {
    }

    public function clear() : Void {
    }

    public function keySet() : Set {
        var keyStringArray : haxe.ds.Vector<String> = this.serviceReference.getPropertyKeys();
        return null;
    }

    public function values() : Collection<Any> {
        return null;
    }

    public function entrySet() : Set {
        return null;
    }

    public static function toString(map : Map) : String {
        var stringBuffer : StringMaker = new StringMaker();
        return stringBuffer.toString();
    }

}

