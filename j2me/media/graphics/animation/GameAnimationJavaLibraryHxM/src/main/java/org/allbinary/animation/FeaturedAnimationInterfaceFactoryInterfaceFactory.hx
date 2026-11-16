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
package org.allbinary.animation;

import org.allbinary.animation.resource.FeatureResourceAnimationInterfaceFactoryInterface;
import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.game.resource.FeaturedResourceFactory;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.RectangleFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class FeaturedAnimationInterfaceFactoryInterfaceFactory extends FeaturedResourceFactory {
    private static var INSTANCE : FeaturedAnimationInterfaceFactoryInterfaceFactory = new FeaturedAnimationInterfaceFactoryInterfaceFactory();
    public function new() {
        super();
    }

    public static function getInstance() : FeaturedAnimationInterfaceFactoryInterfaceFactory {
        return FeaturedAnimationInterfaceFactoryInterfaceFactory.INSTANCE;
    }

    // throws Exception
    public function getRectangle(resource : String) : Rectangle {
        return this.getRectangleXY(resource, 0, 0);
    }

    // throws Exception
    public function getRectangleXY(resource : String, x : Int, y : Int) : Rectangle {
        final pointFactory : PointFactory = PointFactory.getInstance();
        final list : BasicArrayList = this.getList();
        final scale : Int = jre.lang.JavaObject.intValue(GameConfigurationCentral.getInstance().SCALE.getValue());
        final size : Int = this.getList().size();
        for (index in 0...size) {
            final featureInterface : FeatureResourceAnimationInterfaceFactoryInterface = (cast list.objectArray[index] : FeatureResourceAnimationInterfaceFactoryInterface);
            if (featureInterface.isFeature()) {
                final rectangle : Rectangle = featureInterface.getRectangle(resource);
                if (rectangle != RectangleFactory.SINGLETON) {
                    return new Rectangle(pointFactory.createXY(x, y), ((rectangle.getWidth() * scale) >> 1), ((rectangle.getHeight() * scale) >> 1));
                }
            }
        }
        throw new jre.lang.JavaException(Std.string(new StringMaker().append("No rectangle available for current feature selection or Resource: ").append(resource)));
    }

    // throws Exception
    public function getProcedural(resource : String) : ProceduralAnimationInterfaceFactoryInterface {
        return (cast this.getBasicAnimationInterfaceFactoryInstance(resource) : ProceduralAnimationInterfaceFactoryInterface);
    }

    // throws Exception
    public function get(resource : String) : AnimationInterfaceFactoryInterface {
        return (cast this.getBasicAnimationInterfaceFactoryInstance(resource) : AnimationInterfaceFactoryInterface);
    }

    // throws Exception
    private function getBasicAnimationInterfaceFactoryInstance(resource : String) : BasicAnimationInterfaceFactoryInterface {
        final list : BasicArrayList = this.getList();
        final resourceTypeAvailableList : BasicArrayList = new BasicArrayListD();
        var size : Int = this.getList().size();
        var featureInterface : FeatureResourceAnimationInterfaceFactoryInterface = null;
        var animationInterfaceFactoryInterface : BasicAnimationInterfaceFactoryInterface = null;
        for (index in 0...size) {
            featureInterface = (cast list.objectArray[index] : FeatureResourceAnimationInterfaceFactoryInterface);
            if (featureInterface.isFeature()) {
                resourceTypeAvailableList.add(featureInterface);
                animationInterfaceFactoryInterface = featureInterface.getBasicAnimationInterfaceFactoryInstance(resource);
                if (animationInterfaceFactoryInterface != NullAnimationFactory.NULL_NOT_FOR_USE_ANIMATION_FACTORY) {
                    return animationInterfaceFactoryInterface;
                }
            }
        }
        if (resourceTypeAvailableList.size() > 0) {
            final NO_ANIMATION_AVAILABLE_FROM : String = "No animation available from: ";
            final FOR_FACTORIES : String = " factories: ";
            final FOR_RESOURCE : String = " for Resource: ";
            final HAS_KEY : String = " has: ";
            final RESOURCES_LABEL : String = " resources ";
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(NO_ANIMATION_AVAILABLE_FROM);
            stringBuffer.appendint(resourceTypeAvailableList.size());
            stringBuffer.append(CommonSeps.getInstance().FORWARD_SLASH);
            stringBuffer.appendint(size);
            stringBuffer.append(FOR_FACTORIES);
            final size2 : Int = resourceTypeAvailableList.size();
            for (index in 0...size2) {
                stringBuffer.append(Std.string(resourceTypeAvailableList.get(index)));
                stringBuffer.append(CommonSeps.getInstance().COMMA_SEP);
            }
            stringBuffer.append(FOR_RESOURCE);
            stringBuffer.append(resource);
            for (index in 0...size) {
                stringBuffer.append(CommonSeps.getInstance().NEW_LINE);
                featureInterface = (cast list.objectArray[index] : FeatureResourceAnimationInterfaceFactoryInterface);
                if (featureInterface.isFeature()) {
                    stringBuffer.append(StringUtil.getInstance().toString(featureInterface));
                    stringBuffer.append(HAS_KEY);
                    stringBuffer.appendint(featureInterface.getHashtable().size());
                    stringBuffer.append(RESOURCES_LABEL);
                }
            }
            throw new jre.lang.JavaException(Std.string(stringBuffer));
        } else {
            final stringBuffer : StringMaker = new StringMaker();
            for (index in 0...size) {
                featureInterface = (cast list.objectArray[index] : FeatureResourceAnimationInterfaceFactoryInterface);
                stringBuffer.append(Std.string(featureInterface));
                stringBuffer.append(CommonSeps.getInstance().SPACE);
            }
            final result : String = Std.string(stringBuffer);
            stringBuffer.delete(0, stringBuffer.length());
            throw new jre.lang.JavaException(Std.string(stringBuffer.append("No feature resource type available for Resource: ").append(resource).append(" Resource Factories Available: ").append(result)));
        }
    }

}

