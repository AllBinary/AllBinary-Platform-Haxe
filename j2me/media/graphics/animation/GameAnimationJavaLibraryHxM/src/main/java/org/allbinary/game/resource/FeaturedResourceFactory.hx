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
package org.allbinary.game.resource;

import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureControlledInterface;
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class FeaturedResourceFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final ANIMATION_FEATURES : String = "Animation Features: Vector: ";
    private final IMAGE_LABEL : String = " Image: ";
    private final IMAGE_GRAPHICS_ARRAY : String = "Image Array: ";
    private final IMAGE_GRAPHICS_ROTATION : String = "Image Rotate: ";
    private final SPRITE_QUARTER : String = " Sprite Quarter: ";
    private final SPRITE_FULL : String = " Sprite Full: ";
    private final IS_LOADING_LEVEL_LABEL : String = " isLoadingLevel ";
    private final IS_FEATURE : String = " isFeature: ";
    private final GAME_FEATURE_CONTROLLED : String = "GameFeatureControlledInterface: ";
    // throws Exception
    public function init(level : Int) : Void {
        var size : Int = this.list.size();
        for (index in 0...size) {
            var featureInterface : GameFeatureControlledInterface = (cast this.list.objectArray[index] : GameFeatureControlledInterface);
            var isLoadingLevel : Bool = featureInterface.isLoadingLevel(level);
            var isFeature : Bool = featureInterface.isFeature();
            this.logUtil.putF(new StringMaker().append(this.GAME_FEATURE_CONTROLLED).append(featureInterface.toString()).append(this.IS_LOADING_LEVEL_LABEL).append(ResourceLoadingLevelFactory.getInstance().getLevelString(level)).append(CommonSeps.getInstance().COLON_SEP).appendboolean(isLoadingLevel).append(this.IS_FEATURE).appendboolean(isFeature).toString(), this, this.commonStrings.INIT);
            if (isLoadingLevel && isFeature) {
                featureInterface.init(level);
            }
        }
        var features : Features = Features.getInstance();
        var graphicsFeatureFactory : GraphicsFeatureFactory = GraphicsFeatureFactory.getInstance();
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.ANIMATION_FEATURES);
        stringBuffer.appendboolean(features.isFeature(graphicsFeatureFactory.VECTOR_GRAPHICS));
        stringBuffer.append(this.IMAGE_LABEL);
        stringBuffer.appendboolean(features.isFeature(graphicsFeatureFactory.IMAGE_GRAPHICS));
        this.logUtil.putF(stringBuffer.toString(), this, this.commonStrings.INIT);
        if (features.isFeature(graphicsFeatureFactory.IMAGE_GRAPHICS)) {
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append(this.IMAGE_GRAPHICS_ARRAY);
            stringBuffer.appendboolean(features.isFeature(graphicsFeatureFactory.IMAGE_TO_ARRAY_GRAPHICS));
            stringBuffer.append(this.IMAGE_GRAPHICS_ROTATION);
            stringBuffer.appendboolean(features.isFeature(graphicsFeatureFactory.IMAGE_TO_ARRAY_GRAPHICS));
            stringBuffer.append(this.SPRITE_QUARTER);
            stringBuffer.appendboolean(features.isFeature(graphicsFeatureFactory.SPRITE_QUARTER_ROTATION_GRAPHICS));
            stringBuffer.append(this.SPRITE_FULL);
            stringBuffer.appendboolean(features.isFeature(graphicsFeatureFactory.SPRITE_FULL_GRAPHICS));
            this.logUtil.putF(stringBuffer.toString(), this, this.commonStrings.INIT);
        }
    }

    public function clear() : Void {
        this.list.clear();
    }

    public function add(featureInterface : GameFeatureControlledInterface) : Void {
        this.logUtil.putF(new StringMaker().append(CommonLabels.getInstance().START_LABEL).append(StringUtil.getInstance().toString(featureInterface)).toString(), this, this.commonStrings.ADD);
        this.list.add(featureInterface);
    }

    public function getList() : BasicArrayList {
        return this.list;
    }

}

