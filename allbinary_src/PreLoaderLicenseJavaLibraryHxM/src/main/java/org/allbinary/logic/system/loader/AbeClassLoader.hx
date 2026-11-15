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

//import java.io.FileInputStream;
//import java.io.IOException;
//import java.util.Map;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogBuffer;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.security.AbCryptUtil;

class AbeClassLoader extends ClassLoader {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final abCryptUtil : AbCryptUtil = AbCryptUtil.getInstance();
    private final LOAD_CLASS : String = "loadClass";
    private static var classes : Map = StdUtil.getInstance().createHashMap();
    private final ENCRYPTED_EXTENSION : String = AbPathData.getInstance().EXTENSION_SEP + "abc";
    private static var PATH : String;
    private var key : String;
    public function new(parent : ClassLoader, key : String) {
        super(parent);
        this.key = key;
        AbeClassLoader.PATH = org.allbinary.globals.URLGLOBALS.getWebappPath() + "WEB-INF/classes/";
    }

    public function findLoadedClass1(name : String) : Class<Dynamic> {
        return (cast AbeClassLoader.classes.get(name) : Class<Dynamic>);
    }

    // throws ClassNotFoundException
    // synchronized
    public function loadClass(name : String) : Class<Dynamic> {
        return this.loadClass(name, false);
    }

    // throws ClassNotFoundException
    // synchronized
    public function loadClass(name : String, resolve : Bool) : Class<Dynamic> {
        var loadedWith : String = "findLoadedClass1";
        var logBuffer : LogBuffer = new LogBuffer();
        try {
            var myClass : Class<Dynamic> = this.findLoadedClass1(name);
            if (myClass == null) {
                try {
                    loadedWith = "super.loadClass";
                    var normalClass : Class<Dynamic> = super.loadClass(name, resolve);
                    if (normalClass != null) {
                        return normalClass;
                    }
                } catch (e : ClassNotFoundException) {
                    logBuffer.add(LogFactory.getInstance("Failed to Load Class: " + name + "\nwith: " + loadedWith, this, this.LOAD_CLASS, e));
                } catch (e : haxe.Exception) {
                    logBuffer.add(LogFactory.getInstance("Failed to Load Class: " + name + "\nwith: " + loadedWith, this, this.LOAD_CLASS, e));
                } catch (e : NoClassDefFoundError) {
                    logBuffer.add(LogFactory.getInstanceF("NoClassDefFoundError Failed Loaded Class: " + name + "\nwith: " + loadedWith, this, this.LOAD_CLASS));
                }
                var classBytes : haxe.ds.Vector<Int> = this.loadClassBytesFromFile(name);
                if (classBytes == null) {
                    throw new ClassNotFoundException("My Bytes not loaded for: " + name + "\nwith: " + "loadClassBytes");
                }
                myClass = defineClass(name, classBytes, 0, classBytes.length);
                if (myClass == null) {
                    throw new ClassNotFoundException("My Class Not Defineable for: " + name + "\nwith: " + "loadClassBytes");
                }
                AbeClassLoader.classes.put(name, myClass);
            } else {
                logBuffer.add(LogFactory.getInstanceF("Already Loaded: " + name + "\nwith: " + loadedWith, this, this.LOAD_CLASS));
            }
            resolveClass(myClass);
            return myClass;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LOADERERROR)) {
                logBuffer.logAll();
                this.logUtil.put("Failure loading: " + name + "\nwith: " + loadedWith, this, this.LOAD_CLASS, e);
            }
            return null;
        }
    }

    private function loadClassBytesFromFile(name : String) : haxe.ds.Vector<Int> {
        var in_ : FileInputStream = null;
        var cname : String = StringUtil.getInstance().EMPTY_STRING;
        try {
            cname = AbeClassLoader.PATH + StringTools.replace(name, ".".code, AbPathData.getInstance().SEPARATORCHAR) + this.ENCRYPTED_EXTENSION;
            in_ = new FileInputStream(cname);
            final decrypted : haxe.ds.Vector<Int> = this.abCryptUtil.decrypt(in_, this.key);
            return decrypted;
        } catch (e : IOException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LOADERERROR)) {
                this.logUtil.put("(Before LogBuffer Output) Failure loading Encrypted: " + name + " File: " + cname, "AbeClassLoader", "loadClassBytes", e);
            }
            StreamUtil.getInstance().close(in_);
        } catch (e : haxe.Exception) {
            final loadedWith : String = "loadClassBytes";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LOADERERROR)) {
                this.logUtil.put("(Before LogBuffer Output) Failed to Loaded Class: " + name + " File: " + cname + "\nwith: " + loadedWith, this, "loadClassBytes", e);
            }
        } catch (e : NoClassDefFoundError) {
            final loadedWith : String = "loadClassBytes";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LOADERERROR)) {
                this.logUtil.putF("(Before LogBuffer Output) NoClassDefFoundError Failed Loaded Class: " + name + " File: " + cname + "\nwith: " + loadedWith, this, "loadClassBytes");
            }
        }
        return null;
    }

    // throws ClassNotFoundException
    // synchronized
    public function oldLoadClass(name : String, resolve : Bool) : Class<Dynamic> {
        var loadedWith : String = "findLoadedClass1";
        try {
            var myClass : Class<Dynamic> = this.findLoadedClass1(name);
            if (myClass == null) {
                try {
                    loadedWith = "super.loadClass";
                    var normalClass : Class<Dynamic> = super.loadClass(name, resolve);
                    if (normalClass != null) {
                        return normalClass;
                    }
                } catch (e : ClassNotFoundException) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LOADER)) {
                        this.logUtil.putF("Failed Loaded Class: " + name + " with: " + loadedWith, this, this.LOAD_CLASS);
                    }
                } catch (e : haxe.Exception) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LOADER)) {
                        this.logUtil.putF("Failed Loaded Class: " + name + " with: " + loadedWith, this, this.LOAD_CLASS);
                    }
                } catch (e : NoClassDefFoundError) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LOADER)) {
                        this.logUtil.putF("Failed Loaded Class: " + name + " with: " + loadedWith, this, this.LOAD_CLASS);
                    }
                }
                loadedWith = "loadClassBytes";
                var classBytes : haxe.ds.Vector<Int> = this.loadClassBytesFromFile(name);
                if (classBytes == null) {
                    throw new ClassNotFoundException("Bytes not loaded for: " + name);
                }
                myClass = defineClass(name, classBytes, 0, classBytes.length);
                if (myClass == null) {
                    throw new ClassNotFoundException("Class Not Defineable for: " + name);
                }
                AbeClassLoader.classes.put(name, myClass);
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LOADER)) {
                    this.logUtil.putF("Already Loaded: " + name + " with: " + loadedWith, this, this.LOAD_CLASS);
                }
            }
            resolveClass(myClass);
            return myClass;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LOADERERROR)) {
                this.logUtil.put("Failure loading: " + name, "AbeClassLoader", this.LOAD_CLASS, e);
            }
            return null;
        }
    }

}

