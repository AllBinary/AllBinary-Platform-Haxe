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
package org.allbinary.input.automation.osgi;

//import javax.swing.*;
import org.osgi.framework.Bundle;
import org.osgi.framework.BundleContext;
import bundle.input.automation.InputAutomationBundleActivator;
import org.allbinary.gui.dialog.BasicTextJDialog;

class DesktopBundle {
    private static final DESKTOP_SYMBOLIC_NAME : String = "org.knopflerfish.bundle.desktop";
    private var bundle : Bundle = null;
    public function new() {
        var bundleContext : BundleContext = InputAutomationBundleActivator.getBundleContext();
        if (bundleContext != null) {
            var bundleArray : haxe.ds.Vector<Bundle> = bundleContext.getBundles();
            for (index in 0...bundleArray.length) {
                var bundle : Bundle = bundleArray[index];
                var symbolicName : String = bundle.getSymbolicName();
                if (Reflect.compare(symbolicName, DesktopBundle.DESKTOP_SYMBOLIC_NAME) == 0) {
                    this.bundle = bundle;
                }
            }
        } else {
            var textJDialog : JDialog = new BasicTextJDialog("BundlContext is Null");
            textJDialog.setVisible(true);
        }
    }

    // throws Exception
    public function start() : Void {
        this.bundle.start();
    }

}

