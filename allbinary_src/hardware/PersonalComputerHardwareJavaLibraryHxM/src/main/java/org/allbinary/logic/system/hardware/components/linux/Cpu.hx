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
package org.allbinary.logic.system.hardware.components.linux;

import jre.io.FileReader;
import jre.io.LineNumberReader;
import jre.util.HashMap;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory;
import org.allbinary.logic.communication.log.config.type.LogConfigTypes;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FilePathData;
import org.allbinary.logic.io.file.directory.SubDirectory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.hardware.components.interfaces.CpuInterface;
import org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

class Cpu implements CpuInterface implements HardwareComponentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final CPUFILE : String = "/proc/cpuinfo";
    private var cpuHashMap : HashMap<Dynamic, Dynamic> = null;
    public function new(...args : Dynamic) {
        if (args.length == 1) {
            final filePath : String = args[0];
            this._newCpu0(filePath);
        }
        else if (args.length == 0) {
            this._newCpu1();
        }
    }

    private function _newCpu0(filePath : String) : Void {
        this.init(filePath);
    }

    private function _newCpu1() : Void {
        this.init(this.CPUFILE);
    }

    private function init(...args : Dynamic) : Dynamic {
        if (args.length == 1) {
            this.init_String(args[0]);
            return null;
        }
        if (args.length == 2) {
            this.init_LineNumberReader_String(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: init");
    }

    // throws Exception
    private function init_String(filePath : String) : Void {
        var lineNumberReader : LineNumberReader = null;
        try {
            this.init(lineNumberReader, filePath);
        } catch (e : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().OS)) {
                this.logUtil.put(Std.string(new StringMaker().append("Cpu Data: ").append(Std.string(this))), this, this.commonStrings.CONSTRUCTOR, e);
            }
            throw e;
        }
    }

    // throws Exception
    private function init_LineNumberReader_String(lineNumberReader : LineNumberReader, filePath : String) : Void {
        try {
            var fileReader : FileReader = new FileReader(filePath);
            lineNumberReader = new LineNumberReader(fileReader);
            this.cpuHashMap = StdUtil.getInstance().createHashMap();
            if (lineNumberReader == null) {
                final fileVector : BasicArrayList = SubDirectory.getInstance().search(filePath, AbFile.createAbFile(FilePathData.getInstance().PATH_START));
                if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().OS)) {
                    this.logUtil.putF(Std.string(new StringMaker().append("Cpu File BasicArrayList Size: ").appendint(fileVector.size())), this, this.commonStrings.CONSTRUCTOR);
                }
                if (!fileVector.isEmpty()) {
                    var file : AbFile = (cast fileVector.get(0) : AbFile);
                    lineNumberReader = new LineNumberReader(new FileReader(file.getPath()));
                }
            }
            if (lineNumberReader != null) {
                var nextLine : String = lineNumberReader.readLine();
                while (nextLine != null) {
                    var index : Int = nextLine.indexOf(String.fromCharCode(":".code));
                    if (index >= 0) {
                        var key : String = nextLine.substring(0, index);
                        var valueIndex : Int = index + 1;
                        var value : String = nextLine.substring(valueIndex, nextLine.length);
                        if (key.indexOf(jre.lang.JavaString.text(Std.string(CpuInfo.PROCESSOR))) >= 0) {
                            this.cpuHashMap.put(CpuInfo.PROCESSOR, value);
                        }
                        if (key.indexOf(jre.lang.JavaString.text(Std.string(CpuInfo.VENDORID))) >= 0) {
                            this.cpuHashMap.put(CpuInfo.VENDORID, value);
                        }
                        if (key.indexOf(jre.lang.JavaString.text(Std.string(CpuInfo.CPUFAMILY))) >= 0) {
                            this.cpuHashMap.put(CpuInfo.CPUFAMILY, value);
                        }
                        if (key.indexOf(jre.lang.JavaString.text(Std.string(CpuInfo.MODEL))) >= 0) {
                            this.cpuHashMap.put(CpuInfo.MODEL, value);
                        }
                        if (key.indexOf(jre.lang.JavaString.text(Std.string(CpuInfo.MODELNAME))) >= 0) {
                            this.cpuHashMap.put(CpuInfo.MODELNAME, value);
                        }
                        if (key.indexOf(jre.lang.JavaString.text(Std.string(CpuInfo.STEPPING))) >= 0) {
                            this.cpuHashMap.put(CpuInfo.STEPPING, value);
                        }
                        if (key.indexOf(jre.lang.JavaString.text(Std.string(CpuInfo.CPUMHZ))) >= 0) {
                            this.cpuHashMap.put(CpuInfo.CPUMHZ, value);
                        }
                        if (key.indexOf(jre.lang.JavaString.text(Std.string(CpuInfo.CACHESIZE))) >= 0) {
                            this.cpuHashMap.put(CpuInfo.CACHESIZE, value);
                        }
                    }
                    nextLine = lineNumberReader.readLine();
                }
            }
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            if (lineNumberReader != null) {
                lineNumberReader.close();
            }
        }
    }

    public function getProcessor() : String {
        return (cast this.cpuHashMap.get(CpuInfo.PROCESSOR) : String);
    }

    public function getVendorId() : String {
        return (cast this.cpuHashMap.get(CpuInfo.VENDORID) : String);
    }

    public function getCpuFamily() : String {
        return (cast this.cpuHashMap.get(CpuInfo.CPUFAMILY) : String);
    }

    public function getModel() : String {
        return (cast this.cpuHashMap.get(CpuInfo.MODEL) : String);
    }

    public function getModelName() : String {
        return (cast this.cpuHashMap.get(CpuInfo.MODELNAME) : String);
    }

    public function getStepping() : String {
        return (cast this.cpuHashMap.get(CpuInfo.STEPPING) : String);
    }

    public function getCpuSpeed() : String {
        return (cast this.cpuHashMap.get(CpuInfo.CPUMHZ) : String);
    }

    public function getCacheSize() : String {
        return (cast this.cpuHashMap.get(CpuInfo.CACHESIZE) : String);
    }

    public function compareTo(...args : Dynamic) : Dynamic {
        if (args.length == 1 && Std.isOfType(args[0], CpuInterface)) {
            return this.compareTo_CpuInterface(args[0]);
        }
        if (args.length == 1) {
            return this.compareTo_HardwareComponentInterface(args[0]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: compareTo");
    }

    public function compareTo_CpuInterface(cpuInterface : CpuInterface) : Bool {
        return true;
    }

    public function compareTo_HardwareComponentInterface(componentInterface : HardwareComponentInterface) : Bool {
        return true;
    }

    public function toString() : String {
        final commonLabels : CommonLabels = CommonLabels.getInstance();
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final stringMaker : StringMaker = new StringMaker();
        stringMaker.append(Std.string(CpuInfo.PROCESSOR)).append(commonLabels.COLON_SEP).append(this.getProcessor());
        stringMaker.append(commonSeps.NEW_LINE);
        stringMaker.append(Std.string(CpuInfo.VENDORID)).append(commonLabels.COLON_SEP).append(this.getVendorId());
        stringMaker.append(commonSeps.NEW_LINE);
        stringMaker.append(Std.string(CpuInfo.CPUFAMILY)).append(commonLabels.COLON_SEP).append(this.getCpuFamily());
        stringMaker.append(commonSeps.NEW_LINE);
        stringMaker.append(Std.string(CpuInfo.MODEL)).append(commonLabels.COLON_SEP).append(this.getModel());
        stringMaker.append(commonSeps.NEW_LINE);
        stringMaker.append(Std.string(CpuInfo.MODELNAME)).append(commonLabels.COLON_SEP).append(this.getModelName());
        stringMaker.append(commonSeps.NEW_LINE);
        stringMaker.append(Std.string(CpuInfo.STEPPING)).append(commonLabels.COLON_SEP).append(this.getStepping());
        stringMaker.append(commonSeps.NEW_LINE);
        stringMaker.append(Std.string(CpuInfo.CPUMHZ)).append(commonLabels.COLON_SEP).append(this.getCpuSpeed());
        stringMaker.append(commonSeps.NEW_LINE);
        stringMaker.append(Std.string(CpuInfo.CACHESIZE)).append(commonLabels.COLON_SEP).append(this.getCacheSize());
        return Std.string(stringMaker);
    }

}

