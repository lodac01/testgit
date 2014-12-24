/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Exception;

/**
 *
 * @author earthzy
 */
public class bankException extends Exception{
    public  bankException(){
        super("Unknow Exception");
    }
    public  bankException(String msg){
        super(msg);
    }
    
}
