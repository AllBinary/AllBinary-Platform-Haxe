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
package org.allbinary.logic.system.hardware.components;

import org.allbinary.string.CommonStrings;

class ComponentFactory {
    private static final instance : ComponentFactory = new ComponentFactory();
    public static function getInstance() : ComponentFactory {
        return ComponentFactory.instance;
    }

    public final VGA : Component = new Component("VGA");
    public final IDE : Component = new Component("IDE");
    public final SCSI : Component = new Component("SCSI");
    public final BRIDGE : Component = new Component("bridge");
    public final ETHERNET : Component = new Component("Ethernet");
    public final USB : Component = new Component("USB");
    public final MULTIMEDIA : Component = new Component("Multimedia");
    public final PCI : Component = new Component("PCI");
    public final RAID : Component = new Component("RAID");
    public final SMBUS : Component = new Component("SMBus");
    public final PIC : Component = new Component("PIC");
    public final Class : Component = new Component("Class");
    public final UNKNOWN : Component = new Component(CommonStrings.getInstance().UNKNOWN);
    public function new() {
    }
}

