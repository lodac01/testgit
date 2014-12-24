/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Project.Model;

import java.text.DecimalFormat;

/**
 *
 * @author pichet
 */
public class Util {
    public static DecimalFormat df = new DecimalFormat("#,###,###,###.00");
    public static boolean isNumber(String n) {
        try {
            Long.parseLong(n) ;
            return true;
        } catch (NumberFormatException e) {
        }
        return false ;
    }

    public static boolean isCurrency(String n) {
        try {
            Double.parseDouble(n) ;
            return true;
        } catch (NumberFormatException e) {
        }
        return false ;
    }
}
