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
package org.allbinary.input.automation.robot;

//import java.awt.GraphicsDevice;
//import java.awt.GraphicsEnvironment;
//import java.util.Collection;
//import java.util.Iterator;
//import java.util.Set;
//import javax.help.HelpSet;
//import javax.help.event.HelpSetEvent;
//import javax.help.event.HelpSetListener;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.help.JavaHelpSetNotifier;
import org.allbinary.logic.java.anyType.InterfaceUtil;
import org.allbinary.logic.system.loader.SecuredNativeLibraryInterface;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;

class InputRobotFactory {
    private static final inputRobotFactory : InputRobotFactory = new InputRobotFactory();
    // throws Exception
    public static function getInstance() : InputRobotFactory {
        return InputRobotFactory.inputRobotFactory;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    private var helpSetListenerInterface : HelpSetListener = null;
    public function new() {
        try {
            final graphenv : GraphicsEnvironment = GraphicsEnvironment.getLocalGraphicsEnvironment();
            final screens : haxe.ds.Vector<GraphicsDevice> = graphenv.getScreenDevices();
            var inputRobotInterface : InputRobotInterface = null;
            for (i in 0...screens.length) {
                inputRobotInterface = (cast new InputRobot(screens[i]) : InputRobotInterface);
                this.logUtil.putF("Adding Robot: " + inputRobotInterface.getName(), this, "getRobots");
                this.get().put(inputRobotInterface.getName(), inputRobotInterface);
            }
            this.logUtil.putF("Number Of Robots: " + this.hashtable.size(), this, "getRobots");
        } catch (e : haxe.Exception) {
            this.logUtil.putF(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR);
        }
    }

    public function addListener(helpSetListenerInterface : HelpSetListener) : Void {
        this.helpSetListenerInterface = helpSetListenerInterface;
    }

    // throws Exception
    public function add(inputRobotInterface : InputRobotInterface) : Void {
        this.logUtil.putF("Adding InputRobotInterface: " + inputRobotInterface.getName(), this, "add");
        this.get().put(inputRobotInterface.getName(), inputRobotInterface);
        final helpSet : HelpSet = inputRobotInterface.getHelpSet();
        if (this.helpSetListenerInterface != null) {
            if (helpSet != null) {
                if (!JavaHelpSetNotifier.isNotified(helpSet)) {
                    final helpSetEvent : HelpSetEvent = new HelpSetEvent(this, helpSet, HelpSetEvent.HELPSET_ADDED);
                    this.helpSetListenerInterface.helpSetAdded(helpSetEvent);
                }
            } else {
                this.logUtil.putF("Null HelpSet For: " + inputRobotInterface.getName(), this, "add");
            }
        } else {
            this.logUtil.putF("No HelpSet Listener", this, "add");
        }
    }

    // throws Exception
    public function loadLibraries() : Void {
        final set : Set = this.get().keySet();
        this.logUtil.putF("Loading Libraries", this, "loadLibraries");
        final nameArray : haxe.ds.Vector<Any> = set.toArray();
        final size : Int = nameArray.length;
        for (index in 0...size) {
            var inputRobotInterface : InputRobotInterface = InputRobotFactory.getInstance().get((cast nameArray[index] : String));
            InputRobotFactory.loadLibrary(inputRobotInterface);
        }
    }

    // throws Exception
    public static function loadLibraries(collection : Collection) : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        logUtil.putF("Loading Libraries", "InputRobotFactory", "loadLibraries");
        final iterator : Iterator = collection.iterator();
        while (iterator.hasNext()) {
            InputRobotFactory.loadLibrary((cast iterator.next() : InputRobotInterface));
        }
    }

    // throws Exception
    public static function loadLibrary(inputRobotInterface : InputRobotInterface) : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        if (InterfaceUtil.isImplemented(SecuredNativeLibraryInterface, inputRobotInterface)) {
            logUtil.putF("Loading Library: " + inputRobotInterface.getName(), "InputRobotFactory", "loadLibraries");
            final securedNativeLibraryInterface : SecuredNativeLibraryInterface = (cast inputRobotInterface : SecuredNativeLibraryInterface);
            securedNativeLibraryInterface.load();
        }
    }

    // throws Exception
    public function unloadLibraries() : Void {
        this.logUtil.putF("Unloading Libraries", this, "unloadLibraries");
        final set : Set = this.get().keySet();
        var inputRobotInterface : InputRobotInterface = null;
        final inputRobotArray : haxe.ds.Vector<Any> = set.toArray();
        final size : Int = inputRobotArray.length;
        for (index in 0...size) {
            inputRobotInterface = this.get((cast inputRobotArray[index] : String));
            if (InterfaceUtil.isImplemented(SecuredNativeLibraryInterface, inputRobotInterface)) {
                this.logUtil.putF("Unloading Library: " + inputRobotInterface.getName(), this, "unloadLibraries");
                var securedNativeLibraryInterface : SecuredNativeLibraryInterface = (cast inputRobotInterface : SecuredNativeLibraryInterface);
                securedNativeLibraryInterface.unload();
            }
        }
    }

    // throws Exception
    public function get() : ABHashtable<Any, Any> {
        return this.hashtable;
    }

    public function get(name : String) : InputRobotInterface {
        this.logUtil.putF("Getting Robot: " + name, this, "getRobots");
        return (cast this.hashtable.get(name) : InputRobotInterface);
    }

}

