/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
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
package org.allbinary.graphics.displayable.screen;

//import java.awt.Desktop;
import jre.net.URI;
import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class WebCommandProcessor {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : WebCommandProcessor = new WebCommandProcessor();
    public static function getInstance() : WebCommandProcessor {
        return WebCommandProcessor.instance;
    }

    private final aboutCommandProcessor : AboutCommandProcessor = AboutCommandProcessor.getInstance();
    public final list : BasicArrayList = new BasicArrayListD();
    public function process(midletCommandListener : CommandListener, command : Command, canvas : Canvas) : Void {
        try {
            if (Desktop.isDesktopSupported() && Desktop.getDesktop().isSupported(Desktop.Action.BROWSE)) {
                Desktop.getDesktop().browse(new URI((cast this.list.removeAt(0) : String)));
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e);
        }
    }

    public function new() {
    }
}

