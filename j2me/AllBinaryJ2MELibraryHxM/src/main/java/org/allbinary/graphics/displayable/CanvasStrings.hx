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
package org.allbinary.graphics.displayable;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

class CanvasStrings {
    private static final instance : CanvasStrings = new CanvasStrings();
    public static function getInstance() : CanvasStrings {
        return CanvasStrings.instance;
    }

    public final CONSTRUCTOR : String = "MyCanvas::MyCanvas";
    public final PAUSE : String = "MyCanvas::pause";
    public final UN_PAUSE : String = "MyCanvas::unPause";
    public final SET_FULL_SCREEN_MODE : String = "setFullScreenMode";
    public final SIZE_CHANGED : String = "sizeChanged";
    public final SCALED_IMAGES : String = "scaledImages";
    public final PAINT : String = "paint";
    public final ON_DISPLAY_CHANGE_EVENT : String = "onDisplayChangeEvent";
    public final UPDATE_MEASUREMENT : String = "updateMeasurement";
    public final FD_WIDTH : String = " font/display width: ";
    public final FD_HEIGHT : String = " font/display height: ";
    public final EMPTY_CHILD_NAME_LIST : BasicArrayList = BasicArrayListUtil.getInstance().getImmutableInstance();
    public final ABOUT : String = "About";
    public final OPTIONS : String = "Options";
    public final FONT_ATLAS : String = "/font.png";
    public final OBJ_MODEL : String = "_obj";
    public final MD2_MODEL : String = "_md2";
    public final _PNG : String = ".png";
    public function new() {
    }
}

