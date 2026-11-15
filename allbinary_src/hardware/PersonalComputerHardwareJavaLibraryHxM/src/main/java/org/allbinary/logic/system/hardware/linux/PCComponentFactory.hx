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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory;
import org.allbinary.logic.communication.log.config.type.LogConfigTypes;
import org.allbinary.logic.system.hardware.components.ComponentFactory;
import org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface;
import org.allbinary.logic.system.hardware.components.linux.Bridge;
import org.allbinary.logic.system.hardware.components.linux.Ethernet;
import org.allbinary.logic.system.hardware.components.linux.HardDriveController;
import org.allbinary.logic.system.hardware.components.linux.Media;
import org.allbinary.logic.system.hardware.components.linux.PCI;
import org.allbinary.logic.system.hardware.components.linux.Unknown;
import org.allbinary.logic.system.hardware.components.linux.Usb;
import org.allbinary.logic.system.hardware.components.linux.Video;
import org.allbinary.string.CommonStrings;

class PCComponentFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : PCComponentFactory = new PCComponentFactory();
    public static function getInstance() : PCComponentFactory {
        return PCComponentFactory.instance;
    }

    private final componentFactory : ComponentFactory = ComponentFactory.getInstance();
    public function new() {
    }

    public function getInstance(component : String, componentData : String) : HardwareComponentInterface {
        try {
            if (component != null) {
                if (Reflect.compare(component, this.componentFactory.ETHERNET.toString()) == 0) {
                    return (cast new Ethernet(componentData) : HardwareComponentInterface);
                } else if (Reflect.compare(component, this.componentFactory.BRIDGE.toString()) == 0) {
                    return (cast new Bridge(componentData) : HardwareComponentInterface);
                } else if (Reflect.compare(component, this.componentFactory.IDE.toString()) == 0) {
                    return (cast new HardDriveController(componentData) : HardwareComponentInterface);
                } else if (Reflect.compare(component, this.componentFactory.MULTIMEDIA.toString()) == 0) {
                    return (cast new Media(componentData) : HardwareComponentInterface);
                } else if (Reflect.compare(component, this.componentFactory.SCSI.toString()) == 0) {
                    return (cast new HardDriveController(componentData) : HardwareComponentInterface);
                } else if (Reflect.compare(component, this.componentFactory.USB.toString()) == 0) {
                    return (cast new Usb(componentData) : HardwareComponentInterface);
                } else if (Reflect.compare(component, this.componentFactory.VGA.toString()) == 0) {
                    return (cast new Video(componentData) : HardwareComponentInterface);
                } else if (Reflect.compare(component, this.componentFactory.PCI.toString()) == 0) {
                    return (cast new PCI(componentData) : HardwareComponentInterface);
                }
            }
            return (cast new Unknown(componentData) : HardwareComponentInterface);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().FACTORYERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
            }
            return new Unknown(commonStrings.EXCEPTION);
        }
    }

    public function getComponentType(component : String) : String {
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
        } else if (Reflect.compare(component, this.componentFactory.PCI.toString()) == 0) {
            return this.componentFactory.PCI.toString();
        }
        return this.componentFactory.UNKNOWN.toString();
    }

}

