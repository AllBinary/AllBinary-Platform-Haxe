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

import org.allbinary.string.CommonSeps;

class MouseStrings {
    private static final instance : MouseStrings = new MouseStrings();
    public static function getInstance() : MouseStrings {
        return MouseStrings.instance;
    }

    public final MOUSE_PRESSED : String = "mousePressed";
    public final MOUSE_RELEASED : String = "mouseReleased";
    public final MOUSE_CLICKED : String = "mouseClicked";
    public final MOUSE_DRAGGED : String = "mouseDragged";
    public final MOUSE_MOVED : String = "mouseMoved";
    public final MOUSE_PRESSED_LABEL : String = "MousePressed" + CommonSeps.getInstance().COLON_SEP;
    public final MOUSE_RELEASED_LABEL : String = "MouseReleased" + CommonSeps.getInstance().COLON_SEP;
    public final MOUSE_CLICKED_LABEL : String = "MouseClicked" + CommonSeps.getInstance().COLON_SEP;
    public final MOUSE_DRAGGED_LABEL : String = "MouseDragged" + CommonSeps.getInstance().COLON_SEP;
    public final MOUSE_MOVED_LABEL : String = "MouseMoved" + CommonSeps.getInstance().COLON_SEP;
    public function new() {
    }
}

