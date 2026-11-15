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
package org.allbinary.game.behavior.topview;

import org.allbinary.media.graphics.geography.map.MultiGeographicMapBehavior;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.physics.acceleration.GravityUtil;
import org.allbinary.game.physics.velocity.VelocityProperties;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;

class GeographicMapTopViewGameLayerBehavior1 extends GeographicMapTopViewLayerBehavior {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final gravityUtil : GravityUtil = GravityUtil.getInstance();
    private final geographicMapBehavior : MultiGeographicMapBehavior = new MultiGeographicMapBehavior();
    private final autoStepBlocks : Bool;
    private final offsetY : Int;
    private var previousGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    public function new(maxGravityActionIndex : Int, autoStepBlocks : Bool, offsetY : Int) {
        super(maxGravityActionIndex);
        this.autoStepBlocks = autoStepBlocks;
        this.offsetY = offsetY;
    }

    // throws Exception
    public override function gravity(velocityProperties : VelocityProperties, geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, geographicMapCellPosition : GeographicMapCellPosition) : Void {
        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            this.geographicMapBehavior.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition);
            final hasSolidBlock : Bool = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray);
            if (!hasSolidBlock) {
                this.gravityUtil.process(velocityProperties, this.gravityUtil.GAME_GRAVITY_VELOCITY);
                velocityProperties.limitXYToForwardAndReverseMaxVelocity();
                this.gravity();
            } else {
            }
        }
    }

    // throws Exception
    public function getPosition(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, layer : AllBinaryLayer, x : Int, y : Int) : GeographicMapCellPosition {
        final xCellPosition : Int = layer.getXP() + -x + layer.getWidth();
        final yCellPosition : Int = layer.getYP() + -y + layer.getHeight();
        return geographicMapInterfaceArray[0].getCellPositionAtXYNoThrow(xCellPosition, yCellPosition);
    }

    // throws Exception
    private function getLeftPosition(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, layer : AllBinaryLayer) : GeographicMapCellPosition {
        final xCellPosition : Int = layer.getXP();
        final yCellPosition : Int = layer.getYP() + layer.getHeight();
        return geographicMapInterfaceArray[0].getCellPositionAtXYNoThrow(xCellPosition, yCellPosition);
    }

    // throws Exception
    private function getRightPosition(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, layer : AllBinaryLayer) : GeographicMapCellPosition {
        final xCellPosition : Int = layer.getXP() + layer.getWidth();
        final yCellPosition : Int = layer.getYP() + layer.getHeight();
        return geographicMapInterfaceArray[0].getCellPositionAtXYNoThrow(xCellPosition, yCellPosition);
    }

    // throws Exception
    public override function getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, velocityProperties : VelocityProperties, layer : AllBinaryLayer, x : Int, y : Int) : GeographicMapCellPosition {
        final geographicMapCellPosition : GeographicMapCellPosition = this.getPosition(geographicMapInterfaceArray, layer, x, y);
        if (this.previousGeographicMapCellPosition != geographicMapCellPosition && geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            final possibleStepGeographicMapCellPosition : GeographicMapCellPosition = geographicMapCellPosition;
            final tiledLayer : AllBinaryTiledLayer = geographicMapInterfaceArray[0].getAllBinaryTiledLayer();
            if (possibleStepGeographicMapCellPosition.getColumn() > 0 && possibleStepGeographicMapCellPosition.getRow() > 0 && possibleStepGeographicMapCellPosition.getColumn() < tiledLayer.getColumns() && possibleStepGeographicMapCellPosition.getRow() < tiledLayer.getRows()) {
                this.geographicMapBehavior.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition);
                final hasSolidBlock : Bool = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray);
                if (hasSolidBlock) {
                    velocityProperties.getVelocityXBasicDecimalP().setint(0);
                    this.previousGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
                } else {
                    this.previousGeographicMapCellPosition = possibleStepGeographicMapCellPosition;
                    return possibleStepGeographicMapCellPosition;
                }
            }
        }
        this.previousGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    }

    // throws Exception
    public override function moveAndLand(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, geographicMapCellPosition : GeographicMapCellPosition, velocityProperties : VelocityProperties, layer : AllBinaryLayer, x : Int, y : Int) : Void {
        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            final topViewCharacterInterface : TopViewCharacterInterface = ((cast layer : TopViewCharacterInterface));
            topViewCharacterInterface.terrainMove(geographicMapInterfaceArray, geographicMapCellTypeArray, x, y);
        } else {
        }
    }

    // throws Exception
    public override function move(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, velocityProperties : VelocityProperties, layer : AllBinaryLayer, x : Int, y : Int) : Bool {
        final geographicMapCellPosition : GeographicMapCellPosition = this.getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer, x, y);
        this.moveAndLand(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer, x, y);
        if (geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            return false;
        } else {
            return true;
        }
    }

    // throws Exception
    public override function left(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, velocityProperties : VelocityProperties, layer : AllBinaryLayer) : Void {
        final geographicMapCellPosition : GeographicMapCellPosition = this.getLeftPosition(geographicMapInterfaceArray, layer);
        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            final possibleStepGeographicMapCellPosition : GeographicMapCellPosition = geographicMapInterfaceArray[0].getGeographicMapCellPositionFactory().getAt(geographicMapCellPosition.getColumn(), geographicMapCellPosition.getRow() - 1);
            this.geographicMapBehavior.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition);
            final hasSolidBlock : Bool = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray);
            if (hasSolidBlock) {
                if (this.autoStepBlocks) {
                    final topViewCharacterInterface : TopViewCharacterInterface = ((cast layer : TopViewCharacterInterface));
                    topViewCharacterInterface.leftp();
                } else {
                    velocityProperties.getVelocityXBasicDecimalP().setint(0);
                }
            } else {
                final topViewCharacterInterface : TopViewCharacterInterface = ((cast layer : TopViewCharacterInterface));
                topViewCharacterInterface.leftp();
            }
        }
    }

    // throws Exception
    public override function right(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, velocityProperties : VelocityProperties, layer : AllBinaryLayer) : Void {
        final geographicMapCellPosition : GeographicMapCellPosition = this.getRightPosition(geographicMapInterfaceArray, layer);
        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            final possibleStepGeographicMapCellPosition : GeographicMapCellPosition = geographicMapInterfaceArray[0].getGeographicMapCellPositionFactory().getAt(geographicMapCellPosition.getColumn(), geographicMapCellPosition.getRow() - 1);
            this.geographicMapBehavior.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition);
            final hasSolidBlock : Bool = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray);
            if (hasSolidBlock) {
                if (this.autoStepBlocks) {
                    final topViewCharacterInterface : TopViewCharacterInterface = ((cast layer : TopViewCharacterInterface));
                    topViewCharacterInterface.rightp();
                } else {
                    velocityProperties.getVelocityXBasicDecimalP().setint(0);
                }
            } else {
                final topViewCharacterInterface : TopViewCharacterInterface = ((cast layer : TopViewCharacterInterface));
                topViewCharacterInterface.rightp();
            }
        }
    }

}

