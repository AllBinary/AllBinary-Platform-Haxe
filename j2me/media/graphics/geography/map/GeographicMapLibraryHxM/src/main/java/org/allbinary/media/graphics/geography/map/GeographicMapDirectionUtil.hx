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
package org.allbinary.media.graphics.geography.map;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.direction.Direction;
import org.allbinary.direction.DirectionFactory;
import org.allbinary.graphics.CellPosition;

class GeographicMapDirectionUtil {
    private static final instance : GeographicMapDirectionUtil = new GeographicMapDirectionUtil();
    public static function getInstance() : GeographicMapDirectionUtil {
        return GeographicMapDirectionUtil.instance;
    }

    public function new() {
    }

    private final MESSAGE : String = "Cell Position should have been cached!!!";
    // throws Exception
    public function getDirectionFromCellPositionToAdjacentCellPosition(fromGeographicMapCellPosition : GeographicMapCellPosition, toGeographicMapCellPosition : GeographicMapCellPosition) : Direction {
        var fromColumn : Int = fromGeographicMapCellPosition.getColumn();
        var fromRow : Int = fromGeographicMapCellPosition.getRow();
        var goColumn : Int = toGeographicMapCellPosition.getColumn();
        var goRow : Int = toGeographicMapCellPosition.getRow();
        var directionFactory : DirectionFactory = DirectionFactory.getInstance();
        if (fromColumn - 1 == goColumn) {
            return directionFactory.LEFT;
        } else if (fromColumn + 1 == goColumn) {
            return directionFactory.RIGHT;
        } else if (fromRow - 1 == goRow) {
            return directionFactory.UP;
        } else if (fromRow + 1 == goRow) {
            return directionFactory.DOWN;
        } else if (fromGeographicMapCellPosition == toGeographicMapCellPosition) {
            return directionFactory.NO_DIRECTION;
        } else if (fromRow == goRow && fromColumn == goColumn) {
            throw new haxe.Exception(this.MESSAGE);
        }
        return directionFactory.NOT_BORDERED_WITH;
    }

    // throws Exception
    public function getEightDirectionFromCellPositionToAdjacentCellPosition(fromGeographicMapCellPosition : GeographicMapCellPosition, toGeographicMapCellPosition : GeographicMapCellPosition) : Direction {
        var fromColumn : Int = fromGeographicMapCellPosition.getColumn();
        var fromRow : Int = fromGeographicMapCellPosition.getRow();
        var goColumn : Int = toGeographicMapCellPosition.getColumn();
        var goRow : Int = toGeographicMapCellPosition.getRow();
        var directionFactory : DirectionFactory = DirectionFactory.getInstance();
        if (fromRow == goRow) {
            if (fromColumn - 1 == goColumn) {
                return directionFactory.LEFT;
            } else if (fromColumn + 1 == goColumn) {
                return directionFactory.RIGHT;
            }
        } else if (fromRow - 1 == goRow) {
            if (fromColumn == goColumn) {
                return directionFactory.UP;
            }
            if (fromColumn - 1 == goColumn) {
                return directionFactory.UP_LEFT;
            } else if (fromColumn + 1 == goColumn) {
                return directionFactory.UP_RIGHT;
            }
        } else if (fromRow + 1 == goRow) {
            if (fromColumn == goColumn) {
                return directionFactory.DOWN;
            }
            if (fromColumn - 1 == goColumn) {
                return directionFactory.DOWN_LEFT;
            } else if (fromColumn + 1 == goColumn) {
                return directionFactory.DOWN_RIGHT;
            }
        } else if (fromGeographicMapCellPosition == toGeographicMapCellPosition) {
            return directionFactory.NO_DIRECTION;
        } else if (fromRow == goRow && fromColumn == goColumn) {
            throw new haxe.Exception(this.MESSAGE);
        }
        return directionFactory.NOT_BORDERED_WITH;
    }

    // throws Exception
    public function getDirectionFromCellPositionToCellPosition(fromGeographicMapCellPosition : GeographicMapCellPosition, toGeographicMapCellPosition : GeographicMapCellPosition) : Direction {
        var fromColumn : Int = fromGeographicMapCellPosition.getColumn();
        var fromRow : Int = fromGeographicMapCellPosition.getRow();
        var goColumn : Int = toGeographicMapCellPosition.getColumn();
        var goRow : Int = toGeographicMapCellPosition.getRow();
        var directionFactory : DirectionFactory = DirectionFactory.getInstance();
        if (fromColumn > goColumn) {
            return directionFactory.LEFT;
        } else if (fromColumn < goColumn) {
            return directionFactory.RIGHT;
        } else if (fromRow > goRow) {
            return directionFactory.UP;
        } else if (fromRow < goRow) {
            return directionFactory.DOWN;
        }
        final stringMaker : StringMaker = new StringMaker();
        final string : String = stringMaker.append(CellPosition.toStringCellPosition(fromGeographicMapCellPosition)).append(" == ").append(CellPosition.toStringCellPosition(toGeographicMapCellPosition)).toString();
        stringMaker.delete(0, stringMaker.length());
        throw new haxe.Exception(stringMaker.append("Error: ").append(string).toString());
    }

    private final ERROR : String = "Error: ";
    private final EQUAL : String = " == ";
    // throws Exception
    public function getEightDirectionFromCellPositionToCellPosition(fromGeographicMapCellPosition : GeographicMapCellPosition, toGeographicMapCellPosition : GeographicMapCellPosition) : Direction {
        var fromColumn : Int = fromGeographicMapCellPosition.getColumn();
        var fromRow : Int = fromGeographicMapCellPosition.getRow();
        var goColumn : Int = toGeographicMapCellPosition.getColumn();
        var goRow : Int = toGeographicMapCellPosition.getRow();
        var directionFactory : DirectionFactory = DirectionFactory.getInstance();
        if (fromGeographicMapCellPosition == toGeographicMapCellPosition) {
            return directionFactory.NO_DIRECTION;
        } else if (fromRow == goRow) {
            if (fromColumn > goColumn) {
                return directionFactory.LEFT;
            } else if (fromColumn < goColumn) {
                return directionFactory.RIGHT;
            }
        } else if (fromRow > goRow) {
            if (fromColumn > goColumn) {
                return directionFactory.UP_LEFT;
            } else if (fromColumn < goColumn) {
                return directionFactory.UP_RIGHT;
            } else if (fromColumn == goColumn) {
                return directionFactory.UP;
            }
        } else if (fromRow < goRow) {
            if (fromColumn > goColumn) {
                return directionFactory.DOWN_LEFT;
            } else if (fromColumn < goColumn) {
                return directionFactory.DOWN_RIGHT;
            } else if (fromColumn == goColumn) {
                return directionFactory.DOWN;
            }
        }
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.ERROR);
        stringBuffer.append(CellPosition.toStringCellPosition(fromGeographicMapCellPosition));
        stringBuffer.append(this.EQUAL);
        stringBuffer.append(CellPosition.toStringCellPosition(toGeographicMapCellPosition));
        throw new haxe.Exception(stringBuffer.toString());
    }

}

