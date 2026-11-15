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
package org.allbinary.layer;

import javax.microedition.lcdui.Graphics;
import org.allbinary.game.identification.BasicGroupFactory;
import org.allbinary.game.identification.Group;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.RectangleFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureUtil;
import org.allbinary.TsUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.math.PositionStrings;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.view.ViewPositionBase;
import org.allbinary.view.event.ViewPositionEvent;

class AllBinaryLayer extends Layer implements LayerInterface {
    public static final NULL_ALLBINARY_LAYER : AllBinaryLayer = new AllBinaryLayer(StringUtil.getInstance().EMPTY_STRING, RectangleFactory.SINGLETON, ViewPositionBase.NULL_VIEW_POSITION);
    public final viewPositionEvent : ViewPositionEvent;
    private var halfWidth : Int = 0;
    private var halfHeight : Int = 0;
    private final name : String;
    private var viewPosition : ViewPositionBase = ViewPositionBase.NULL_VIEW_POSITION;
    public function new(name : String, rectangle : Rectangle, viewPosition : ViewPositionBase) {
        super(rectangle.getWidth(), rectangle.getHeight());
        this.viewPositionEvent = new ViewPositionEvent(this);
        final localName : String = null;
        localName = Std.string(new StringMaker().append(name).append(CommonSeps.getInstance().COLON).append(StringTools.hex(TsUtil.getInstance().hashCode(this))));
        this.name = localName;
        final point : GPoint = rectangle.getPoint();
        this.setPosition(point.getX(), point.getY(), point.getZ());
        this.setHalfWidth((this.getWidth() >> 1));
        this.setHalfHeight((this.getHeight() >> 1));
        this.viewPosition = viewPosition;
        this.viewPosition.setAllbinaryLayer(this);
    }

    public override function setPosition(x : Int, y : Int, z : Int) : Void {
        super.setPosition(x, y, z);
    }

    public override function moveDXYZ(dx : Int, dy : Int, dz : Int) : Void {
        super.moveDXYZ(dx, dy, dz);
    }

    public override function getXP() : Int {
        return super.getXP();
    }

    public override function getYP() : Int {
        return super.getYP();
    }

    public override function getZP() : Int {
        return super.getZP();
    }

    public override function getWidth() : Int {
        return super.getWidth();
    }

    public override function getHeight() : Int {
        return super.getHeight();
    }

    public override function setVisible(visible : Bool) : Void {
        super.setVisible(visible);
    }

    public override function isVisible() : Bool {
        return super.isVisible();
    }

    public override function paint(graphics : Graphics) : Void {
        super.paint(graphics);
    }

    // throws Exception
    public function onChangeEvent(layerManagerEvent : ViewPositionEvent) : Void {
    }

    public override function paintThreed(graphics : Graphics) : Void {
    }

    public override function getX2() : Int {
        return this.getXP() + this.getWidth();
    }

    public override function getY2() : Int {
        return this.getYP() + this.getHeight();
    }

    public override function getZ2() : Int {
        return Std.int((this.getZP() + this.getDepth()));
    }

    public override function getName() : String {
        return this.name;
    }

    public function setHalfWidth(halfWidth : Int) : Void {
        this.halfWidth = halfWidth;
    }

    public override function getHalfWidth() : Int {
        return this.halfWidth;
    }

    public function setHalfHeight(halfHeight : Int) : Void {
        this.halfHeight = halfHeight;
    }

    public override function getHalfHeight() : Int {
        return this.halfHeight;
    }

    public function getHalfDepth() : Int {
        return Std.int(Std.int(this.getDepth()) / 2);
    }

    public function getViewPosition() : ViewPositionBase {
        return this.viewPosition;
    }

    public function setViewPosition(viewPosition : ViewPositionBase) : Void {
        this.viewPosition = viewPosition;
    }

    public override function getGroupInterface() : haxe.ds.Vector<Group> {
        return BasicGroupFactory.getInstance().NONE_ARRAY;
    }

    public override function implmentsTickableInterface() : Bool {
        return false;
    }

    public override function implmentsGameInputInterface() : Bool {
        return false;
    }

    public override function implmentsArtificialIntelligenceCompositeInterface() : Bool {
        return false;
    }

    public override function implmentsCollidableInterface() : Bool {
        return false;
    }

    public function implementsThreedInterface() : Bool {
        return OpenGLFeatureUtil.getInstance().isAnyThreed();
    }

    public override function getType() : Int {
        return -1;
    }

    public function getMultiPlayerType() : Int {
        return -1;
    }

    private static final TYPE : String = "Type: ";
    public override function toStringAppend(stringBuffer : StringMaker) : Void {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final positionStrings : PositionStrings = PositionStrings.getInstance();
        final commonLabels : CommonLabels = CommonLabels.getInstance();
        stringBuffer.append(this.getName());
        stringBuffer.append(commonSeps.COLON);
        stringBuffer.append(AllBinaryLayer.TYPE);
        stringBuffer.appendint(this.getType());
        stringBuffer.append(commonSeps.SPACE);
        stringBuffer.append(positionStrings.X_LABEL);
        stringBuffer.appendint(this.getXP());
        stringBuffer.append(commonSeps.SPACE);
        stringBuffer.append(positionStrings.Y_LABEL);
        stringBuffer.appendint(this.getYP());
        stringBuffer.append(commonSeps.SPACE);
        stringBuffer.append(positionStrings.Z_LABEL);
        stringBuffer.appendint(this.getZP());
        stringBuffer.append(commonSeps.SPACE);
        stringBuffer.append(commonLabels.WIDTH_LABEL);
        stringBuffer.appendint(this.getWidth());
        stringBuffer.append(commonSeps.SPACE);
        stringBuffer.append(commonLabels.HEIGHT_LABEL);
        stringBuffer.appendint(this.getHeight());
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        this.toStringAppend(stringBuffer);
        return Std.string(stringBuffer);
    }

}

