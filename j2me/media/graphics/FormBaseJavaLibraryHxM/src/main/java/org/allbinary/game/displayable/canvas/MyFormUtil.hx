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
package org.allbinary.game.displayable.canvas;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.RectangleFactory;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.graphics.threed.SWTJOGLProcessor;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class MyFormUtil {
    private static final instance : MyFormUtil = new MyFormUtil();
    public static function getInstance() : MyFormUtil {
        return MyFormUtil.instance;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var popupMenuRectangle : Rectangle = RectangleFactory.SINGLETON;
    public function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        final features : Features = Features.getInstance();
        final isOpenGL : Bool = features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL);
        final TOTAL_CHAR_WIDTH : Int = (SWTJOGLProcessor.getInstance().isJOGL() && isOpenGL ? 2 : 3);
        final width : Int = MyFontProcessor.defaultStringWidth(font, TOTAL_CHAR_WIDTH);
        final pointFactory : PointFactory = PointFactory.getInstance();
        if (displayInfo.getLastHeight() < 320) {
            this.popupMenuRectangle = new Rectangle(pointFactory.createXY(0, 25), width, (font.getHeight() * 4) + 2);
        } else {
            this.popupMenuRectangle = new Rectangle(pointFactory.createXY(0, displayInfo.getLastHalfHeight() - 70), width, (font.getHeight() * 5));
        }
    }

    public function getPopupMenuRectangle() : Rectangle {
        return this.popupMenuRectangle;
    }

    public function new() {
    }
}

