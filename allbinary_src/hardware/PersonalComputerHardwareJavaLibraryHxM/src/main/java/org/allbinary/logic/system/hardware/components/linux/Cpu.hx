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

//import java.io.FileReader;
//import java.io.LineNumberReader;
//import java.util.HashMap;
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
    private var cpuHashMap : HashMap = null;
    public function new(filePath : String) {
        this.init(filePath);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new() {
        this.init(this.CPUFILE);
    }

    // throws Exception
    private function init(filePath : String) : Void {
        var lineNumberReader : LineNumberReader = null;
        try {
            this.init(lineNumberReader, filePath);
        } catch (e : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().OS)) {
                this.logUtil.put(new StringMaker().append("Cpu Data: ").append(this.toString()).toString(), this, this.commonStrings.CONSTRUCTOR, e);
            }
            throw e;
        }
    }

    // throws Exception
    private function init(lineNumberReader : LineNumberReader, filePath : String) : Void {
        try {
            var fileReader : FileReader = new FileReader(filePath);
            lineNumberReader = new LineNumberReader(fileReader);
            this.cpuHashMap = StdUtil.getInstance().createHashMap();
            if (lineNumberReader == null) {
                final fileVector : BasicArrayList = SubDirectory.getInstance().search(filePath, AbFile.createAbFile(FilePathData.getInstance().PATH_START));
                if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().OS)) {
                    this.logUtil.putF(new StringMaker().append("Cpu File BasicArrayList Size: ").appendint(fileVector.size()).toString(), this, this.commonStrings.CONSTRUCTOR);
                }
                if (!fileVector.isEmpty()) {
                    var file : AbFile = (cast fileVector.get(0) : AbFile);
                    lineNumberReader = new LineNumberReader(new FileReader(file.getPath()));
                }
            }
            if (lineNumberReader != null) {
                var nextLine : String = lineNumberReader.readLine();
                while (lineNumberReader != null && nextLine != null) {
                    var index : Int = nextLine.indexOf(":".code);
                    if (index >= 0) {
                        var key : String = nextLine.substring(0, index);
                        var valueIndex : Int = index + 1;
                        var value : String = nextLine.substring(valueIndex, nextLine.length);
                        if (key.indexOf(CpuInfo.PROCESSOR.toString()) >= 0) {
                            this.cpuHashMap.put(CpuInfo.PROCESSOR, value);
                        }
                        if (key.indexOf(CpuInfo.VENDORID.toString()) >= 0) {
                            this.cpuHashMap.put(CpuInfo.VENDORID, value);
                        }
                        if (key.indexOf(CpuInfo.CPUFAMILY.toString()) >= 0) {
                            this.cpuHashMap.put(CpuInfo.CPUFAMILY, value);
                        }
                        if (key.indexOf(CpuInfo.MODEL.toString()) >= 0) {
                            this.cpuHashMap.put(CpuInfo.MODEL, value);
                        }
                        if (key.indexOf(CpuInfo.MODELNAME.toString()) >= 0) {
                            this.cpuHashMap.put(CpuInfo.MODELNAME, value);
                        }
                        if (key.indexOf(CpuInfo.STEPPING.toString()) >= 0) {
                            this.cpuHashMap.put(CpuInfo.STEPPING, value);
                        }
                        if (key.indexOf(CpuInfo.CPUMHZ.toString()) >= 0) {
                            this.cpuHashMap.put(CpuInfo.CPUMHZ, value);
                        }
                        if (key.indexOf(CpuInfo.CACHESIZE.toString()) >= 0) {
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

    public function compareTo(cpuInterface : CpuInterface) : Bool {
        return true;
    }

    public function compareTo(componentInterface : HardwareComponentInterface) : Bool {
        return true;
    }

    public function toString() : String {
        final commonLabels : CommonLabels = CommonLabels.getInstance();
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final stringMaker : StringMaker = new StringMaker();
        stringMaker.append(CpuInfo.PROCESSOR.toString()).append(commonLabels.COLON_SEP).append(this.getProcessor());
        stringMaker.append(commonSeps.NEW_LINE);
        stringMaker.append(CpuInfo.VENDORID.toString()).append(commonLabels.COLON_SEP).append(this.getVendorId());
        stringMaker.append(commonSeps.NEW_LINE);
        stringMaker.append(CpuInfo.CPUFAMILY.toString()).append(commonLabels.COLON_SEP).append(this.getCpuFamily());
        stringMaker.append(commonSeps.NEW_LINE);
        stringMaker.append(CpuInfo.MODEL.toString()).append(commonLabels.COLON_SEP).append(this.getModel());
        stringMaker.append(commonSeps.NEW_LINE);
        stringMaker.append(CpuInfo.MODELNAME.toString()).append(commonLabels.COLON_SEP).append(this.getModelName());
        stringMaker.append(commonSeps.NEW_LINE);
        stringMaker.append(CpuInfo.STEPPING.toString()).append(commonLabels.COLON_SEP).append(this.getStepping());
        stringMaker.append(commonSeps.NEW_LINE);
        stringMaker.append(CpuInfo.CPUMHZ.toString()).append(commonLabels.COLON_SEP).append(this.getCpuSpeed());
        stringMaker.append(commonSeps.NEW_LINE);
        stringMaker.append(CpuInfo.CACHESIZE.toString()).append(commonLabels.COLON_SEP).append(this.getCacheSize());
        return stringMaker.toString();
    }

}

