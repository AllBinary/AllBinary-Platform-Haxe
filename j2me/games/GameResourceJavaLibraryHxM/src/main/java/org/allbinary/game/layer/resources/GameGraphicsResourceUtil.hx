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
package org.allbinary.game.layer.resources;

import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GraphicsFeature;
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.graphics.opengles.OpenGLFeatureUtil;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class GameGraphicsResourceUtil {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : GameGraphicsResourceUtil {
        if (GameGraphicsResourceUtil.instance == NullUtil.getInstance().NULL_OBJECT) {
            GameGraphicsResourceUtil.instance = new GameGraphicsResourceUtil();
        }
        return (cast GameGraphicsResourceUtil.instance : GameGraphicsResourceUtil);
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    public final SPRITE : String = "_sprite";
    public final QUARTER : String = "_quarter";
    private var name : String = StringUtil.getInstance().EMPTY_STRING;
    public function new() {
        try {
            this.name = this.getString();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
        }
    }

    // throws Exception
    private function getString() : String {
        final graphicsFeatureFactory : GraphicsFeatureFactory = GraphicsFeatureFactory.getInstance();
        var graphicsFeature : GraphicsFeature = graphicsFeatureFactory.NONE;
        final features : Features = Features.getInstance();
        if (features.isFeature(graphicsFeatureFactory.IMAGE_TO_ARRAY_GRAPHICS)) {
            graphicsFeature = graphicsFeatureFactory.IMAGE_TO_ARRAY_GRAPHICS;
        } else if (features.isFeature(graphicsFeatureFactory.SPRITE_FULL_GRAPHICS)) {
            graphicsFeature = graphicsFeatureFactory.SPRITE_FULL_GRAPHICS;
        } else if (features.isFeature(graphicsFeatureFactory.SPRITE_QUARTER_ROTATION_GRAPHICS)) {
            graphicsFeature = graphicsFeatureFactory.SPRITE_QUARTER_ROTATION_GRAPHICS;
        } else if (features.isFeature(graphicsFeatureFactory.IMAGE_ROTATION_ON_THE_FLY)) {
            graphicsFeature = graphicsFeatureFactory.IMAGE_ROTATION_ON_THE_FLY;
        }
        return this.getStringForFeature(graphicsFeature);
    }

    // throws Exception
    public function getStringForFeature(graphicsFeature : GraphicsFeature) : String {
        final stringBuffer : StringMaker = new StringMaker();
        final graphicsFeatureFactory : GraphicsFeatureFactory = GraphicsFeatureFactory.getInstance();
        stringBuffer.delete(0, stringBuffer.length());
        final features : Features = Features.getInstance();
        if (features.isFeature(graphicsFeatureFactory.VECTOR_GRAPHICS)) {
        } else if (features.isFeature(graphicsFeatureFactory.IMAGE_GRAPHICS)) {
            if (graphicsFeature == graphicsFeatureFactory.IMAGE_TO_ARRAY_GRAPHICS || graphicsFeature == graphicsFeatureFactory.IMAGE_ROTATION_ON_THE_FLY) {
            } else if (graphicsFeature == graphicsFeatureFactory.SPRITE_FULL_GRAPHICS) {
                stringBuffer.append(this.SPRITE);
            } else if (graphicsFeature == graphicsFeatureFactory.SPRITE_QUARTER_ROTATION_GRAPHICS) {
                stringBuffer.append(this.QUARTER);
                stringBuffer.append(this.SPRITE);
            } else {
                throw new jre.lang.JavaException("None/Unknown Sub Image Resource Type Specified");
            }
        } else if (OpenGLFeatureUtil.getInstance().isAnyThreed()) {
            stringBuffer.append(CanvasStrings.getInstance().OBJ_MODEL);
        } else {
            throw new jre.lang.JavaException("None/Unknown Main Image Resource Type Specified");
        }
        return Std.string(stringBuffer);
    }

    public function getName() : String {
        return this.name;
    }

}

