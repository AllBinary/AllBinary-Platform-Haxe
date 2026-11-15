// Generated Code Do Not Modify
package org.allbinary.logic.math.permutations;

import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.visitor.Visitor;
import org.allbinary.string.CommonSeps;

class IntPermutationVisitor extends Visitor {
    public final data : haxe.ds.Vector<Int>;
    public function new(data : haxe.ds.Vector<Int>) {
        super();
        this.data = data;
    }

    private var stringBuilder : StringMaker = new StringMaker();
    public override function visit(anyType : Any) : Any {
        this.stringBuilder.delete(0, stringBuilder.length());
        this.print(this.data, stringBuilder);
        return NullUtil.getInstance().NULL_OBJECT;
    }

    public function print(...args : Dynamic) : Dynamic {
        if (args.length == 1) {
            this.print_intArray(args[0]);
            return null;
        }
        if (args.length == 2) {
            this.print_intArray_StringMaker(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: print");
    }

    public function print_intArray(data : haxe.ds.Vector<Int>) : Void {
        final stringBuilder : StringMaker = new StringMaker();
        this.print(data, stringBuilder);
    }

    public function print_intArray_StringMaker(data : haxe.ds.Vector<Int>, stringBuilder : StringMaker) : Void {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final size : Int = data.length;
        for (i in 0...size) {
            stringBuilder.appendint(data[i]);
            stringBuilder.append(commonSeps.SPACE);
        }
        trace(Std.string(stringBuilder));
    }

}

