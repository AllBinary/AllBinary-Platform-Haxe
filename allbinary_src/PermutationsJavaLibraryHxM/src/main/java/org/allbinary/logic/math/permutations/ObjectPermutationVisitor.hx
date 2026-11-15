// Generated Code Do Not Modify
package org.allbinary.logic.math.permutations;

import org.allbinary.TsUtil;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.visitor.Visitor;
import org.allbinary.string.CommonSeps;

class ObjectPermutationVisitor extends Visitor {
    public final data : haxe.ds.Vector<Any>;
    public function new(data : haxe.ds.Vector<Any>) {
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
            this.print_AnyArray(args[0]);
            return null;
        }
        if (args.length == 2) {
            this.print_AnyArray_StringMaker(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: print");
    }

    public function print_AnyArray(data : haxe.ds.Vector<Any>) : Void {
        final stringBuilder : StringMaker = new StringMaker();
        this.print(data, stringBuilder);
    }

    public function print_AnyArray_StringMaker(data : haxe.ds.Vector<Any>, stringBuilder : StringMaker) : Void {
        final tsUtil : TsUtil = TsUtil.getInstance();
        final size : Int = data.length;
        for (i in 0...size) {
            stringBuilder.appendint(Std.int(tsUtil.hashCode(data[i])));
            stringBuilder.append(CommonSeps.getInstance().SPACE);
        }
        trace(Std.string(stringBuilder));
    }

}

