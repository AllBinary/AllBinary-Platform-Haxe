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
package org.allbinary.logic.control.contraints.display.browser;

import org.w3c.dom.Node;

class DisplayInBrowserContraints implements DisplayInBrowserContraintsInterface {
    private var frameable : Bool = false;
    private var mountable : Bool = false;
    private var quickFrameable : Bool = false;
    private var mountedLink : String = null;
    public function new(node : Node) {
    }

    public function isMountable() : Bool {
        return this.mountable;
    }

    public function setMountable(mountable : Bool) : Void {
        this.mountable = mountable;
    }

    public function isFrameable() : Bool {
        return this.frameable;
    }

    public function setFrameable(frameable : Bool) : Void {
        this.frameable = frameable;
    }

    public function isQuickFrameable() : Bool {
        return this.quickFrameable;
    }

    public function setQuickFrameable(quickFrameable : Bool) : Void {
        this.quickFrameable = quickFrameable;
    }

    public function getMountedLink() : String {
        return this.mountedLink;
    }

    public function setMountedLink(mountedLink : String) : Void {
        this.mountedLink = mountedLink;
    }

}

