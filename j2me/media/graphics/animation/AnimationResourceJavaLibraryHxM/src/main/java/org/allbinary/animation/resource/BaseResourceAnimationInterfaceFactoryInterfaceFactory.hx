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
package org.allbinary.animation.resource;

import org.allbinary.animation.BasicAnimationInterfaceFactoryInterface;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.game.resource.ResourceLoadingLevelFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.RectangleFactory;
import org.allbinary.image.ImageCache;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;

class BaseResourceAnimationInterfaceFactoryInterfaceFactory implements FeatureResourceAnimationInterfaceFactoryInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final hashtable : ABHashtable<Any, Any>;
    private final rectangleHashtable : ABHashtable<Any, Any>;
    private final rectangleArrayOfArraysHashtable : ABHashtable<Any, Any>;
    private final name : String;
    private var initialized : Bool = false;
    public function new(name : String, hashtable : ABHashtable<Any, Any>, rectangleHashtable : ABHashtable<Any, Any>, rectangleArrayHashtable : ABHashtable<Any, Any>) {
        this.hashtable = hashtable;
        this.rectangleHashtable = rectangleHashtable;
        this.rectangleArrayOfArraysHashtable = rectangleArrayHashtable;
        this.name = name;
    }

    public function getName() : String {
        return this.name;
    }

    // throws Exception
    public function init(level : Int) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        this.logUtil.putF(new StringMaker().append("Available List of Animations: ").append(this.hashtable.toString()).toString(), this, commonStrings.INIT);
        this.setInitialized(true);
    }

    // throws Exception
    public function initImageCache(imageCache : ImageCache, level : Int) : Void {
    }

    // throws Exception
    public function add(resource : String, animationInterfaceFactoryInterface : BasicAnimationInterfaceFactoryInterface) : Void {
        if (this.hashtable.containsKey((cast resource : Any))) {
            throw new haxe.Exception(new StringMaker().append("Resource Already Created: ").append(resource).toString());
        }
        this.hashtable.put(resource, animationInterfaceFactoryInterface);
    }

    // throws Exception
    public function getBasicAnimationInterfaceFactoryInstance(resource : String) : BasicAnimationInterfaceFactoryInterface {
        final basicAnimationInterfaceFactoryInterfaceCanBeNull : Any = this.hashtable.get(resource);
        if (basicAnimationInterfaceFactoryInterfaceCanBeNull == null) {
            return NullAnimationFactory.NULL_NOT_FOR_USE_ANIMATION_FACTORY;
        }
        return (cast basicAnimationInterfaceFactoryInterfaceCanBeNull : BasicAnimationInterfaceFactoryInterface);
    }

    // throws Exception
    public function getRectangle(resource : String) : Rectangle {
        final rectangleCanBeNull : Any = this.rectangleHashtable.get(resource);
        if (rectangleCanBeNull == null) {
            return RectangleFactory.SINGLETON;
        }
        return (cast rectangleCanBeNull : Rectangle);
    }

    // throws Exception
    public function addRectangle(resource : String, rectangle : Rectangle) : Void {
        this.rectangleHashtable.put(resource, rectangle);
    }

    // throws Exception
    public function getRectangleArrayOfArrays(resource : String) : haxe.ds.Vector<haxe.ds.Vector<Rectangle>> {
        return (cast this.rectangleArrayOfArraysHashtable.get(resource) : haxe.ds.Vector<haxe.ds.Vector<Rectangle>>);
    }

    // throws Exception
    public function addRectangleArrayOfArrays(resource : String, rectangleArrayOfArrays : haxe.ds.Vector<haxe.ds.Vector<Rectangle>>) : Void {
        this.rectangleArrayOfArraysHashtable.put(resource, rectangleArrayOfArrays);
    }

    public function isFeature() : Bool {
        return false;
    }

    public function isLoadingLevel(level : Int) : Bool {
        final resourceLoadingLevelFactory : ResourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance();
        if (level == resourceLoadingLevelFactory.LOAD_ALL.getLevel()) {
            return true;
        } else {
            return false;
        }
    }

    public function toString() : String {
        return new StringMaker().append(Type.getClassName(Type.getClass(this))).append(CommonSeps.getInstance().SEMICOLON).append(CommonSeps.getInstance().SPACE).append(this.name).toString();
    }

    public function getHashtable() : ABHashtable<Any, Any> {
        return this.hashtable;
    }

    public function getRectangleHashtable() : ABHashtable<Any, Any> {
        return this.rectangleHashtable;
    }

    public function getRectangleArrayOfArraysHashtable() : ABHashtable<Any, Any> {
        return this.rectangleArrayOfArraysHashtable;
    }

    public function setInitialized(initialized : Bool) : Void {
        this.initialized = initialized;
    }

    public function isInitialized() : Bool {
        return this.initialized;
    }

}

