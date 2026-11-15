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
package org.allbinary.game.behavior.topview.placement;

import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.mapeditor.core.TileLayer;
import org.mapeditor.core.TiledMap;

class PropsTileMapPlacementVisitor extends TileMapPlacementVisitor {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final randomFactory : MyRandomFactory = MyRandomFactory.getInstance();
    public override function visit(lastMap : TiledMap, mapData : haxe.ds.Vector<haxe.ds.Vector<Int>>) : Void {
        final layerIndex : Int = 0;
        final tileLayer : TileLayer = ((cast lastMap.getLayer(layerIndex) : TileLayer));
        final mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>> = tileLayer.getMapArray();
        final size : Int = mapData.length;
        final size2 : Int = mapData[0].length;
        for (index in 0...size) {
            for (index2 in 0...size2) {
                if (mapArray[index][index2] == 14) {
                } else {
                    this.visit2(mapArray, mapData, index, index2);
                }
                if (index % 7 == 0) {
                    if (mapArray[index][index2] == 19) {
                        final randomInt : Int = this.randomFactory.getAbsoluteNextIntAllowZero(3);
                        if (randomInt == 0) {
                            mapData[index][index2] = 1;
                        } else if (randomInt == 1) {
                            mapData[index][index2] = 81;
                        } else if (randomInt == 2) {
                            mapData[index][index2] = 97;
                        }
                    } else if (mapArray[index][index2] == 17) {
                        final randomInt : Int = this.randomFactory.getAbsoluteNextIntAllowZero(3);
                        if (randomInt == 0) {
                            mapData[index][index2] = 17;
                        } else if (randomInt == 1) {
                            mapData[index][index2] = 81;
                        } else if (randomInt == 2) {
                            mapData[index][index2] = 97;
                        }
                    }
                }
                if (index2 % 7 == 0) {
                    if (mapArray[index][index2] == 34) {
                        final randomInt : Int = this.randomFactory.getAbsoluteNextIntAllowZero(4);
                        if (randomInt == 0) {
                            mapData[index][index2] = 33;
                        } else if (randomInt == 1) {
                            mapData[index][index2] = 65;
                        } else if (randomInt == 2) {
                            mapData[index][index2] = 81;
                        } else if (randomInt == 3) {
                            mapData[index][index2] = 97;
                        }
                    }
                }
            }
        }
    }

    public function visit2(mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>>, mapData : haxe.ds.Vector<haxe.ds.Vector<Int>>, index : Int, index2 : Int) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        var countX : Int = 0;
        var countY : Int = 0;
        var index3 : Int = index - 1;
        {
            var index4 : Int = index2 - 1;
            while (index4 > 0) {
            index3--;
            if (index3 < 0 || index4 < 0) {
                return;
            }
            if (mapArray[index3][index4] != 14 || mapData[index3][index4] != 0) {
                if (countX > 10 && countY > 10) {
                    for (index5 in index3 + 1...index - 1) {
                        for (index6 in index4 + 1...index2 - 1) {
                            if (mapArray[index5][index6] != 14 || mapData[index5][index6] != 0) {
                                return;
                            }
                        }
                    }
                    final x : Int = index - (Std.int(countX / 2));
                    final y : Int = index2 - (Std.int(countY / 2));
                    if (x >= 0 && y >= 0 && x < mapData.length && y < mapData[0].length) {
                    }
                }
                return;
            }
            countY++;
            countX++;
                index4--;
            }
        }
    }

    public function new() {
        super();
    }
}

