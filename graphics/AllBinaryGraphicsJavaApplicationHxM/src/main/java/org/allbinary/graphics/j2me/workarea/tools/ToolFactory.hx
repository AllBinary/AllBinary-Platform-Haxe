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
package org.allbinary.graphics.j2me.workarea.tools;

import org.allbinary.graphics.j2me.StatusFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class ToolFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ToolFactory = new ToolFactory();
    public static function getInstance() : ToolFactory {
        return ToolFactory.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var selectedTool : GraphicsItemInterfaceFactoryInterface = null;
    private var tool : String = null;
    private final SELECTED_LABEL : String = "Selected: ";
    public function setSelectedTool(tool : String) : Void {
        try {
            StatusFactory.getInstance().setStatus(this.SELECTED_LABEL + tool);
            this.tool = tool;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "setSelectionTool", e);
        }
    }

    public function getSelectedToolFactory() : GraphicsItemInterfaceFactoryInterface {
        StatusFactory.getInstance().setStatus("Tool In Use: " + this.tool);
        if (this.tool != null) {
            this.selectedTool = GraphicItemFactory.getInstance().getInstance(this.tool);
            this.logUtil.putF("New Tool: " + this.selectedTool, this, "getSelectedToolFactory");
            return this.selectedTool;
        } else {
            return null;
        }
    }

    public function new() {
    }
}

