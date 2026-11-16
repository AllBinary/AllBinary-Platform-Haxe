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
package org.allbinary.logic.system.hardware.linux;

import jre.io.FileReader;
import jre.io.LineNumberReader;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory;
import org.allbinary.logic.communication.log.config.type.LogConfigTypes;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FilePathData;
import org.allbinary.logic.io.file.directory.SubDirectory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.hardware.HardwareInterface;
import org.allbinary.logic.system.hardware.components.interfaces.BridgeInterface;
import org.allbinary.logic.system.hardware.components.interfaces.CpuInterface;
import org.allbinary.logic.system.hardware.components.interfaces.EthernetInterface;
import org.allbinary.logic.system.hardware.components.interfaces.FireWireInterface;
import org.allbinary.logic.system.hardware.components.interfaces.HardDriveControllerInterface;
import org.allbinary.logic.system.hardware.components.interfaces.HardDriveInterface;
import org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface;
import org.allbinary.logic.system.hardware.components.interfaces.MachineAccessControlAddressInterface;
import org.allbinary.logic.system.hardware.components.interfaces.MediaInterface;
import org.allbinary.logic.system.hardware.components.interfaces.MonitorInterface;
import org.allbinary.logic.system.hardware.components.interfaces.UsbInterface;
import org.allbinary.logic.system.hardware.components.interfaces.VideoInterface;
import org.allbinary.logic.system.hardware.components.linux.Cpu;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;

class LinuxHardware implements HardwareInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var componentInterfaceVector : BasicArrayList = null;
    private var videoInterfaceVector : BasicArrayList = null;
    private var hardDriveControllerInterfaceVector : BasicArrayList = null;
    private var cpuInterfaceVector : BasicArrayList = null;
    private var usbInterfaceVector : BasicArrayList = null;
    private var ethernetInterfaceVector : BasicArrayList = null;
    private var multimediaInterfaceVector : BasicArrayList = null;
    private var fireWireInterfaceVector : BasicArrayList = null;
    private var bridgeInterfaceVector : BasicArrayList = null;
    private var hardDriveInterfaceVector : BasicArrayList = null;
    private var macInterfaceVector : BasicArrayList = null;
    private var monitorInterfaceVector : BasicArrayList = null;
    private static final PCIFILE : String = "/proc/pci";
    private final NAME : String = "Linux Hardware Profile";
    private final MINHARDWARE : Int = 5;
    public function new(...args : Dynamic) {
        if (args.length == 1) {
            final path : String = args[0];
            this._newLinuxHardware0(path);
        }
        else if (args.length == 0) {
            this._newLinuxHardware1();
        }
    }

    private function _newLinuxHardware0(path : String) : Void {
        this.init(path);
    }

    private function _newLinuxHardware1() : Void {
        this.init(PCIFILE);
        if (this.componentInterfaceVector.size() < this.MINHARDWARE) {
            throw new jre.lang.JavaException("Not Enough Data For A Valid License On Linux");
        }
        var cpu : Cpu = new Cpu();
        if (cpu != null) {
            this.cpuInterfaceVector.add(cpu);
            this.componentInterfaceVector.add(cpu);
        }
        if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().OS)) {
            this.logUtil.putF("Hardware Data: " + Std.string(this), this, this.commonStrings.CONSTRUCTOR);
        }
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
                this.logUtil.put("Hardware Data: " + Std.string(this), this, this.commonStrings.CONSTRUCTOR, e);
            }
            throw e;
        }
    }

    // throws Exception
    private function init_LineNumberReader_String(lineNumberReader : LineNumberReader, filePath : String) : Void {
        try {
            this.componentInterfaceVector = new BasicArrayListD();
            this.videoInterfaceVector = new BasicArrayListD();
            this.hardDriveControllerInterfaceVector = new BasicArrayListD();
            this.cpuInterfaceVector = new BasicArrayListD();
            this.usbInterfaceVector = new BasicArrayListD();
            this.ethernetInterfaceVector = new BasicArrayListD();
            this.multimediaInterfaceVector = new BasicArrayListD();
            this.fireWireInterfaceVector = new BasicArrayListD();
            this.bridgeInterfaceVector = new BasicArrayListD();
            this.hardDriveInterfaceVector = new BasicArrayListD();
            this.macInterfaceVector = new BasicArrayListD();
            this.monitorInterfaceVector = new BasicArrayListD();
            var pciFile : FileReader = new FileReader(filePath);
            lineNumberReader = new LineNumberReader(pciFile);
            if (lineNumberReader == null) {
                final fileVector : BasicArrayList = SubDirectory.getInstance().search(filePath, AbFile.createAbFile(FilePathData.getInstance().PATH_START));
                if (!fileVector.isEmpty()) {
                    final file : AbFile = (cast fileVector.get(0) : AbFile);
                    lineNumberReader = new LineNumberReader(new FileReader(file.getPath()));
                }
                if (lineNumberReader == null) {
                    throw new jre.lang.JavaException("No Linux File Data");
                }
            }
            if (lineNumberReader != null) {
                if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().OS)) {
                    this.logUtil.putF("PCI File Found", this, this.commonStrings.CONSTRUCTOR);
                }
                var nextLine : String = lineNumberReader.readLine();
                while (nextLine != null) {
                    if (this.isNextHardware(nextLine)) {
                        break;
                    }
                    nextLine = lineNumberReader.readLine();
                }
                while (this.isNextHardware(nextLine)) {
                    var componentData : StringMaker = new StringMaker();
                    if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().OS)) {
                        this.logUtil.putF("Found Hardware Device: " + this.componentInterfaceVector.size(), this, this.commonStrings.CONSTRUCTOR);
                    }
                    componentData.append(nextLine);
                    componentData.append(CommonSeps.getInstance().NEW_LINE);
                    nextLine = lineNumberReader.readLine();
                    var componentType : String = PCComponentFactory.getInstance().getComponentType(nextLine);
                    while (true) {
                        componentData.append(nextLine);
                        componentData.append(CommonSeps.getInstance().NEW_LINE);
                        nextLine = lineNumberReader.readLine();
                        if (nextLine == null || this.isNextHardware(nextLine)) {
                            break;
                        }
                    }
                    var componentInterface : HardwareComponentInterface = PCComponentFactory.getInstance().getInstanceFor(componentType, Std.string(componentData));
                    if (componentInterface != null) {
                        this.componentInterfaceVector.add(componentInterface);
                    }
                }
            } else {
                if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().OS)) {
                    this.logUtil.putF("Could not load PCI File", this, this.commonStrings.CONSTRUCTOR);
                }
            }
            lineNumberReader.close();
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            if (lineNumberReader != null) {
                lineNumberReader.close();
            }
        }
    }

    public function getMultimedia(index : Int) : MediaInterface {
        return (cast this.multimediaInterfaceVector.get(index) : MediaInterface);
    }

    public function getBridge(index : Int) : BridgeInterface {
        return (cast this.bridgeInterfaceVector.get(index) : BridgeInterface);
    }

    public function getCpu(index : Int) : CpuInterface {
        return (cast this.cpuInterfaceVector.get(index) : CpuInterface);
    }

    public function getEthernet(index : Int) : EthernetInterface {
        return (cast this.ethernetInterfaceVector.get(index) : EthernetInterface);
    }

    public function getFireWire(index : Int) : FireWireInterface {
        return (cast this.fireWireInterfaceVector.get(index) : FireWireInterface);
    }

    public function getHardDriveController(index : Int) : HardDriveControllerInterface {
        return (cast this.hardDriveControllerInterfaceVector.get(index) : HardDriveControllerInterface);
    }

    public function getHardDrive(index : Int) : HardDriveInterface {
        return (cast this.hardDriveInterfaceVector.get(index) : HardDriveInterface);
    }

    public function getMachineAccessControlAddress(index : Int) : MachineAccessControlAddressInterface {
        return (cast this.macInterfaceVector.get(index) : MachineAccessControlAddressInterface);
    }

    public function getMonitor(index : Int) : MonitorInterface {
        return (cast this.monitorInterfaceVector.get(index) : MonitorInterface);
    }

    public function getUsb(index : Int) : UsbInterface {
        return (cast this.usbInterfaceVector.get(index) : UsbInterface);
    }

    public function getVideo(index : Int) : VideoInterface {
        return (cast this.videoInterfaceVector.get(index) : VideoInterface);
    }

    public function getComponent(index : Int) : HardwareComponentInterface {
        return (cast this.componentInterfaceVector.get(index) : HardwareComponentInterface);
    }

    public function toString() : String {
        final hardwareBuffer : StringMaker = new StringMaker();
        final size : Int = this.componentInterfaceVector.size();
        for (index in 0...size) {
            var componentInterface : HardwareComponentInterface = (cast this.componentInterfaceVector.get(index) : HardwareComponentInterface);
            hardwareBuffer.append("Component ");
            hardwareBuffer.appendint(index);
            hardwareBuffer.append(": \n");
            hardwareBuffer.append(Std.string(componentInterface));
            hardwareBuffer.append(CommonSeps.getInstance().NEW_LINE);
        }
        return Std.string(hardwareBuffer);
    }

    public function compareTo(hardwareInterface : HardwareInterface) : Bool {
        return true;
    }

    public function difference(hardwareInterface : HardwareInterface) : ABHashtable<Any, Any> {
        return StdUtil.getInstance().NULL_TABLE;
    }

    public function isNextHardware(nextLine : String) : Bool {
        if (nextLine != null) {
            var index : Int = nextLine.indexOf("Bus");
            if (index >= 0 && index < 4) {
                return true;
            }
        }
        return false;
    }

}

