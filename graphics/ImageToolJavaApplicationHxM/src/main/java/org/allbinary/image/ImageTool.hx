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
package org.allbinary.image;

import org.allbinary.thread.ARunnable;
import org.allbinary.image.gui.ImageToolJFrame;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class ImageTool {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
    }

    public static function main(args : haxe.ds.Vector<String>) : Void {
        java.awt.EventQueue.invokeLater(/* anonymous class body:
            public function run() : Void {
                final logUtil : LogUtil = LogUtil.getInstance();
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                try {
                    logUtil.putF(commonStrings.START, this, commonStrings.RUN);
                    new ImageToolJFrame().setVisible(true);
                } catch (e : haxe.Exception) {
                    logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                }
            }

*/ new ARunnable());
    }

}

