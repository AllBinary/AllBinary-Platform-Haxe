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
package org.allbinary.logic.communication.smtp.queue;

//import javax.mail.Transport;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.smtp.EmailInterface;
import org.allbinary.logic.util.queue.BasicQueue;

class BasicEmailQueue extends BasicQueue implements EmailQueueInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : BasicEmailQueue = new BasicEmailQueue();
    private static var basicEmailQueue : BasicEmailQueue = null;
    public function new() {
        super();
    }

    // synchronized
    public static function getInstance() : BasicEmailQueue {
        if (BasicEmailQueue.basicEmailQueue == null) {
            BasicEmailQueue.basicEmailQueue = new BasicEmailQueue();
        }
        return BasicEmailQueue.basicEmailQueue;
    }

    // throws Exception
    // synchronized
    public function offer(emailInterface : EmailInterface) : Bool {
        this.offer((cast emailInterface : Any));
        this.post(emailInterface);
        return true;
    }

    // synchronized
    private function remove(emailInterface : EmailInterface) : Void {
        this.remove((cast emailInterface : Any));
    }

    // synchronized
    public function remove() : EmailInterface {
        return null;
    }

    // throws Exception
    // synchronized
    private function post(emailInterface : EmailInterface) : Void {
        if (this.send(emailInterface)) {
            this.remove(emailInterface);
            this.processAllUnsent();
        }
    }

    // throws Exception
    // synchronized
    public function processAllUnsent() : Void {
        final size : Int = queueVector.size();
        for (index in 0...size) {
            var emailInterface : EmailInterface = (cast queueVector.get(index) : EmailInterface);
            if (this.send(emailInterface)) {
                this.remove(emailInterface);
                this.processAllUnsent();
            }
        }
    }

    // synchronized
    private function send(emailInterface : EmailInterface) : Bool {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
                this.logUtil.putF("Sending: " + emailInterface.log(), this, "send");
            }
            Transport.send(emailInterface.getMimeMessage());
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
                this.logUtil.putF("Email Send Debug: " + emailInterface.getDebugInfo(), this, "send");
            }
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
                this.logUtil.put("Failed Email Send Debug: " + emailInterface.getDebugInfo(), this, "send", e);
            }
            return false;
        }
    }

}

