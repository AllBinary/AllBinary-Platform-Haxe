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
package org.allbinary.logic.math.permutations;

import org.allbinary.logic.util.visitor.Visitor;
import org.allbinary.logic.string.StringMaker;

class OrderedIntArrayPermutationUtil {
    private static final instance : OrderedIntArrayPermutationUtil = new OrderedIntArrayPermutationUtil();
    public static function getInstance() : OrderedIntArrayPermutationUtil {
        return OrderedIntArrayPermutationUtil.instance;
    }

    private final TOTAL_ITERATIONS_TABLE : String = "Total Iterations: ";
    private final FINISHED : String = "\nFINISHED";
    public function new() {
    }

    public function getNext(data : haxe.ds.Vector<Int>) : Void {
        var length : Int = data.length;
        var i : Int = length - 1;
        while (data[i - 1] >= data[i]) {
            i = i - 1;
        }
        var j : Int = length;
        while (data[j - 1] <= data[i - 1]) {
            j = j - 1;
        }
        this.swap(data, i - 1, j - 1);
        i++;
        j = length;
        while (i < j) {
            this.swap(data, i - 1, j - 1);
            i++;
            j--;
        }
    }

    public function swap(data : haxe.ds.Vector<Int>, a : Int, b : Int) : Void {
        var temp : Int = data[a];
        data[a] = data[b];
        data[b] = temp;
    }

    public function factorial(dataLength : Int) : haxe.Int64 {
        var temp : haxe.Int64 = 1;
        if (dataLength > 1) {
            for (i in 1...dataLength + 1) {
                temp *= haxe.Int64.ofInt(i);
            }
        }
        return temp;
    }

    public function generate(data : haxe.ds.Vector<Int>, visitor : Visitor) : Void {
        var iterations : haxe.Int64 = this.factorial(data.length);
        trace(this.TOTAL_ITERATIONS_TABLE);
        trace(iterations);
        for (count in 0...iterations - 1) {
            this.getNext(data);
            visitor.visit(this);
        }
        trace(this.FINISHED);
    }

    public static function main(args : haxe.ds.Vector<String>) : Void {
        final TOTAL : Int = 3;
        final data : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...TOTAL) 0]);
        for (i in 0...TOTAL) {
            data[i] = i;
        }
        final permutationVisitor : IntPermutationVisitor = new IntPermutationVisitor(data);
        final ORIGINAL_DATA_LABEL : String = "Original Data: ";
        trace(ORIGINAL_DATA_LABEL);
        permutationVisitor.print(data, new StringMaker());
        OrderedIntArrayPermutationUtil.getInstance().generate(data, permutationVisitor);
    }

}

