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
package org.allbinary.logic.system.hardware.android;

import jre.io.Closeable;
import jre.io.FileReader;
import jre.io.LineNumberReader;
import org.allbinary.logic.io.NullCloseable;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.hardware.HardwareInterface;
import org.allbinary.logic.system.hardware.components.android.UnknownHardware;
import org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class AndroidHardware implements HardwareInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var componentInterfaceVector : BasicArrayList = new BasicArrayListD();
    private final PROC_BUS_INPUT_DIRECTORY : String = "/proc/bus/input/";
    private final DEVICES : String;
    private final MINHARDWARE : Int = 3;
    public function new() {
        this.DEVICES = this.PROC_BUS_INPUT_DIRECTORY + "devices/";
        this.init(this.DEVICES);
        final size : Int = this.componentInterfaceVector.size();
        if (size < this.MINHARDWARE) {
            throw new jre.lang.JavaException("Not Enough Data For A Valid License On Linux");
        }
    }

    // throws Exception
    private function init(filePath : String) : Void {
        var lineNumberReader : Closeable = NullCloseable.NULL_CLOSEABLE;
        try {
            lineNumberReader = this.get(filePath);
        } catch (e : haxe.Exception) {
            this.logUtil.put("Hardware Data: " + Std.string(this), this, this.commonStrings.INIT, e);
            throw e;
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            if (lineNumberReader != null) {
                lineNumberReader.close();
            }
        }
    }

    // throws Exception
    private function get(filePath : String) : LineNumberReader {
        this.componentInterfaceVector = new BasicArrayListD();
        final pciFile : FileReader = new FileReader(filePath);
        final lineNumberReader : LineNumberReader = new LineNumberReader(pciFile);
        this.logUtil.putF("File Found", this, this.commonStrings.CONSTRUCTOR);
        var nextLine : String = lineNumberReader.readLine();
        while (nextLine != null) {
            nextLine = lineNumberReader.readLine();
            this.componentInterfaceVector.add(new UnknownHardware(nextLine));
        }
        return lineNumberReader;
    }

    public function getComponent(index : Int) : HardwareComponentInterface {
        return (cast this.componentInterfaceVector.get(index) : HardwareComponentInterface);
    }

    public function toString() : String {
        final stringBuilder : StringMaker = new StringMaker();
        final size : Int = this.componentInterfaceVector.size();
        for (index in 0...size) {
            var componentInterface : HardwareComponentInterface = (cast this.componentInterfaceVector.get(index) : HardwareComponentInterface);
            stringBuilder.append(Std.string(componentInterface));
            stringBuilder.append(CommonSeps.getInstance().NEW_LINE);
        }
        return Std.string(stringBuilder);
    }

    public function compareTo(hardwareInterface : HardwareInterface) : Bool {
        return true;
    }

    public function difference(hardwareInterface : HardwareInterface) : ABHashtable<Any, Any> {
        return StdUtil.getInstance().NULL_TABLE;
    }

}

