// Generated Code Do Not Modify
package org.allbinary.time;

import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.visitor.Visitor;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.ThreadObjectUtil;

class StupidTimer {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final nullUtil : NullUtil = NullUtil.getInstance();
    private final threadObjectUtil : ThreadObjectUtil = ThreadObjectUtil.getInstance();
    private function visitBool(visitorInterface : Visitor) : Bool {
        final result : Null<Bool> = (cast visitorInterface.visit(this.nullUtil.NULL_OBJECT) : Null<Bool>);
        final result2 : Bool = result;
        return result2;
    }

    // throws Exception
    public function visit(visitorInterface : Visitor, timeDelayHelper : TimeDelayHelper) : Void {
        var tookTooLong : Bool = false;
        final WAITING_FOR : String = "Waiting for: ";
        PreLogUtil.put(new StringMaker().append(WAITING_FOR).append(StringUtil.getInstance().toString(visitorInterface)).toString(), this, this.commonStrings.VISIT);
        var index : Int = 0;
        while (this.visitBool(visitorInterface)) {
            if (index % 10 == 0) {
                PreLogUtil.put(new StringMaker().append(WAITING_FOR).appendint(index).toString(), this, this.commonStrings.VISIT);
            }
            index++;
            // synchronized (this)
            {
                this.threadObjectUtil.waitObjectFor(this, 1800);
            }
            if (timeDelayHelper.isTimeTNT()) {
                tookTooLong = true;
                break;
            }
        }
        if (tookTooLong) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.VISIT, new haxe.Exception(new StringMaker().append("Took Too Long: ").append(StringUtil.getInstance().toString(visitorInterface)).toString()));
        } else {
            PreLogUtil.put(timeDelayHelper.toString(), this, this.commonStrings.VISIT);
        }
    }

    // throws Exception
    public function stopWaiting() : Void {
        // synchronized (this)
        {
            this.threadObjectUtil.notifyObject(this);
        }
    }

    public function new() {
    }
}

