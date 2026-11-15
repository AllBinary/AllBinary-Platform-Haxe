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
package org.allbinary.logic.system.hardware.windows;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.hardware.HardwareInterface;
import org.allbinary.logic.system.hardware.components.ComponentFactory;
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
import org.allbinary.string.CommonSeps;
import org.allbinary.util.ABHashtable;

class WindowsHardware implements HardwareInterface {
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
    private final NAME : String = "Windows Hardware Profile";
    private final MINHARDWARE : Int = 0;
    private final componentFactory : ComponentFactory = ComponentFactory.getInstance();
    public function new() {
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
            if (this.componentInterfaceVector.size() < this.MINHARDWARE) {
                throw new haxe.Exception("Not Enough Data For A Valid License On Windows");
            }
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    private function getComponentType(component : String) : String {
        if (component.indexOf(this.componentFactory.ETHERNET.toString()) >= 0) {
            return this.componentFactory.ETHERNET.toString();
        } else if (component.indexOf(this.componentFactory.BRIDGE.toString()) >= 0) {
            return this.componentFactory.BRIDGE.toString();
        } else if (component.indexOf(this.componentFactory.IDE.toString()) >= 0) {
            return this.componentFactory.IDE.toString();
        } else if (component.indexOf(this.componentFactory.MULTIMEDIA.toString()) >= 0) {
            return this.componentFactory.MULTIMEDIA.toString();
        } else if (component.indexOf(this.componentFactory.SCSI.toString()) >= 0) {
            return this.componentFactory.SCSI.toString();
        } else if (component.indexOf(this.componentFactory.USB.toString()) >= 0) {
            return this.componentFactory.USB.toString();
        } else if (component.indexOf(this.componentFactory.VGA.toString()) >= 0) {
            return this.componentFactory.VGA.toString();
        } else {
            return null;
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
            hardwareBuffer.append(componentInterface.toString());
            hardwareBuffer.append(CommonSeps.getInstance().NEW_LINE);
        }
        return hardwareBuffer.toString();
    }

    public function compareTo(hardwareInterface : HardwareInterface) : Bool {
        return true;
    }

    public function difference(hardwareInterface : HardwareInterface) : ABHashtable<Any, Any> {
        return StdUtil.getInstance().NULL_TABLE;
    }

}

