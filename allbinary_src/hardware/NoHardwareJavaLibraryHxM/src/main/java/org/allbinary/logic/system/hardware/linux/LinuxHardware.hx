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

import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringUtil;
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
import org.allbinary.util.ABHashtable;

class LinuxHardware implements HardwareInterface {
    public function new() {
    }

    public function getMultimedia(index : Int) : MediaInterface {
        throw new jre.lang.JavaException();
    }

    public function getBridge(index : Int) : BridgeInterface {
        throw new jre.lang.JavaException();
    }

    public function getCpu(index : Int) : CpuInterface {
        throw new jre.lang.JavaException();
    }

    public function getEthernet(index : Int) : EthernetInterface {
        throw new jre.lang.JavaException();
    }

    public function getFireWire(index : Int) : FireWireInterface {
        throw new jre.lang.JavaException();
    }

    public function getHardDriveController(index : Int) : HardDriveControllerInterface {
        throw new jre.lang.JavaException();
    }

    public function getHardDrive(index : Int) : HardDriveInterface {
        throw new jre.lang.JavaException();
    }

    public function getMachineAccessControlAddress(index : Int) : MachineAccessControlAddressInterface {
        throw new jre.lang.JavaException();
    }

    public function getMonitor(index : Int) : MonitorInterface {
        throw new jre.lang.JavaException();
    }

    public function getUsb(index : Int) : UsbInterface {
        throw new jre.lang.JavaException();
    }

    public function getVideo(index : Int) : VideoInterface {
        throw new jre.lang.JavaException();
    }

    public function getComponent(index : Int) : HardwareComponentInterface {
        throw new jre.lang.JavaException();
    }

    public function toString() : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    public function compareTo(hardwareInterface : HardwareInterface) : Bool {
        return true;
    }

    public function difference(hardwareInterface : HardwareInterface) : ABHashtable<Any, Any> {
        return StdUtil.getInstance().NULL_TABLE;
    }

    public function isNextHardware(nextLine : String) : Bool {
        return false;
    }

}

